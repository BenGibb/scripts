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
  param(  
    [Parameter(
        Position=0, 
        Mandatory=$true, 
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true)
    ]
    [String[]]$name) 
  Process {
    if (!$name.endswith('.srt'))
    {
      throw "Subtitles only!"
    }
    Get-Content -Encoding 1250 $name | Set-Content -Encoding UTF8 $name".Utf8.srt"
    Remove-Item $name
  }
}

function get-uptime {
  (Get-Date) - ((Get-CimInstance -ClassName win32_operatingsystem).LastBootupTime)
}

function show-uptime {
  (get-uptime).ToString()
}

function get-youtube-to-mp3 {
  param ([Parameter(Mandatory = $true)]$url)
  youtube-dl -f bestaudio -x --audio-format mp3 --add-metadata $url
}

function grab-youtube {
  param ([Parameter(Mandatory = $true)]$url)
  Push-Location $env:youtube_dl_folder
  youtube-dl -o '%(title)s - %(uploader)s (%(upload_date)s-%(id)s).%(ext)s' $url
  Pop-Location
}

function get-externalip {
  Invoke-RestMethod http://ipinfo.io/json | Select-Object -exp ip
}