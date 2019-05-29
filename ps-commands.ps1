function start-server()
{
  $out =  & python -m http.server 2>&1
  if ($out -match "No module named http")
  {
    echo 'Python 2.x not found. Trying Python 3.x'
    python -m SimpleHTTPServer
  }
}

function convert-subtitles
{
  param($filename)
  if (!$filename.endswith('.srt'))
  {
    throw "Subtitles only!"
  }
  Get-Content -Encoding 1250 $filename | Set-Content -Encoding UTF8 $filename".Utf8.srt"
}