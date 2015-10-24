git config --global credential.helper store
Add-Content "$env:USERPROFILE\.git-credentials" "https://$($env:github_token):x-oauth-basic@github.com`n"
git clone https://github.com/dustinchilson/dustinchilson.github.com.git $env:site_folder 2>&1 | % { $_.ToString() 