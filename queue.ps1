<#
.SYNOPSIS
    A quick tool for easy MSMQ manipulation.

.DESCRIPTION
    Probably more useful in development than in production environments, this script is meant to facilitate easy queue creation, deletion, purging and... well, spamming. (The data it generates is not useful or structured, it just makes sure enough data is in the queue for read testing.)

.PARAMETER action
    Mandatory. Specifies the action to be performed: exists, create, delete, purge, spam, count, dump.

.PARAMETER queue
    Mandatory. Specifies a queue to perform the operation on.
    Note that you can use multiple notations. To give some examples, you can use:
        `.\Private$\QName` to access a local, private queue called QName
        `FormatName:DIRECT=PathToHost\Private$\QName` to access a remote private queue called QName, on a machine at PathToHost
    Additionally, if you just specify a string not beginning with `FormatName` or `.`, it defaults  to a local, private queue.
    So queue name specified as `QName`, it is transformed to `.\Private$\QName`.

.PARAMETER count
    How many items should be spammed into the queue, when using the spam command.

.EXAMPLE
    queue create testQ
    Creates a private queue called "testQ" and sets permissions.

.EXAMPLE
    queue exists testQ
    Checks whether a queue called "testQ" exists.

.EXAMPLE
    queue spam testQ 2
    Inserts 2 random items into the queue called "testQ". (Guid string as label, random-length string as body.)

.EXAMPLE
    queue dump testQ
    Dumps the contents of ALL the messages from the "testQ" queue into the output.

.EXAMPLE
    queue count testQ
    Displays the number of messages in queue "testQ".

.EXAMPLE
    queue purge testQ
    Purges all messages from queue "testQ".

    In verbose mode, it also displays the number of messages purged.

.EXAMPLE
    queue delete testQ
    Deletes the queue called "testQ".

.LINK
    Blog post: http://zblesk.net/blog/2015/02/12/manipulate-msmq-with-powershell/
    Source: https://github.com/zblesk/scripts/blob/master/queue.ps1
#>

Param([Parameter(Mandatory=$True, Position=1)] [ValidateSet('exists', 'create', 'delete', 'purge', 'spam', 'count', 'dump')][string]$action ,
    [Parameter(Mandatory=$True, Position=2)][string]$queue,
    [Parameter(Mandatory=$False, Position=3)][Alias('c')][int]$count = 5
    )

if (-not $queue.ToLower().StartsWith('formatname') `
    -and -not $queue.StartsWith('.'))
{
    $queue = '.\Private$\' + $queue
}

[Reflection.Assembly]::LoadWithPArtialName("System.Messaging") > $null
$msmq = [System.Messaging.MessageQueue]

function exists($queue)
{
    Write-Verbose('Checking existence of ' + $queue)
    return $msmq::Exists($queue)
}

function create($queue)
{
    Write-Verbose('Creating ' + $queue)
    if (exists($queue))
    {
        Write-Verbose 'Queue already exists.'
        return
    }
    $q = $msmq::Create($queue)
    $q.SetPermissions("Everyone", [System.Messaging.MessageQueueAccessRights]::FullControl, [System.Messaging.AccessControlEntryType]::Set)
    Write-Verbose 'Queue created'
}

function delete($queue)
{
    Write-Verbose('Deleting ' + $queue)
    if (!(exists($queue)))
    {
        Write-Verbose "Queue doesn't exist."
        return
    }
    $msmq::Delete($queue)
    Write-Verbose 'Queue deleted.'
}

function purge($queue)
{
    Write-Verbose('Purging ' + $queue)
    if (!(exists($queue)))
    {
        Write-Verbose "Queue doesn't exist."
        return
    }
    $q = [System.Messaging.MessageQueue] $queue
    $messageCount = $q.GetAllMessages().Length
    $q.Purge()
    Write-Verbose('Queue purged of ' + $messageCount + ' messages.')
}

function count($queue)
{
    Write-Verbose('Counting ' + $queue)
    if (!(exists($queue)))
    {
        Write-Verbose "Queue doesn't exist."
        return
    }
    $q = [System.Messaging.MessageQueue] $queue
    return $q.GetAllMessages().Length
}

function dump($queue)
{
    $utf8 = new-object System.Text.UTF8Encoding
    $q = [System.Messaging.MessageQueue] $queue
    $msgs = $q.GetAllMessages()
    $msgs | %{
        Write-Output $_.Id
        Write-Output $utf8.GetString($_.BodyStream.ToArray())
    }

}

function spam($queue, $count)
{
    Write-Verbose('Spamming ' + $queue)
    if (!(exists($queue)))
    {
        Write-Verbose "Queue doesn't exist."
        return
    }

    $q = [System.Messaging.MessageQueue] $queue
    for ($c = 0; $c -lt $count; $c++)
    {
        $msgContent = ''

        $iters = Get-Random -minimum 1 -maximum 100
        for ($i = 0; $i -le $iters; $i++)
        {
            $msgContent += '<?xml version="1.0" ?>
            <Messages xmlns="your-xml-namespace">
                <IWebApplicationStartupCompleting>
                </IWebApplicationStartupCompleting>
            </Messages>'
        }
        $msg = new-object System.Messaging.Message
        $msg.Body = $msgContent
        $msg.Label = [guid]::NewGuid().ToString()
        $q.Send($msg)
    }
    Write-Verbose('Written ' + $count + ' messages.')
}

switch ($action)
{
    'exists' { exists $queue }
    'create' { create $queue }
    'delete' { delete $queue }
    'purge' { purge $queue }
    'spam' { spam $queue $count }
    'count' { count $queue }
    'dump' { dump $queue }
}
