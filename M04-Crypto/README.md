# Questions

## Donner les algorithmes les plus réputés et barrer ceux qui ne devraient plus être utilisés en expliquant pourquoi.

- AES 256 avec mécanisme XTS
  
- **~~AES 128 avec ECB~~** : mode ECB ne fournit pas de randomisation.
  
- **~~3DES~~** : trop petite taille de clé et performances faibles. Migration vers AES recommandée.
  
- SHA2
  
- **~~SHA1~~** : vulnérable aux attaques par collision. Passage à SHA2 voire SHA3 recommandé. 
  
- **~~MD5~~** : obsolète, vulnérable aux attaques par collision. 
  
- RSA avec OAEP
  
- **~~RSA avec PKCS1~~** : vulnérable aux attaques par chevauchement de paquets. Migration vers OAEP recommandée. 

## Grâce à un script, générer une clé de chiffrement AES256 ainsi que les IV avec le destinataire. Partagez-la avec votre destinataire en essayant de préserver sa confidentialité.

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
$keyBase64 | Out-File -FilePath "C:\Users\Nicolas\Desktop\VirtualBox-Simplon\Bazar\aes_key.txt"
$ivBase64 | Out-File -FilePath "C:\Users\Nicolas\Desktop\VirtualBox-Simplon\Bazar\aes_iv.txt"
```

