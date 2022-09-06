if( -not $env:DOTFILES_PATH){
	[System.Environment]::SetEnvironmentVariable('DOTFILES_PATH', 'D:\dotfiles', [System.EnvironmentVariableTarget]::User)
}

#Using the remotely hosted config file
# oh-my-posh init pwsh --config "https://raw.githubusercontent.com/jhonas-palad/dotfiles/main/ompthemes/jhonas2.omp.json" | Invoke-Expression

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jhonas2.omp.json" | Invoke-Expression

#Terminal-Icons
Import-Module -Name Terminal-Icons

#PSReadLine
Import-Module -Name PSReadLine
$PSReadLineOptions = @{
	BellStyle = 'None'
	HistoryNoDuplicates = $true
	PredictionSource = 'History'

}

Set-PSReadLineOption @PSReadLineOptions

#Fzf
Import-Module -Name PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f'
# Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

#Alias
Set-Alias vim nvim 
Set-Alias grep findstr
Set-Alias tig 'D:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'D:\Program Files\Git\usr\bin\less.exe'
# Set-Alias xampp_start 'D:\Program Files\xampp\xampp_start.exe'
# Set-Alias xampp_stop 'D:\Program Files\xampp\xampp_stop.exe'
# Set-Alias xampp-control 'D:\Program Files\xampp\xampp-control.exe'
# $xampp_dir='D:\Program Files\xampp'

#Utilities
function which($command){
	if($command){
	 Get-Command -Name $command -ErrorAction SilentlyContinue |
	 Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
	}else{
	 Write-Host('Provide an argument')
	}

}


function Clear-SavedHistory {
	[CmdletBinding(ConfirmImpact='High', SupportsShouldProcess)]
	param(    )

	# Debugging: For testing you can simulate not having PSReadline loaded with
	#            Remove-Module PSReadline -Force
	$havePSReadline = ($null -ne (Get-Module -EA SilentlyContinue PSReadline))

	Write-Verbose "PSReadline present: $havePSReadline"

	$target = if ($havePSReadline) { "entire command history, including from previous sessions" } else { "command history" } 

	if (-not $pscmdlet.ShouldProcess($target))
	{
			return
	}

	if ($havePSReadline) {
		
		Clear-Host

		# Remove PSReadline's saved-history file.
		if (Test-Path (Get-PSReadlineOption).HistorySavePath) { 
			# Abort, if the file for some reason cannot be removed.
			Remove-Item -EA Stop (Get-PSReadlineOption).HistorySavePath 
			# To be safe, we recreate the file (empty). 
			$null = New-Item -Type File -Path (Get-PSReadlineOption).HistorySavePath
		}

		# Clear PowerShell's own history 
		

	}

	Clear-History

}





