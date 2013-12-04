#!/usr/bin/env bash
# need: pyflakes, pep8

pyflakes $1
echo "## pyflakes above, pep8 below ##"
pep8 --repeat $1
