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

Clean-Folder -rootfolder .\_site -excluded .git
& .\tools\pretzel.exe bake