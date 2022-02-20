Describe "Test-Service" {

    BeforeAll {
        
        # Load function
        . .\Test-Service.ps1

    }    
    
    It "Given the name of a service with a status of 'Running', will return true" {
        
        $MockRunningService = New-MockObject -Type 'System.ServiceProcess.ServiceController' `
        -Properties @{
             "ServiceName" = "MockRunningService"; 
             "Status" = "Running"
        }

        Mock 'Get-Service' { $MockRunningService }
        
        Test-Service -Name $MockRunningService.ServiceName | Should -Be $true
        
    }
    
    It "Given the name of a service with a status of 'Stopped', will return false" {
        
        $MockStoppedService = New-MockObject -Type 'System.ServiceProcess.ServiceController' `
        -Properties @{
            "ServiceName" = "MockStoppedService";
            "Status" = "Stopped"
        }

        Mock 'Get-Service' { $MockStoppedService }
        
        Test-Service -Name $MockStoppedService.ServiceName | Should -Be $false

    }
}