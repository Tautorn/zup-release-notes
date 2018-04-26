
echo 'Genering NOTES'

mkdir TEMP_RELEASE_NOTES
cd TEMP_RELEASE_NOTES

git clone https://github.com/ZupIT/$1.git

github_changelog_generator -u zupIT -p $1

git checkout -b RELEASE_NOTES

git add -A

git commit -m 'release'

git push --set-upstream origin RELEASE_NOTES

echo 'Exit'