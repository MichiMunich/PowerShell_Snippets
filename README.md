# Overview
PowerShell snippets for Windows:<br>
<br>
./sendmail/sendmail.ps1:<br>
<ul>
<li>Send Email with PowerShell and encrypted Credentials</li>
<li>Use "CreateSecurePassword.ps1" to create Keyfile and encrypted Password</li>
<li>More Information: <a href="https://blog.doenselmann.com/emails-mit-powershell-versenden/">https://blog.doenselmann.com/emails-mit-powershell-versenden/</a></li>
</ul>
<br>
./crypto/CreateSecurePassword.ps1:<br>
<ul>
<li>Create AES256 Keyfile for encrypting Passwords</li>
<li>More Information: <a href="https://blog.doenselmann.com/emails-mit-powershell-versenden/">https://blog.doenselmann.com/emails-mit-powershell-versenden/</a></li>
</ul>

# Usage ./sendmail/sendmail.ps1
powershell.exe -ExecutionPolicy Bypass "& '.\sendmail.ps1'"<br>

# Usage ./crypto/CreateSecurePassword.ps1
powershell.exe -ExecutionPolicy Bypass "& '.\CreateSecurePassword.ps1'"<br>
