# Installiere und lade das "lubridate" Paket für die Arbeit mit Datumsangaben
install.packages("lubridate")
library(lubridate)

# Dateinamen anpassen
csv_datei <- "deine_datei.csv"

# Lese die CSV-Datei ein
daten <- read.csv(csv_datei, header = TRUE)

# Konvertiere die Spalten in Datumsangaben
start_datum <- as.Date(daten[, 1])
ende_datum <- as.Date(daten[, 2])

# Erzeuge einen Vektor mit allen Tagen im Zeitraum
alle_tage <- seq(start_datum, ende_datum, by = "day")

# Speichere die Tage in einer neuen CSV-Datei
ausgabedatei <- "ausgabe.csv"
write.csv(alle_tage, file = ausgabedatei, row.names = FALSE)

# Gib eine Bestätigung aus
cat("Die Tage wurden erfolgreich in", ausgabedatei, "gespeichert.\n")
