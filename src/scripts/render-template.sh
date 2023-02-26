#!/bin/bash

# This script generates arguments for and runs the gomplate command to render the template

ARGS=()
ARGS+=("--config" "${GOMPLATE_CONFIG?}")
ARGS+=("--file" "${TEMPLATE_FILE?}")
ARGS+=("--out" "${OUTPUT_FILE?}")

for DATASOURCE in ${DATASOURCES?}; do
  ARGS+=("--datasource" "${DATASOURCE}")
done

for CONTEXT in ${CONTEXTS?}; do
  ARGS+=("--context" "${CONTEXT}")
done

printf "Running \"gomplate %s\"\n" "${ARGS[@]}"
gomplate "${ARGS[@]}"