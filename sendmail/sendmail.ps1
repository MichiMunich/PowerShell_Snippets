# Send mail with PowerShell
# 29.11.2016

# Execution examples:
# powershell.exe -ExecutionPolicy Bypass "& '.\sendmail.ps1'"

#----------------------------------------------------------------------------------
# Global variables. Change values here if needed

# Credentials
$KeyFile = "C:\Temp\AES256.key"
$PasswordFile = "C:\Temp\Password.txt"
$MailUser = "MailBoxUser"

# SMTP Settings
$PSEmailServer = "smtp.provider.de"
$smtpFrom = "your@email.de"
$smtpTo = "your@email.de"
$messageSubject = "Sendmail with PowerShell"
$messageBody = "Mail was sent with PowerShell"

#--------------------------------
#								
#   STOP CHANGING THINGS NOW   
#								
#--------------------------------

# global error handling
# only show defined error messages
$ErrorActionPreference = "SilentlyContinue";
$error.Clear();

function errorhandling($message = $error[0].Exception.Message, $Code)
{
	# write execution Log to %tempp%
	$error | out-file -PSPath $env:temp\PowerShell_Execution_Error.log -Append;
	# on error just show content of Exeption.Message
	$message = "Error executing section $($code): " + $($message)
	write-warning $($message)
	# stop script on error
	read-host
	exit $code;
}

#----------------------------
#				            
#   create PSCredential  	
#                  		   
#----------------------------

$CryptoKey = Get-Content $KeyFile
$creds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $MailUser, (Get-Content $PasswordFile | ConvertTo-SecureString -Key $CryptoKey)
 
# errorhandling
if ($error.Count -gt 0)
{
	errorhandling -code 1;
}

#------------------------
#				        
#   send mail		
#                  	
#------------------------

Send-MailMessage -Credential $creds -From $smtpFrom -To $smtpTo -Subject $messageSubject -Body $messageBody

# errorhandling
if ($error.Count -gt 0)
{
	errorhandling -code 2;
}
