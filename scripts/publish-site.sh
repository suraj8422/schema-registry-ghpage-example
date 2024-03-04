#!/bin/bash
set -euo pipefail

readonly repo='jenkins-pipeline-test'
readonly cwd=$(pwd)
echo $PWD

#awk '$1 == "-"{ if (key == "Fruits:") print $NF; next } {key=$1}' schema.yml
schema_data=$(sed -En '/:/h;G;s/^- (.*)\nSchemas:/\1/p' schema.yml)
echo "$schema_data"
readarray -t schemaNames <<<"$schema_data"

readonly repoDir="$PWD/gh-pages"
rm -rf $repoDir
mkdir -p $repoDir

git clone -b gh-pages "https://$GITHUB_TOKEN@github.prod.hulu.com/suraj-bhan/$repo" $repoDir
cd $repoDir

for schemaName in "${schemaNames[@]}"
do
 echo "Generating html schema documentation for: $schemaName"
done 

   
docker run --rm --privileged \
  -v $repoDir:/spec \
  artifactory.prod.hulu.com/hulu-docker/telemetry/smithy-to-openapi/smithy-to-openapi:main \
  -o /spec/index.html
echo $repoDir
git add index.html
git diff-index --quiet HEAD || git commit -m 'updated gh-pages'
#git push origin gh-pages
