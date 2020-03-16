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


function Send-MailgunEmail($from, $to, $subject, $body, $emaildomain, $apikey) {
  $idpass = "api:$apikey"
  $basicauth = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($idpass))
  $headers = @{
      Authorization = "Basic $basicauth"
  }
  $url = "https://api.mailgun.net/v3/$emaildomain/messages"
  $body = @{
      from = $from;
      to = $to;
      subject = $subject;
      text = $body;
  }
  Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body
}


# ---- email helpers -----
# These will only help if you already have a dictionary with settings imported, like this: 
# $mailgun_params = @{
#   from = 'sender@example.com';
#   emaildomain = 'example.com';
#   apikey = 'key-SupeRSECret'
# }

function email($to, $subject, $body)
{
    Send-MailgunEmail $to $subject $body @mailgun_params
}

function email-file($to, $filename)
{
    $subject = Split-Path $filename -leaf
    $text = Get-Content $filename | Out-String
    Send-MailgunEmail $to $subject $text @mailgun_params
}

# ---- end email helpers ----