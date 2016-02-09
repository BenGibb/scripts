<#
.SYNOPSIS
    Clears up a folder and its subfolders, removing files you generally don't want to send along with a solution.  (Namely, the BIN and OBJ folders and stray PDB files.)

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
function Clear-Solution()
{
    param([string]$path,
        [switch]$whatif,
        [switch]$delete,
        [switch]$pdb,
        [switch]$tfs)

    if (-not ($whatif) `
        -and -not ($delete) `
        -and -not ($tfs))
    {
        Write-Output @"
    Specify a parameter: -whatif, -delete, -tfs
    For more info, run Get-Help Clear-Solution -Detailed

"@
        return
    }

    $oldPath = Get-Location
    Set-Location $path

    $params = @{
        whatif = $whatif
        recurse = $true
        force = $true
    }

    # Clear a solution from unnecessary stuff, i.e. before sending it via mail.
    Get-ChildItem bin -r | Remove-Item @params #remove BIN folders
    Get-ChildItem obj -r | Remove-Item @params #remove OBJ folders
    if ($pdb) #remove remaining PDBs, if any
    {
        Get-ChildItem *.pdb -r | Remove-Item @params 
    }
    if ($tfs) #remove TFS mappings
    {
        Get-ChildItem *.vssscc -r | Remove-Item @params
        Get-ChildItem *.vspscc -r | Remove-Item @params
    }

    Set-Location $oldPath
}

Export-ModuleMember -function *