#!/bin/bash
cd "$(dirname "$0")"
export PYTHONPATH="$(pwd)"
exec /Users/markmhendrickson/Projects/personal/execution/venv/bin/python3 -m src.instagram_mcp_server
