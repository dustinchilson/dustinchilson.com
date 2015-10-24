function Clean-Folder
{
    param(
        [string]$rootfolder,
        [string[]]$excluded
    )
    $rootfolder = resolve-path $rootfolder
    Push-Location $rootFolder
    if($excluded -notmatch "^\s*$")
    {
        $excluded = Resolve-Path $excluded
    }
    $filesToDel = Get-ChildItem $rootFolder -Recurse
    # Excluding files in the excluded folder
    foreach($exclusion in $excluded)
    {
        $filesToDel = $filesToDel |?{$_.fullname -notlike ("{0}\*" -f $exclusion)}
        # Excluding parent folders of the excluded folder
        while($exclusion -notmatch "^\s*$")
        {
            $filesToDel = $filesToDel |?{$_.fullname -ne $exclusion}
            $exclusion = Split-Path -parent $exclusion
        }
    }
    $filesToDel | Remove-Item -Recurse -ErrorAction SilentlyContinue
    Pop-Location
}

git clone git@github.com:dustinchilson/dustinchilson.github.com.git _site

Clean-Folder -rootfolder .\_site -excluded .git

tools\pretzel.exe bake

cd _site
git config --global credential.helper store
Add-Content "$env:USERPROFILE\.git-credentials" "https://$($env:github_token):x-oauth-basic@github.com`n"
git commit -a -m "$($env:APPVEYOR_REPO_COMMIT_MESSAGE)"
git push origin master