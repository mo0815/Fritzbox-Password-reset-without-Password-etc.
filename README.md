# Fritzbox-Password-reset-without-Password-etc
This is a skript for reseting a Fritzbox @ Bootup by bypassing the Loader itself of the OS
you can also type this in to the CMD for sure but its easyer ;) but with the skript you will have access as a TXT file to

ftp:
open 192.168.178.1
adam2
adma2
quote getenv webgui_pass
quote getenv wlan_key
qoute getenv wlan_ssid

qoute reboot



P.S. 
FRITZ!Box Password Reset / ENV Read via ADAM2

Kurzfassung:
Dieses Projekt demonstriert den Zugriff auf den ADAM2-Bootloader einer FRITZ!Box per FTP, um ENV-Variablen auszulesen
oder einen Reset auszulösen. Entscheidend ist das richtige Zeitfenster beim Booten – nicht der Code.


WICHTIGER HINWEIS
- Die Methode funktioniert nur im ADAM2-Bootloader, nicht im laufenden FRITZ!OS.
- ADAM2 ist nur wenige Sekunden nach dem Einschalten erreichbar.
- Siehe Abschnitt „ADAM2 erkennen (Fehlerdiagnose)“.


VORAUSSETZUNGEN
- Windows (CMD / Batch)
- Direkte LAN-Verbindung PC ↔ FRITZ!Box (kein Switch, kein VLAN)
- Statische IP am PC empfohlen (z. B. 192.168.178.2 / 255.255.255.0)
- Windows-FTP Zugang CMD o.ä.


DATEIEN
- run_fritz_ftp.bat   Startet den FTP-Client und schreibt die Ausgabe in eine Textdatei
- ftp_commands.txt    Enthält die FTP-Kommandos


NUTZUNG (KURZABLAUF)
1. PC per LAN direkt mit der FRITZ!Box verbinden.
2. run_fritz_ftp.bat vorbereiten, aber noch nicht starten.
3. FRITZ!Box vom Strom trennen.
4. Strom einstecken und sofort die Batch-Datei starten.
5. Wenn ADAM2 erreicht wurde, erscheinen Bootloader-Antworten in der Ausgabedatei.

Hinweis:
Wenn „530 Please login“ erscheint, wurde das ADAM2-Zeitfenster verpasst.


ADAM2 ERKENNEN (FEHLERDIAGNOSE)

RICHTIG (ADAM2):
- Kein klassisches „530 Please login“
- „quote help“ wird verstanden
- „quote getenv <var>“ wird nicht mit „command not understood“ beantwortet

FALSCH (FRITZ!OS FTP – zu spät):
220 FTP server ready.
530 Please login with USER and PASS.

- „quote getenv …“ → „500 command not understood“
- Lösung: Neu booten und früher verbinden


TYPISCHE FEHLER
- 500 command not understood → Nicht im ADAM2
- Ungültiger Befehl → interaktiver FTP-Prompt statt Script
- Verbindung besteht bereits → open doppelt verwendet
- Leere Ausgabe → falsches Timing


SETUP-HINWEISE
- USB-LAN-Adapter können zu langsam sein, Onboard-LAN bevorzugen
- Alte CMD-Codepage kann Sonderzeichen falsch darstellen (unproblematisch)
- Manche Modelle/Firmware-Versionen haben extrem kurze ADAM2-Zeitfenster


RECHTLICHES / HINWEIS
Dieses Projekt dient ausschließlich Lern- und Wiederherstellungszwecken am eigenen Gerät.
Die Nutzung erfolgt auf eigene Verantwortung.
AVM-Recovery-Tools sind der offiziell empfohlene Weg.


FAQ
F: Der Code ist korrekt, aber es funktioniert nicht.
A: In 99 % der Fälle wurde ADAM2 verpasst. Das Problem ist Timing, nicht der Code.

F: Funktioniert das bei jeder FRITZ!Box?
A: Modell- und Firmware-abhängig. Neuere Versionen schränken ADAM2 stark ein.
