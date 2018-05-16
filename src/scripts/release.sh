#!/bin/sh

for project in zup-cora-ui realwave-crm-core realwave-crm-ui realwave-sfm-ui realwave-bff realwave-sfm
do

  echo "\nRELEASE NOTES - $project"

  mkdir TEMP_RELEASE_NOTES

  cd TEMP_RELEASE_NOTES

  echo '\nCLONING REPO\n'

  git clone https://github.com/ZupIT/$project.git

  cd $project

  echo '\nGENERING CHANGE_LOG.md\n'

  git checkout -b RELEASE_NOTES

  github_changelog_generator -u zupIT -p $project

  echo '\nCOMMITNIG BRANCH\n'

  git add -A

  git commit -m 'RELEASE NOTES'

  git push --set-upstream origin RELEASE_NOTES

  #echo '\nOPENING PULL REQUEST\n'
  #git request-pull RELEASE_NOTES $project master

  echo '\nREMOVING TEMP_RELEASE_NOTES\n'

  cd ../../

  rm -rf TEMP_RELEASE_NOTES

  echo "\nEXITING - $project"

done
