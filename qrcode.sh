#!/bin/zsh

if [ -z "$1" ]; then
  echo "Usage: $0 <url>"
  exit 1
fi

URL="$1"

DOMAIN=$(echo "$URL" | sed -E 's#https?://##' | sed -E 's#/.*##')

OUTPUT="qrcode-$DOMAIN.png"

qrencode -o "$OUTPUT" "$URL"

echo "QR code généré → $OUTPUT"

open "$OUTPUT"
