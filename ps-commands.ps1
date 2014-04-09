function start-server()
{
  $out =  & python -m http.server 2>&1
  if ($out -match "No module named http")
  {
    echo 'Python 2.x not found. Trying Python 3.x'
    python -m SimpleHTTPServer
  }
}

function chocolatey-versions()
{
  cver all -localonly
}

function kill-webservers()
{
    kill -processname WebDev.WebServer40
}