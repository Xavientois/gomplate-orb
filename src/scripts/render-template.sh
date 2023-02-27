#!/bin/sh

# This script generates arguments for the gomplate command to render the template and runs it

ARGS=""
ARGS="${ARGS} --file ${TEMPLATE_FILE:?}"
ARGS="${ARGS} --out ${OUTPUT_FILE:?}"

if [ -n "${GOMPLATE_CONFIG?}" ]; then
  ARGS="${ARGS} --config ${GOMPLATE_CONFIG}"
fi

for DATASOURCE in ${DATASOURCES?}; do
  ARGS="${ARGS} --datasource ${DATASOURCE}"
done

for CONTEXT in ${CONTEXTS?}; do
  ARGS="${ARGS} --context ${CONTEXT}"
done

echo "Running \"gomplate ${ARGS}\""
# shellcheck disable=SC2086
gomplate ${ARGS}