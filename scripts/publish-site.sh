#!/bin/bash
set -euo pipefail

readonly repo='jenkins-pipeline-test'

echo $PWD
echo "ls -a ${PWD}"

echo $SCHEMAS

echo "${schemaNames}"

readonly repoDir=$(pwd)/gh-pages
rm -rf $repoDir
mkdir -p $repoDir


echo "${SCHEMAS}"

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
