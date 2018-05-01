#!/bin/sh

echo "\nRELEASE NOTES\n - $1"

mkdir TEMP_RELEASE_NOTES

cd TEMP_RELEASE_NOTES

echo '\nCLONING REPO\n'

git clone https://github.com/ZupIT/$1.git

cd $1

echo '\nGENERING CHANGE_LOG.md\n'

git checkout -b RELEASE_NOTES

github_changelog_generator -u zupIT -p $1

echo '\nCOMMITNIG BRANCH\n'

git add -A

git commit -m 'RELEASE NOTES'

git push --set-upstream origin RELEASE_NOTES

#echo '\nOPENING PULL REQUEST\n'
#git request-pull RELEASE_NOTES $1 master

echo '\nREMOVING TEMP_RELEASE_NOTES\n'

rm -rf ../../TEMP_RELEASE_NOTES

echo "\nEXITING - $1"
