# DESCRIPTION: Select a random item from all files in a directory
$n = 1
If ($args[0]) { $n = $args[0] }
Get-Random -InputObject $(Get-ChildItem) -Count $n