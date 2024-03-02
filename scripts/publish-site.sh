#!/bin/bash
set -euo pipefail

readonly repo='jenkins-pipeline-test'

echo $PWD
echo "ls -a ${PWD}"

readonly filePath="$PWD/schema.yml"
echo $filePath

echo $SCHEMA_NAMES

schema=readYaml file: filePath

echo $SCHEMA_NAMES
echo "${schema}"

readonly repoDir=$(pwd)/gh-pages
rm -rf $repoDir
mkdir -p $repoDir


echo "${SCHEMA_NAMES}"

#git clone -b gh-pages "https://$GITHUB_TOKEN@github.com/suraj8422/schema-registry-ghpage-example/$repo" $repoDir
#cd $repoDir
#
#docker run --rm --privileged \
#  -v $repoDir:/spec \
#  artifactory.prod.hulu.com/hulu-docker/telemetry/smithy-to-openapi/smithy-to-openapi:main \
#  -o /spec/index.html
#echo $repoDir
#git add index.html
#git diff-index --quiet HEAD || git commit -m 'updated gh-pages'
#git push origin gh-pages    # Need write access to push into github
