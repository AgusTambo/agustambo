#!/usr/bin/env bash
# Rebuilds the resume PDF from cv/index.html using headless Chrome.
# Usage: ./cv/build.sh   (run from anywhere)
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
out="$here/../agustintamborini_resume.pdf"
chrome="${CHROME:-$(command -v google-chrome || command -v chromium || command -v chromium-browser)}"

"$chrome" --headless --disable-gpu --no-sandbox \
  --no-pdf-header-footer --print-to-pdf-no-header \
  --run-all-compositor-stages-before-draw --virtual-time-budget=5000 \
  --print-to-pdf="$out" "file://$here/index.html" 2>/dev/null

echo "Wrote $out"
