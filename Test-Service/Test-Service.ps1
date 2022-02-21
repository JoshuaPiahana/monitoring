function Test-Service {
    param (
        $Name
    )

    if ((Get-Service -Name $Name | Select-Object -ExpandProperty 'Status') -eq 'Running'){
        return $true
    }

    else {
        return $false
    }
}