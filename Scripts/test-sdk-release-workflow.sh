#!/bin/bash

set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
workflow_path="$root_dir/.github/workflows/build-and-publish.yml"

if grep -n $'\t' "$workflow_path" >/dev/null; then
	echo "workflow contains tab indentation" >&2
	exit 1
fi

assert_contains() {
	local needle="$1"
	grep -F -- "$needle" "$workflow_path" >/dev/null
}

assert_contains "parent-sdk-release"
assert_contains 'run-name: ${{ github.event.client_payload.release_id }}'
assert_contains 'SOURCE_REF="${{ github.event.client_payload.source_ref }}"'
assert_contains 'BUILD_NUMBER="${{ github.event.client_payload.build_number }}"'
assert_contains 'SERVER_MARKETING_VERSION: ${{ steps.context.outputs.version }}'
assert_contains 'SERVER_BUILD_NUMBER: ${{ steps.context.outputs.build_number }}'
assert_contains '--source-ref "${{ steps.context.outputs.source_ref }}"'
assert_contains 'refs/tags/release/sdk/$VERSION'
assert_contains 'git push origin HEAD:main "$VERSION"'
assert_contains 'Built from LookInside-Server@$SOURCE_REF'
assert_contains 'without leading zeroes'
assert_contains 'bash Scripts/run-gitleaks.sh .'
assert_contains 'bash Scripts/scan-private-keys.sh "${assets[@]}"'

echo "SDK release workflow tests passed"
