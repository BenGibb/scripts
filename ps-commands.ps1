function start-server()
{
  python -m http.server
}

function chocolatey-versions()
{
  cver all -localonly
}