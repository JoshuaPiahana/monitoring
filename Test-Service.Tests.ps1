BeforeAll {
    . .\Test-Service.ps1
}

Describe "Test-Service" {
    $ServicesRegistryPath = "TestRegistry:\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services"
    New-Item -Path "$ServicesRegistryPath\MockRunningService"
    New-ItemProperty 
    
    $MockRunningService = New-MockObject -Type 'System.ServiceProcess.ServiceController' `
    -Properties @{
        "ServiceName" = "MockRunningService"; 
        "Status" = "Running"
    }

    $MockStoppedService = New-MockObject -Type 'System.ServiceProcess.ServiceController' `
    -Properties @{
        "ServiceName" = "MockStoppedService";
        "Status" = "Stopped"
    }
    
    It "Given the name of a service with a status of 'Running', will return true" {
        Test-Service -Name $MockRunningService | Should -Be $true
    }
    
    It "Given the name of a service with a status of 'Stopped', will return false" {
        Test-Service -Name $MockStoppedService | Should -Be $false
    }
}