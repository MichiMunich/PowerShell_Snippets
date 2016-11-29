# Create keyfile and encrypted password
# 29.11.2016

# Execution examples:
# powershell.exe -ExecutionPolicy Bypass "& '.\CreateSecurePassword.ps1'"

#----------------------------------------------------------------------------------
# Global variables. Change values here if needed

$KeyFile = "C:\Temp\AES256.key"
$PasswordFile = "C:\Temp\Password.txt"
$Password = "MyVerySpecialSecretPassword"

#--------------------------------
#								-
#   STOP CHANGING THINGS NOW    -
#								-
#--------------------------------

# create AES-256 keyfile
$CryptoKey = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($CryptoKey)
$CryptoKey | out-file $KeyFile

# Encrypt password
$CryptoKey = Get-Content $KeyFile
$SecurePassword = $Password | ConvertTo-SecureString -AsPlainText -Force
$SecurePassword | ConvertFrom-SecureString -key $CryptoKey | Out-File $PasswordFile
