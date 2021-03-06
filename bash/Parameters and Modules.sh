Get-CimInstance win32_physicalmemory
# Gather the data from the local (or remote) system
$processor = Get-WmiObject -Class Win32_Processor
$memory = Get-WmiObject Win32_PhysicalMemory

# Create a custom PowerShell object with the desired properties
[PSCustomObject]@{
  SystemName = $processor.SystemName
  Name = $processor.Name
  MemoryCapacity = $memory.Capacity
  Manufacturer = $memory.Manufacturer
}
