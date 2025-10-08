#!/bin/env bash

# Grab the last non-empty line from the "t show -R" output
# (the description row) and print it for Polybar.
awk '
    /^[[:space:]]*Started[[:space:]]/ { in_block = 1; next }
    in_block && NF { last = $0 }
    END { if (last) print last }
' <(t show -R)
