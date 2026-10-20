#!/usr/bin/env python3
"""Script kiểm tra naming convention minh họa Cơ chế 5 (custom_script).
Contract: In ra stdout mảng JSON các vi phạm tìm thấy.
"""
import json
import sys
from pathlib import Path

findings = []
repo_root = Path(__file__).resolve().parent.parent.parent
target_dir = repo_root / "lib" / "pages" / "demo_showcase"

if target_dir.exists():
    for f in target_dir.glob("**/*.dart"):
        if not f.name.endswith("_view.dart"):
            rel = f.relative_to(repo_root).as_posix()
            findings.append({
                "file": rel,
                "line": 1,
                "message": f"File '{f.name}' vi phạm naming convention: widget màn hình phải kết thúc bằng '_view.dart'"
            })

print(json.dumps(findings))
sys.exit(0)
