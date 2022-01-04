# DESCRIPTION: convert all .zip files in current directory to .7z
# DEPENDENCIES: requires 7z.exe to be in your $PATH
Foreach ($zip in $(Get-ChildItem -Filter *.zip)) {
	Set-Variable -Name name -Value $zip.toString().TrimEnd(".zip")
	Write-Output $name
	Expand-Archive -Path $zip
	
	Set-Directory $name
	7z a -mx9 $name
	
	Move-Item "$name.7z" ..
	Set-Location ..
	
	Remove-Item $zip
	Remove-Item $name -Recurse
}