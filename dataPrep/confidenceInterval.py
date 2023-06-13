import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# CSV-Datei einlesen
data = pd.read_csv('data/final/data_training.csv', delimiter=';')

grouped_data = data.groupby(["KielerWoche", "FerienSH"])["Umsatz"].agg(["mean", "std"]).reset_index()

x = np.arange(len(grouped_data))
bar_width = 0.35

fig, ax = plt.subplots()
rects1 = ax.bar(x - bar_width/2, grouped_data[grouped_data["FerienSH"] == "TRUE"]["mean"], bar_width, yerr=grouped_data[grouped_data["FerienSH"] == "TRUE"]["std"], label="FerienSH: TRUE")
rects2 = ax.bar(x + bar_width/2, grouped_data[grouped_data["FerienSH"] == "FALSE"]["mean"], bar_width, yerr=grouped_data[grouped_data["FerienSH"] == "FALSE"]["std"], label="FerienSH: FALSE")

# Add labels, title, and legend
ax.set_xlabel("KielerWoche")
ax.set_ylabel("Umsatz")
ax.set_title("Impact of KielerWoche and FerienSH on Umsatz")
ax.set_xticks(x)
ax.set_xticklabels(grouped_data["KielerWoche"])
ax.legend()

plt.tight_layout()
plt.show()