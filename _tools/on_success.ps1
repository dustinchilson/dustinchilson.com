cd $env:site_folder
git add --all .
git commit -a -m "$env:APPVEYOR_REPO_COMMIT_MESSAGE" 2>&1 | % { $_.ToString() }
git push origin master 2>&1 | % { $_.ToString() }