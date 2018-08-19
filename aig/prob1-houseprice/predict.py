import pandas as pd
import numpy as np
import datetime
import random
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from sklearn.model_selection import train_test_split

df = pd.read_csv("house_all_clean.csv", header=None)

print(df.head())

# Get the X and y data from the DataFrame
X = df[0:12].as_matrix()
y = df[13].as_matrix()

# Create the train and test data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

print(y)
