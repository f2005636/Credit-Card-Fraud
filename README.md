# Credit-Card-Fraud

Data is taken from: https://www.kaggle.com/mlg-ulb/creditcardfraud
It contains only numerical input variables. There are 30 features, due confidentiality issues the features are named as V1, V2, ... V28, Time' and Amount. Feature 'Class' is the response variable and it takes value 1 in case of fraud and 0 otherwise.

Since the event rate is very low (0.17%), sampling technique has been used to boost the event rate. 
From Event = 1 (Fraud): 100% observations (492) are kept 
From Event = 0 (No Fraud): 3% observations (8,611) are kept 


**Artificial Neural Network**

* Count of neurons in input layer: 87
* Count of neurons in hidden layer 1: 58
* Count of neurons in hidden layer 2: 29
* Count of neurons in output layer: 1


**Metrics**

* F1: 0.902
* Accuracy: 99.01%
