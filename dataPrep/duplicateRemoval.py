import csv
from datetime import datetime, timedelta

# removing duplicate rows for several Products with different Revenues per day

i = 0 #counter for early break
data = []
finalRow = {}
transferDict = {}
lastDate = ""
valuesToTransfer = ["Datum", "KielerWoche", "Bewoelkung", "Temperatur", "Windgeschwindigkeit", "Wettercode", "Wochentag", "FerienSH"]


with open('../data/data_combined_sorted_cropped.csv', newline='') as csvfile: # insert ordered dataset!! (chronolgically)
    reader = csv.DictReader(csvfile, delimiter=';')
    for row in reader: 
        if row['Datum'] != lastDate: 
            if i > 1:#dont write at the first element (no data collected yet)         
                data.append({**finalRow, **transferDict})
                finalRow = {}       #reset row
                transferDict = {}

            #run once!!
            for value in valuesToTransfer:
                finalRow[value] = row[value]

        if row["Warengruppe"] != "NA":
            transferDict[row["Warengruppe"]] = row["Umsatz"]
        # print(transferDict)
        i += 1
        lastDate = row['Datum']
            

with open('../data/data_combined_resized.csv', 'w', newline='') as csvfile2:
    writer = csv.DictWriter(csvfile2, fieldnames=valuesToTransfer + ['Brot', 'Brötchen', 'Kuchen', 'Croissant', 'Konditorei', 'Saisonbrot'])

    # Write the header row
    writer.writeheader()

    # Write the data rows
    for row in data:
        writer.writerow(row)
print("DONE")