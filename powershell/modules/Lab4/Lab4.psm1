function get-mydisks {
 wmic diskdrive get Name,Model,SerialNumber,FirmwareRevision,Size,Manufacturer | fl
 }


function get-cpuinfo {
Get-CimInstance CIM_Processor | Select-Object Name,Manufacturer, NumberOfCores, MaxClockspeed, CurrentClockSpeed | fl
}

function welcome {

write-output "Welcome to planet $env:computername Overlord $env:username"
$now = get-date -format 'HH:MM tt on dddd'
write-output "It is $now."

}


function Hardware {
"Hardware Description" 
get-wmiobject -class win32_computersystem 
        
}

function OperatingSystem {
"OperatingSystem Description"
Get-wmiobject -class win32_operatingsystem | Select-Object Name, Version | fl
}

function Processor {
"Processor Description"
Get-WmiObject -class win32_processor | Select-Object Description,Maxclockspeed,Currentclockspeed,L1CacheSize,L2CacheSize,L3CacheSize | fl
}

function PhysicalMemory {
"PhysicalMemory Description"
$physicalMemory = Get-WmiObject -class win32_physicalmemory

foreach($memory in $physicalMemory) {
 New-Object -TypeName psobject -Property @{
	 Vendor = $memory.manufacturer
	 Description = $memory.description
	 Size = $memory.capacity/1mb
	 Bank = $memory.banklabel
	 Slot = $memory.devicelocator
 } | ft -Auto  Vendor,Description,Size, Bank, Slot
 
 $totalcapacity += $memory.capacity/1mb
} 
"Total RAM: ${totalcapacity}MB " 
}

Function Diskinfo {
"Physical Disk Information"
$diskdrives = Get-CIMInstance CIM_diskdrive

  foreach ($disk in $diskdrives) {
      $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
      foreach ($partition in $partitions) {
            $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
            foreach ($logicaldisk in $logicaldisks) {
                     new-object -typename psobject -property @{
															   Vendor = $disk.Manufacturer
                                                               Model=$disk.Model
                                                               Size=$logicaldisk.Size
                                                               Freespace=$logicaldisk.FreeSpace
                                                               PercentageFree=($logicaldisk.Freespace/$logicaldisk.Size)*100
                                                               }  | Format-Table -auto  Vendor, Model, Size, Freespace, PercentageFree
                                                               
           } 
           
      } 
  }  
 

} 

Function Network {
"Network Description"
Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration | Where-Object { $_.ipenabled -eq "True" } | ft Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder -Auto
}

Function VideoCard {
"VideoCard Description"
Get-WmiObject -Class Win32_VideoController | Select-Object -Property Description,@{Name="CurrentScreenResolution";Expression={ $_.CurrentHorizontalResolution.ToString() + " X " + $_.CurrentVerticalResolution.ToString() }} | fl
}

Hardware
OperatingSystem
Processor
PhysicalMemory
Diskinfo
Network
VideoCard