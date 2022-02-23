BeforeAll {
        
    # Load function
    . $PSScriptRoot\Test-DiskSpace.ps1

}

Describe "Test-DiskSpace" {
    It "Given a disk with >= 1GB Free space should return true" {
        
        # Mock logical disk with 1GB free space
        $1GB = 1073741824
        $mockDisk = [Microsoft.Management.Infrastructure.CimInstance]::new('Win32_LogicalDisk','root/cimv2')
        $freeSpace = [Microsoft.Management.Infrastructure.CimProperty]::Create('FreeSpace', $1GB, [cimtype]::UInt32 , 'Property, ReadOnly')
        $mockDisk.CimInstanceProperties.Add($freeSpace)
        
        Test-DiskSpace -Disk $MockDisk | Should -Be $true
    }

    It "Given a disk with < 1GB Free space should return false" {
        
        # Mock logical disk with 1 byte free space
        $mockDisk = [Microsoft.Management.Infrastructure.CimInstance]::new('Win32_LogicalDisk','root/cimv2')
        $freeSpace = [Microsoft.Management.Infrastructure.CimProperty]::Create('FreeSpace', 1, [cimtype]::UInt32 , 'Property, ReadOnly')
        $mockDisk.CimInstanceProperties.Add($freeSpace)

        Test-DiskSpace -Disk $MockDisk | Should -Be $false
    }
}