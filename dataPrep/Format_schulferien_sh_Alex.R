# Import der Daten aus der CSV-Datei
data <- utils::read.csv("data/original/ferienRaw.csv", sep = ",", header = TRUE)

# Entfernen von Zeilen mit fehlenden Werten
data <- data[complete.cases(data), ]

# Funktion zum Erzeugen einer Sequenz von Daten zwischen Start und Ende
generate_dates <- function(start, end) {
  seq(as.Date(start, "%Y-%m-%d"), as.Date(end, "%Y-%m-%d"), by = "day")
}

# Erzeugung der Datenreihen für jeden Start- und Endpunkt
date_sequences <- list()
for (i in 1:nrow(data)) {
  date_sequences[[i]] <- generate_dates(data$Start[i], data$Ende[i])
}

# Überprüfung der "Ende"-Spalte auf ungültige Werte
invalid_rows <- is.na(data$Ende) | !is.finite(as.Date(data$Ende, "%Y-%m-%d"))

# Anzeigen der betroffenen Zeilen
invalid_data <- data[invalid_rows, ]

# Konvertierung der Datenreihen in das gewünschte Format
formatted_dates <- lapply(date_sequences, function(dates) {
  format(dates, "%Y-%m-%d")
})

# Erstellung einer neuen Datenrahmen mit den formatierten Daten
output_data <- data.frame(Datum = unlist(formatted_dates))

# Export des Datenrahmens in eine CSV-Datei
utils::write.csv(output_data, "ferienFormatted.csv", row.names = FALSE)

<<<<<<< HEAD
=======
# Dies ist ein Test unter Linux
# Dies ist der zweite Test
>>>>>>> 9b97cf3ab9ac247407e61498dcc0b71bded8121f
