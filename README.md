# Training1

https://www.kaggle.com/fazilbtopal/popular-unsupervised-clustering-algorithms for Kmeans clustering and hierarchical clustering in Python

>>> df = pd.read_csv('Data.txt', sep="\t",index_col=0)
>>> df
        P1  P2  P3  P4  P5  P6
Gene                          
TP53     1   0   1   0   0   1
CDKN2A   0   0   0   0   0   0
KRAS     1   0   0   1   1   1
HRAS     1  -1  -1   0   0  -1
BRCA2    1  -1   0   0  -1  -1
>>> df = pd.read_csv('Data.txt', sep="\t",index_col=0,index_row=0)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: parser_f() got an unexpected keyword argument 'index_row'
>>> df = pd.read_csv('Data.txt', sep="\t",index_col=0)
>>> df.dtypes
P1    int64
P2    int64
P3    int64
P4    int64
P5    int64
P6    int64
dtype: object
>>> print(df.shape)
(5, 6)
>>> Kmeans=KMeans(3)
>>> Kmeans.fit(df)
KMeans(n_clusters=3)
>>> x=Kmeans.fit(df)
>>> x
KMeans(n_clusters=3)

>>> df = pd.read_csv('Data.txt', sep="\t")
>>> df
     Gene  P1  P2  P3  P4  P5  P6
0    TP53   1   0   1   0   0   1
1  CDKN2A   0   0   0   0   0   0
2    KRAS   1   0   0   1   1   1
3    HRAS   1  -1  -1   0   0  -1
4   BRCA2   1  -1   0   0  -1  -1
>>> X = df.drop(['Gene'], axis=1)
>>> X
   P1  P2  P3  P4  P5  P6
0   1   0   1   0   0   1
1   0   0   0   0   0   0
2   1   0   0   1   1   1
3   1  -1  -1   0   0  -1
4   1  -1   0   0  -1  -1
>>> sns.pairplot(df.drop('CustomerID', axis=1), aspect=1.5)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'sns' is not defined
>>> sns.pairplot(df.drop('CustomerID', axis=1), aspect=1.5)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'sns' is not defined
>>> from sklearn.preprocessing import StandardScaler
>>> 
>>> import numpy as np 
>>> import pandas as pd
>>> import matplotlib.pyplot as plt
>>> import seaborn as sns
>>> %matplotlib inline 
  File "<stdin>", line 1
    %matplotlib inline 
    ^
SyntaxError: invalid syntax
>>> 
>>> import os
>>> import warnings
>>> sns.pairplot(df.drop('CustomerID', axis=1), aspect=1.5)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/nsm-02/packages/lib/python3.8/site-packages/pandas/core/frame.py", line 3990, in drop
    return super().drop(
  File "/home/nsm-02/packages/lib/python3.8/site-packages/pandas/core/generic.py", line 3936, in drop
    obj = obj._drop_axis(labels, axis, level=level, errors=errors)
  File "/home/nsm-02/packages/lib/python3.8/site-packages/pandas/core/generic.py", line 3970, in _drop_axis
    new_axis = axis.drop(labels, errors=errors)
  File "/home/nsm-02/packages/lib/python3.8/site-packages/pandas/core/indexes/base.py", line 5018, in drop
    raise KeyError(f"{labels[mask]} not found in axis")
KeyError: "['CustomerID'] not found in axis"
>>> sns.pairplot(df.drop('Gene', axis=1), aspect=1.5)
<seaborn.axisgrid.PairGrid object at 0x7f6a61133f70>
>>> plt.show()

>>> from sklearn.cluster import KMeans
>>> clusters = []
>>> for i in range(1, 11):
...     km = KMeans(n_clusters=i).fit(X)
...     clusters.append(km.inertia_)
... 
Traceback (most recent call last):
  File "<stdin>", line 2, in <module>
  File "/home/nsm-02/packages/lib/python3.8/site-packages/sklearn/cluster/_kmeans.py", line 997, in fit
    raise ValueError("n_samples=%d should be >= n_clusters=%d" % (
ValueError: n_samples=5 should be >= n_clusters=6
>>> for i in range(1, 6):
...     km = KMeans(n_clusters=i).fit(X)
...     clusters.append(km.inertia_)
... 
>>> fig, ax = plt.subplots(figsize=(12, 8))
>>> sns.lineplot(x=list(range(1, 11)), y=clusters, ax=ax)
<matplotlib.axes._subplots.AxesSubplot object at 0x7f6a580646a0>
>>> ax.set_title('Searching for Elbow')
Text(0.5, 1.0, 'Searching for Elbow')
>>> ax.set_xlabel('Clusters')
Text(0.5, 0, 'Clusters')
>>> ax.set_ylabel('Inertia')
Text(0, 0.5, 'Inertia')
>>> ax.annotate('Possible Elbow Point', xy=(3, 140000), xytext=(3, 50000), xycoords='data',arrowprops=dict(arrowstyle='->', connectionstyle='arc3', color='blue', lw=2))
Text(3, 50000, 'Possible Elbow Point')
>>> ax.annotate('Possible Elbow Point', xy=(5, 80000), xytext=(5, 150000), xycoords='data',arrowprops=dict(arrowstyle='->', connectionstyle='arc3', color='blue', lw=2))
Text(5, 150000, 'Possible Elbow Point')
>>> plt.show()
>>> km3 = KMeans(n_clusters=3).fit(X)
>>> X['Labels'] = km3.labels_
>>> plt.figure(figsize=(12, 8))
<Figure size 1200x800 with 0 Axes>
