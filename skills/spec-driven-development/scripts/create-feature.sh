#!/bin/bash
# Create new feature spec directory

FEATURE_NAME=$1

if [ -z "$FEATURE_NAME" ]; then
    echo "Usage: ./create-feature.sh <feature-name>"
    exit 1
fi

# Get next number
NUM=$(ls -d specs/*/ 2>/dev/null | wc -l | tr -d ' ')
NUM=$(printf "%03d" $((NUM + 1)))

DIR="specs/${NUM}-${FEATURE_NAME}"
mkdir -p "${DIR}/contracts"

cp references/spec-template.md "${DIR}/spec.md"
cp references/plan-template.md "${DIR}/plan.md"
cp references/tasks-template.md "${DIR}/tasks.md"

echo "Created: ${DIR}/"
