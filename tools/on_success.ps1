cd $env:site_folder
git commit -a -m "$env:APPVEYOR_REPO_COMMIT_MESSAGE"
git push origin master