# Réaliser une requête Web GET sur un site Web
$URL = "https://taisen.fr"
$response = Invoke-WebRequest -Uri $URL -Method GET

Write-Output "Status Code: $($response.StatusCode)"
Write-Output "Status Description: $($response.StatusDescription)"

Write-Output "Response Content:"
Write-Output $response.Content

# Afficher l'IP et le nom du serveur DNS qui résout le nom de domaine
$domainName = "taisen.fr"
$resolved = Resolve-DnsName -Name $domainName

Write-Output "Adresse IP: $($resolved.IPAddress)"
Write-Output "Nom du serveur DNS: $($resolved.NameHost)"

# Afficher l'IP et le port Source
$tcpConnections = Get-NetTCPConnection | Where-Object { $_.State -eq 'Established' }

foreach ($connection in $tcpConnections) {
    Write-Output "Adresse IP source: $($connection.LocalAddress)"
    Write-Output "Port source: $($connection.LocalPort)"
    Write-Output "====================="
}

# Afficher l'IP et le port de destination
foreach ($connection in $tcpConnections) {
    Write-Output "Adresse IP de destination: $($connection.RemoteAddress)"
    Write-Output "Port de destination: $($connection.RemotePort)"
    Write-Output "====================="
}

# Afficher les Headers et leur utilité (si connu)
$headers = Invoke-WebRequest -Uri $URL -Method Head | Select-Object -ExpandProperty Headers

$headerDescriptions = @{
    "Connection" = "Contrôle le type de connexion utilisée pour la requête. (e.g., keep-alive)"
    "Access-Control-Allow-Origin" = "Indique les origines autorisées pour les requêtes CORS."
    "Cache-Control" = "Contrôle comment les caches doivent gérer la réponse. (e.g., max-age=600)"
    "Content-Length" = "Indique la taille du contenu de la réponse en octets."
    "Content-Type" = "Indique le type de contenu et l'encodage de caractères utilisés."
    "Date" = "Indique la date et l'heure à laquelle la réponse a été générée."
    "Expires" = "Indique la date et l'heure d'expiration de la réponse."
    "Last-Modified" = "Indique la date et l'heure de la dernière modification du contenu."
    "Server" = "Indique le logiciel serveur utilisé pour répondre à la requête."
}

foreach ($header in $headers.GetEnumerator()) {
    $key = $header.Key
    $value = $header.Value

    if ($headerDescriptions.ContainsKey($key)) {
        Write-Output "[$key]: $value"
        Write-Output "Utilité: $($headerDescriptions[$key])`n"
    } else {
        Write-Output "[$key]: $value"
    }
}

# Afficher le Content-Type du site et son utilité si générique
$response = Invoke-WebRequest -Uri $URL -Method Head
$contentType = $response.Headers["Content-Type"]
Write-Output "Content-Type du site $URL : $contentType"

# Afficher les balises Web
$webTags = @("html", "head", "title", "body", "div", "span", "a", "p", "h1", "h2", "h3", "h4", "h5", "h6", "ul", "ol", "li", "table", "tr", "td", "th", "form", "input", "button", "select", "option", "textarea", "img", "script", "link", "meta", "style", "footer", "header", "nav", "section", "article", "aside")
Write-Output "Balises Web:"
$webTags

# Afficher les différents éléments du certificat
$request = [System.Net.HttpWebRequest]::Create($url)
$request.Method = "GET"
$request.AllowAutoRedirect = $false

try {
    $response = $request.GetResponse()
    $response.Close()
} catch [System.Net.WebException] {
    $response = $_.Exception.Response
}

$certificate = $request.ServicePoint.Certificate

$cert2 = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2 $certificate

Write-Output "Subject: $($cert2.Subject)"
Write-Output "Issuer: $($cert2.Issuer)"
Write-Output "Valid From: $($cert2.NotBefore)"
Write-Output "Valid Until: $($cert2.NotAfter)"
Write-Output "Thumbprint: $($cert2.Thumbprint)"

# Afficher la liste des IP équipements réseaux traversés pour atteindre le site Web
$trace = Test-NetConnection -ComputerName $domainName -TraceRoute
Write-Host "Equipements réseau traversés :"
$trace.Traceroute | ForEach-Object {
    Write-Host $_
}