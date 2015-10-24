git config --global credential.helper store
Add-Content "$env:USERPROFILE\.git-credentials" "https://$($env:github_token):x-oauth-basic@github.com`n"
cd $($env:site_folder)
git commit -a -m "$env:APPVEYOR_REPO_COMMIT_MESSAGE"
git push origin master