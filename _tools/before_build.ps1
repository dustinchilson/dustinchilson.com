git config --global credential.helper store
Add-Content "$env:USERPROFILE\.git-credentials" "https://$($env:github_token):x-oauth-basic@github.com`n"

git config --global user.email "$($env:email)"
git config --global user.name "Dustin Chilson"

git clone https://github.com/dustinchilson/dustinchilson.com.git $env:site_folder 2>&1 | % { $_.ToString() }
git checkout gh-pages