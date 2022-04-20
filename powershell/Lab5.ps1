param ([switch]$System,[switch]$Disks,[switch]$Networks)

if ($System)
{

Hardware
OperatingSystem
Processor
PhysicalMemory
VideoCard
}
elseif ($Disks)
{
Diskinfo
}
elseif($Networks)
{
Network
}
else
{
Hardware
OperatingSystem
Processor
PhysicalMemory
Diskinfo
Network
VideoCard
}