#!/bin/sh

# This script generates arguments for and runs the gomplate command to render the template

ARGS=""
ARGS="${ARGS} --config ${GOMPLATE_CONFIG?}"
ARGS="${ARGS} --file ${TEMPLATE_FILE?}"
ARGS="${ARGS} --out ${OUTPUT_FILE?}"

for DATASOURCE in ${DATASOURCES?}; do
  ARGS="${ARGS} --datasource ${DATASOURCE}"
done

for CONTEXT in ${CONTEXTS?}; do
  ARGS="${ARGS} --context ${CONTEXT}"
done

echo "Running \"gomplate ${ARGS}\""
gomplate ${ARGS}