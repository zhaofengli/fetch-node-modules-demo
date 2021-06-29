source $stdenv/setup
set -euo pipefail

export npm_config_cache=$(mktemp -d)

unpackPhase
cd $sourceRoot

# Scripts may result in non-determinstic behavior
# For example, Puppeteer's postinstall script downloads a pre-built version of Chromium
npm ci --ignore-scripts

# Produce a deterministic tarball
tar -czvf $out --mtime="@$SOURCE_DATE_EPOCH" --sort=name node_modules
