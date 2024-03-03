#!/bin/bash
set -euo pipefail

wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

readonly repo='jenkins-pipeline-test'

echo $PWD
echo "ls -a ${PWD}"

schema_list=$( yq eval '.schemaNames|length' schema.yml )
echo "Length---${schema_list}"

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
