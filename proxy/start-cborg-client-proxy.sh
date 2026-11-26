#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
UV=${UV:-uv}

if [ -z "${CBORG_API_KEY:-}" ]; then
    echo "CBORG_API_KEY must be set before starting the proxy." >&2
    exit 1
fi

exec "$UV" run --no-project --python 3.12 \
    --with-requirements "$SCRIPT_DIR/requirements.txt" \
    python "$SCRIPT_DIR/cborgclient.py"


