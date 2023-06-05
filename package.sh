#!/bin/bash -e

set -eo pipefail

# clean
rm -rf dist

# target folder structure
mkdir dist
mkdir dist/nodejs
mkdir dist/nodejs/node_modules

# copy dependencies with zip structure
cp -R node_modules dist/nodejs

# create zip for lambda layer
(cd dist && zip -FS -q -r sharp-layer.zip ./nodejs/*)
# create zip for embedding directly in lambda
(cd dist/nodejs && zip -FS -q -r ../sharp-layer-fs.zip ./node_modules/*)

# cleanup zip structure
rm -rf dist/nodejs