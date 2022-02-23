function Test-DiskSpace {
    param (
        $Disk
    )
    
    $1GB = 1073741824

    if ($Disk.FreeSpace -ge $1GB) {
        return $true
    }

    elseif ($Disk.FreeSpace -lt $1GB) {
        return $false
    } 
}