#!/bin/bash
# Validate spec completeness

echo "Validating specs..."

for dir in specs/*/; do
    if [ -d "$dir" ]; then
        name=$(basename "$dir")
        echo "Checking: $name"
        
        [ ! -f "${dir}/spec.md" ] && echo "  ✗ Missing spec.md"
        [ ! -f "${dir}/plan.md" ] && echo "  ⚠ Missing plan.md"
        [ ! -f "${dir}/tasks.md" ] && echo "  ⚠ Missing tasks.md"
    fi
done

echo "Done!"
