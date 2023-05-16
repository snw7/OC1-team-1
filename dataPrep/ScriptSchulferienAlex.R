# Installiere und lade das "lubridate" Paket für die Arbeit mit Datumsangaben
install.packages("lubridate")
library(lubridate)

# Dateinamen und Spaltennummern anpassen
csv_datei <- "data/original/ferienRaw.csv"
start_spalte <- "Start"
ende_spalte <- "Ende"

# Lese die CSV-Datei ein
daten <- read.csv(csv_datei, header = TRUE)

# Konvertiere die Spalten in Datumsangaben
start_datum <- dmy(daten[, start_spalte])
ende_datum <- dmy(daten[, ende_spalte])

# Konvertiere das Datum in das Format "yyyy-mm-dd"
start_datum <- format(start_datum, "%Y-%m-%d")
ende_datum <- format(ende_datum, "%Y-%m-%d")

# Erzeuge einen Vektor mit allen Tagen im Zeitraum
alle_tage <- seq.Date(as.Date(start_datum), as.Date(ende_datum), by = "day")

# Speichere die Tage in einer neuen CSV-Datei
ausgabedatei <- "data/original/schulferien_sh.csv"
write.csv(alle_tage, file = ausgabedatei, row.names = FALSE)

# Gib eine Bestätigung aus
cat("Die Tage wurden erfolgreich in", ausgabedatei, "gespeichert.\n")
