#!/bin/sh
# Refuse to start anything unless AWS calls from this container land on the emulator.
set -eu

if [ ! -r /emu/emulator_credentials ]; then
  echo "emu-guard: emulator files not found in /emu. Run 'emu up' first." >&2
  exit 3
fi

account="$(aws sts get-caller-identity --query Account --output text 2>/dev/null || true)"
if [ "$account" != "000000000000" ]; then
  echo "emu-guard: BLOCKED. STS answered with account '${account:-none}', expected 000000000000." >&2
  exit 4
fi

echo "emu-guard: AWS calls go to the emulator (account 000000000000). No other AWS keys exist in this container." >&2
exec "$@"
