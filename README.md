# Starwars-SwiftUI
## Projektbeschreibung:
Die App wurde mit Swift UI erstellt und dient der Darstellung eines Starswarscharakters. 
Hier werden alle Eigenschaften und Fakten eines Charakters angezeigt, wie z.B. in welchen Filmen dieser Charakter vorkommt. 
Um die unterschiedlichen Charaktere und die dazugehörigen Daten von der open API zu erhalten, erfolgt mit Alamofire ein GETRequest. 
Die App wurde nach dem MVVM erstellt, damit die Logic und das UI getrennt werden und ein übersichtlicher Code geschaffen wird.
Nach erfolgreichem Response werden die JSON Daten  zu einem Starwarscharakter gemapped und die View anhand der Daten geupdatet. 
Dies wird in der View als Steckbrief dargestellt. Dieser Steckbrief bildet die Eigenschaften und Fakten von dem Charakter ab. 
Durch eine Schufflefunktion, die durch ein Button zu bedienen ist, können zufällige Charaktere angezeigt werden. 
Hierzu wird eine zufällig generierte ID zwischen 1 und 83 erstellt, welche die Anzahl der hinterlegten Charaktere bei der API ist. 


## Start Anleitung:
Wenn die App gestartet wird, wird bereits ein zufälliger Charakter initial geladen und angezeigt. 
Möchte man einen weiteren zufälligen Charakter laden, muss man den Shuffle-Butten betätigen. Sollte der Request fehlschlagen, wird ein Errortext angezeigt. 

