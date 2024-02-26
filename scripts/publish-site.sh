#!/bin/bash
set -euo pipefail

readonly repo='jenkins-pipeline-test'
readonly cwd=$(pwd)
echo $cwd
echo $PWD
readonly repoDir="$(pwd)/gh-pages"
rm -rf $repoDir
mkdir -p $repoDir

git clone -b gh-pages "https://$GITHUB_TOKEN@github.prod.hulu.com/suraj-bhan/$repo" $repoDir
cd $repoDir
echo $(pwd)
echo $PWD
docker run --rm --privileged \
  -v $repoDir:/spec \
  artifactory.prod.hulu.com/hulu-docker/telemetry/smithy-to-openapi/smithy-to-openapi:main \
  -o /spec/index.html
echo $repoDir
git add index.html
git diff-index --quiet HEAD || git commit -m 'updated gh-pages'
#git push origin gh-pages    # Need write access to push into github