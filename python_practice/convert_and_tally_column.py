import pandas as pd

exam_data = {'name': ['Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'],
'score': [12.5, 9, 16.5, 8, 9, 20, 14.5, 2, 8, 19],
'attempts': [1, 3, 2, 3, 2, 3, 1, 1, 2, 1],
'qualify': ['yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes']}

labels = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']

df = pd.DataFrame(exam_data, index=labels)

print(df)

## 1. convert qualify values from yes/no to true/false

yes_no_map = {'yes': True, 'no': False}

df['qualify'] = df['qualify'].map(yes_no_map)

print('\n')
print('qualify column converted to bools:')
print(df)

## 2. count true/false values in quailfy

print('\n')
print('qualify split:')
print(df['qualify'].value_counts())




### select row by condition - more than 2 attempts

exam_data = {'name': ['Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'],
'score': [12.5, 9, 16.5, np.nan, 9, 20, 14.5, np.nan, 8, 19],
'attempts': [1, 3, 2, 3, 2, 3, 1, 1, 2, 1],
'qualify': ['yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes']}
labels = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']


df[df['attempts'] > 2]
df[df['attempts'] > 2]



df.attempts
df['qualify']
## but, for two or more columns:
df[['attempts', 'qualify']]


### adding a column, adds a column all with score 70:
df['grade'] = 70
#addubg more data, use numpy arrray:
import numpy as np

# replace entire column with 10 random values between 59 and 100
df['grade'] = np.random.randint(59, 101, 10)

avg_col = np.arange(0,10) # ranged numbers from 0-10 in an array
df['average score'] = avg_col

# create random array of 10 numbers between 1 and 99
np.random.randint(1, 100, size=10)

df['average score'] = np.random.randint(1, 100, size=10)




## make large, random df:
num_rows = 100000
num_cols = 10

data = {}

for i in range(num_cols):
   col_name = f'col{i+1}'
   data[col_name] = np.random.randint(low=0, high=100, size=num_rows)

large_df = pd.DataFrame(data)

large_df.describe()

#check memory usage on large_df
large_df.memory_usage()


### average cols per row and add new col with average
### super tedius, hard-coded way:
large_df["tedius_average"] = (large_df["col1"] + large_df["col2"] + large_df["col3"] + large_df["col4"] + large_df["col5"] + large_df["col6"] + large_df["col7"] + large_df["col8"] + large_df["col9"] + large_df["col10"]) / 10

### easier way:
large_df["easier_average"] = large_df.mean(axis=1)




#### Polars Practice:

import polars as pl

pl_exam_data = {'key': ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'],
'name': ['Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'],
'score': [12.5, 9, 16.5, 8, 9, 20, 14.5, 2, 8, 19],
'attempts': [1, 3, 2, 3, 2, 3, 1, 1, 2, 1],
'qualify': ['yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes']}

pldf = pl.DataFrame(exam_data)

# pldf['qualify'] = pldf['qualify'].map(yes_no_map)
pldf['qualify'].map_dict({"yes":False, "no":True})
pldf.col("qualify").replace('yes', True))
pldf.with_columns(replaced=pl.col("qualify").replace('no', False))

