Param(
  [string]$postname
)

$date = Get-Date
$year = $date.Year
$month = $date.Month
$day = $date.Day

$file = ".\_posts\$year-$month-$day-$postname.md"

New-Item $file -type file

$title = (Get-Culture).TextInfo.ToTitleCase($postname.replace("-", " "))

$text = "---`n"
$text = $text + "layout: post`n"
$text = $text + "title: `"$title`"`n"
$text = $text + "teaser: `"$title`"`n"
$text = $text + "---`n`n"
$text = $text + "## $title"

$text | Set-Content $file