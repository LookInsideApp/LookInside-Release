#!/bin/bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKFLOW_PATH="$ROOT_DIR/.github/workflows/sign-auth-server.yml"

if grep -n $'\t' "$WORKFLOW_PATH" >/dev/null; then
	echo "workflow contains tab indentation" >&2
	grep -n $'\t' "$WORKFLOW_PATH" >&2
	exit 1
fi

assert_contains() {
	local needle="$1"
	grep -F -- "$needle" "$WORKFLOW_PATH" >/dev/null
}

assert_contains '        with:'
assert_contains 'parent-auth-release'
assert_contains 'run-name: ${{ github.event.client_payload.release_id }}'
assert_contains 'SOURCE_REF="${{ github.event.client_payload.source_ref }}"'
assert_contains 'refs/tags/release/app/$VERSION'
assert_contains 'GH_TOKEN: ${{ github.token }}'
assert_contains 'token: ${{ github.token }}'
assert_contains 'RELEASE_REF="${{ github.event.client_payload.release_ref }}"'
assert_contains 'ref: ${{ needs.prepare.outputs.release_ref }}'
assert_contains '      - name: Validate app architectures'
assert_contains 'for required in arm64 x86_64; do'
assert_contains 'MARKETING_VERSION: ${{ needs.prepare.outputs.version }}'
assert_contains '      - name: Tag published Auth source'
assert_contains 'AUTH_REF: ${{ needs.prepare.outputs.source_ref }}'
assert_contains 'repos/$AUTH_REPOSITORY/commits/$VERSION'
assert_contains '-f ref="refs/tags/$VERSION"'
assert_contains 'Published Auth tag $VERSION does not resolve to $AUTH_REF.'

echo "auth server release workflow tests passed"
