#!/bin/bash
set -euo pipefail

readonly repo='jenkins-pipeline-test'
readonly cwd=$(pwd)
echo $PWD

# Declare a string array
schemas=("element1" "element2" "element3" "element4")

# Iterate over the array and print each element separated by a space
for element in "${schemas[@]}";
do
    echo -n "$element "

    schemaName+="$element "

done

echo

echo "$schemaName"


#awk '$1 == "-"{ if (key == "Fruits:") print $NF; next } {key=$1}' schema.yml
schema_data=$(sed -En '/:/h;G;s/^- (.*)\nSchemas:/\1/p' schema.yml)
echo "$schema_data"
readarray -t schemaNames <<<"$schema_data"

readonly repoDir="$PWD/gh-pages"
rm -rf $repoDir
mkdir -p $repoDir

# Declare a schema registry name array
schema_array=("schema-registry-tlmt-viewport" "schema-registry-tlmt-pq")

# Iterate over the array and mapping each schema name separated by a space
for schema in "${schema_array[@]}";
do
    schema_name+="$schema "
done
echo $schema_name

git clone -b gh-pages "https://$GITHUB_TOKEN@github.prod.hulu.com/suraj-bhan/$repo" $repoDir
cd $repoDir

set +u
if [[ -z "$(git config --global user.name)" ]]; then
  echo 'setting git email and name...'
  git config --global user.email "BotClientSignals@hulu.com"
  git config --global user.name "BotClientSignals"
fi
set -u

docker run --rm --privileged \
  -v $repoDir:/spec \
  artifactory.prod.hulu.com/hulu-docker/telemetry/smithy-to-openapi/smithy-to-openapi:main $schema_name

ls -l $repoDir
echo $repoDir
git pull origin gh-pages
echo $repoDir
git add .

echo $repoDir
git add .
git diff-index --quiet HEAD || git commit -m 'updated gh-pages'
#git push origin gh-pages
