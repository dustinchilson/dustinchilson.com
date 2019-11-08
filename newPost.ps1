Param(
  [string]$postname
)

$date = Get-Date -format yyyy-MM-dd
$guid = [guid]::NewGuid().ToString()

$file = ".\site\_posts\$date-$postname.md"

New-Item $file -type file

$title = (Get-Culture).TextInfo.ToTitleCase($postname.replace("-", " "))

$text = "---`n"
$text = $text + "layout: post`n"
$text = $text + "title: `"$title`"`n"
$text = $text + "teaser: `"$title`"`n"
$text = $text + "guid: `"$guid`"`n"
$text = $text + "---`n`n"
$text = $text + "## $title"

$text | Set-Content $file