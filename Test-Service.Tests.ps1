BeforeAll {
    . .\Test-Service.ps1
}

Describe "Test-Service" {
    Context "ContextName" {
        $MockRunningService = New-MockObject -Type 'System.ServiceProcess.ServiceController' -Properties @{"Status" = "Running"}
        $MockStoppedService = New-MockObject -Type 'System.ServiceProcess.ServiceController' -Properties @{"Status" = "Stopped"}
        
        It "Given the name of a service with a status of 'Running', will return true" {
            Test-Service -Name $MockRunningService | Should -Be $true
        }
        
        It "Given the name of a service with a status of 'Stopped', will return false" {
            Test-Service -Name $MockStoppedService | Should -Be $false
        }
    }
}