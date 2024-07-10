# Préambule 

Installation d'une Machine Windows (VM) cliente non-jointe à l'Active Directory.

# Questions

## 1. Configurer auditpol pour logger les erreurs d'authentification et les escalades de privilèges puis prouver la bonne configuration d'auditpol en retrouvant les evenements dans les logs.

<p align="center">
    <img src="./Auditpol_Logon.png" alt="Auditpol_Logon" style="width: 800px;" />
</p>

<p align="center">
    <img src="./Auditpol_Privileges.png" alt="Auditpol_Privileges" style="width: 800px;" />
</p>

## 2. Lire la documentation Microsoft Security Compliance Toolkit et télécharger la version correspondante à vote OS.
https://learn.microsoft.com/fr-fr/windows/security/operating-system-security/device-management/windows-security-configuration-framework/security-compliance-toolkit-10

## 3. Se documenter sur LGPO et comparer votre GPO actuelle à celle recommandée grace à PolicyAnalyzer.

<p align="center">
    <img src="./PolicyAnalyzer1.png" alt="PolicyAnalyzer1" style="width: 800px;" />
</p>

## 4. Comprendre puis exécuter le script de durcissement.


## 5.  Vérifier la configuration avec PolicyAnalyzer


## 6. Activer le chiffrement de surface (bitlocker recommandé)


## 7. Renforcer la configuration Antivirus à l'aide de powershell


## 8. Votre configuration Auditpol initiale est elle persistante ? Pourquoi ?
