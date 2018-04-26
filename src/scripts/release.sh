
echo 'RELEASE NOTES/n'

mkdir TEMP_RELEASE_NOTES

cd TEMP_RELEASE_NOTES

echo 'CLONING REPO/n'

git clone https://github.com/ZupIT/$1.git

cd $1

echo 'Genering CHANGE_LOG.md/n'

git checkout -b RELEASE_NOTES

github_changelog_generator -u zupIT -p $1

echo 'COMMITNIG BRANCH/n'

git add -A

git commit -m 'release'

git push --set-upstream origin RELEASE_NOTES

echo 'Removing TEMP_RELEASE_NOTES/n'

rm -rf ../../TEMP_RELEASE_NOTES

echo 'Exit'