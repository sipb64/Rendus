### Génération de la clef

```powershell
# Générer une clé AES-256
$key = [System.Security.Cryptography.Aes]::Create()
$key.KeySize = 256
$key.GenerateKey()
$key.GenerateIV()

# Convertir la clé et l'IV en base64 pour faciliter leur manipulation
$keyBase64 = [Convert]::ToBase64String($key.Key)
$ivBase64 = [Convert]::ToBase64String($key.IV)

# Afficher la clé et l'IV
Write-Output "Clé AES-256 : $keyBase64"
Write-Output "IV : $ivBase64"

# Sauvegarder la clé et l'IV dans des fichiers
$keyBase64 | Out-File -FilePath "C:\aes_key.txt"
$ivBase64 | Out-File -FilePath "C:\aes_iv.txt"
```
