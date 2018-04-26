#!/bin/sh


echo "\n\nRELEASE NOTES\n\n - $1"

mkdir TEMP_RELEASE_NOTES

cd TEMP_RELEASE_NOTES

echo '\n\nCLONING REPO\n\n'

git clone https://github.com/ZupIT/$1.git

cd $1

echo '\n\nGENERING CHANGE_LOG.md\n\n'

git checkout -b RELEASE_NOTES

github_changelog_generator -u zupIT -p $1

echo '\n\nCOMMITNIG BRANCH\n\n'

git add -A

git commit -m '\n\nRELEASE\n\n'

git push --set-upstream origin RELEASE_NOTES

echo '\n\nREMOVING TEMP_RELEASE_NOTES\n\n'

rm -rf ../../TEMP_RELEASE_NOTES

echo "\n\nEXITING - $1"
