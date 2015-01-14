<#
.SYNOPSIS
    Cleans up a folder and its subfolders, removing files you generally don't want to send along with a solution.  (Namely, the BIN and OBJ folders and stray PDB files.)

.PARAMETER whatif 
    Only runs the deletion in whatif mode, NOT deleting any files.

.PARAMETER delete 
    Deletes the files. This parameter is required, in order to avoid random file deletion.
    Only works if -whatif was not specified. 

.PARAMETER tfs 
    Also deletes TFS binding files.

.PARAMETER pdb 
    Also deletes PDB files.
#>  

param([string]$path,
    [switch]$whatif,
    [switch]$delete,
    [switch]$pdb,
    [switch]$tfs)

if (-not ($whatif) `
    -and -not ($delete) `
    -and -not ($tfs))
{
    echo @"
    Specify a parameter: -whatif, -delete, -tfs
    For more info, run Get-Help clean-solution.ps1 -Detailed

"@
    exit
}

$oldPath = Get-Location
cd $path

$params = @{
    whatif = $whatif
    recurse = $true
    force = $true
}

# Clean a solution from unnecessary stuff, i.e. before sending it via mail.
ls bin -r | ri @params #remove BIN folders
ls obj -r | ri @params #remove OBJ folders
if ($pdb) #remove remaining PDBs, if any
{
    ls *.pdb -r | ri @params 
}
if ($tfs) #remove TFS mappings
{
    ls *.vssscc -r | ri @params
    ls *.vspscc -r | ri @params
}

cd $oldPath