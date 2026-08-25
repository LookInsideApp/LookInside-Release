#!/usr/bin/env python3

from __future__ import annotations

import importlib.util
import subprocess
import tempfile
import unittest
from pathlib import Path


SCRIPT_PATH = Path(__file__).with_name("build_and_publish.py")
SPEC = importlib.util.spec_from_file_location("build_and_publish", SCRIPT_PATH)
assert SPEC and SPEC.loader
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class BuildArchiveTests(unittest.TestCase):
    def test_builds_the_requested_commit_instead_of_default_branch_head(self) -> None:
        with tempfile.TemporaryDirectory() as temporary_directory:
            root = Path(temporary_directory)
            repository = root / "source"
            repository.mkdir()
            subprocess.run(["git", "init", "-q", "-b", "main"], cwd=repository, check=True)
            subprocess.run(["git", "config", "user.name", "Test"], cwd=repository, check=True)
            subprocess.run(
                ["git", "config", "user.email", "test@example.com"], cwd=repository, check=True
            )

            (repository / "value.txt").write_text("first\n")
            subprocess.run(["git", "add", "value.txt"], cwd=repository, check=True)
            subprocess.run(["git", "commit", "-qm", "first"], cwd=repository, check=True)
            first_sha = subprocess.run(
                ["git", "rev-parse", "HEAD"],
                cwd=repository,
                check=True,
                capture_output=True,
                text=True,
            ).stdout.strip()

            (repository / "value.txt").write_text("second\n")
            subprocess.run(["git", "commit", "-qam", "second"], cwd=repository, check=True)

            source = {
                "id": "fixture",
                "repository": str(repository),
                "buildCommand": "mkdir -p build && cp value.txt build/artifact.zip",
                "artifactPath": "build/artifact.zip",
            }
            workdir = root / "work"
            workdir.mkdir()

            artifact = MODULE.build_archive(
                source,
                token=None,
                workdir=workdir,
                source_ref=first_sha,
            )

            self.assertEqual(artifact.read_text(), "first\n")


if __name__ == "__main__":
    unittest.main()
