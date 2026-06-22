"""Test configuration for source-tree execution.

Allows `python -m pytest` to run from a fresh checkout before editable install.
"""
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))
