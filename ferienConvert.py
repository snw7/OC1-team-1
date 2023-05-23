import csv
from datetime import datetime, timedelta

# Liest Zeitspannen in CSV Datei ein (mit Start und Ende) und gibt diese in CSV Datei aus,
# wobei jeder Tag innerhalb der Zeitspanne mit einer 1 ausgegeben wird


date_ranges = []

with open('data/original/ferienRaw.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        start_date = datetime.strptime(row['Start'].strip(), '%Y-%m-%d')
        end_date = datetime.strptime(row['Ende'].strip(), '%Y-%m-%d')
        date_ranges.append((start_date, end_date))

# # Erstelle eine neue CSV-Datei und schreibe die Daten zwischen Start- und Enddatum in die Datei
with open('data/original/schulferienSH.csv', 'w', newline='') as csvfile:
    datawriter = csv.writer(csvfile)
    datawriter.writerow(['Datum','FerienSH'])

    for date_range in date_ranges:
        start_date = date_range[0]
        end_date = date_range[1]

        current_date = start_date
        while current_date <= end_date:
            datawriter.writerow([current_date.strftime('%Y-%m-%d'), 1])
            current_date += timedelta(days=1)