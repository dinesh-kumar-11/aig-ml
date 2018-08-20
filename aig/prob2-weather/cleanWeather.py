import pandas as pd
import numpy as np
import datetime
import random
import matplotlib.pyplot as plt
import matplotlib.dates as mdates


df = pd.read_csv("weatherHistory.csv")

to_drop = ["Daily Summary", "Summary", "Precip Type"]
#to_drop.append("Temperature (C)")
df.drop(to_drop, inplace=True, axis=1)

print(df.head())
print(df.get_dtype_counts())

df["Formatted Date"]=pd.to_datetime(df["Formatted Date"])
df["Formatted Date"]=df["Formatted Date"].dt.hour

cols = list(df)
print(cols)
cols.insert(8, cols.pop(cols.index('Apparent Temperature (C)')))
print(cols)
df = df.ix[:, cols]

print(df.get_dtype_counts())
print(df.head())
df.to_csv("weatherHistory_clean.csv", sep=',', index=False, header=False)
