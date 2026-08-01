#!/usr/bin/env python3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ACTIVE_RECIPES = ("secblue-nvidia.yml", "secblue.yml")
ACTIVE_SCRIPTS = ("installxwaylandsatellite.sh", "installrioterm.sh")

for recipe_name in ACTIVE_RECIPES:
    recipe = (ROOT / "recipes" / recipe_name).read_text()
    assert "type: rpm-ostree" not in recipe, f"{recipe_name} still uses rpm-ostree"
    assert "  - type: dnf\n    repos:\n      files:" in recipe, f"{recipe_name} has invalid dnf repos schema"
    assert "    install:\n      packages:" in recipe, f"{recipe_name} has invalid dnf install schema"

for script_name in ACTIVE_SCRIPTS:
    script = (ROOT / "files" / "scripts" / script_name).read_text()
    assert "rpm-ostree" not in script, f"{script_name} still invokes rpm-ostree during the container build"
