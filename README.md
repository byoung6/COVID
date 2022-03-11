### [COVID](https://docs.google.com/presentation/d/1rvp-qjYvUckpk5IVLhBNoNzQASPl3vkx3YNAJQ2HaII/edit#slide=id.gf3ad74aadf_0_14)

## Purpose

Using a COVID 19 dataset obtained as of February 28, 2022 from [OurworldinData](https://ourworldindata.org/coronavirus), analyze and develop machine learning models that correlates COVID new vaccinations, ICU Patients, and Deaths to infer the effectiveness of vaccinations and natural immunity. 

## Deliverable One Role Assignments:

- Square - Bryan
- Triangle - Ling
- Circle -Michael
- X - Maliha

## Preliminary Data review and charting

Prior to data processing, the following graphs were created to visualize the correlation of ICU patients, to Deaths, New Deaths to Vaccinations, and Vaccinations to ICUs, through the timeframe of January 2020 to February 26, 2022.

- ICU to Deaths

![ICU to Deaths](https://user-images.githubusercontent.com/76926631/156946033-a94b5a36-b30a-4ebe-95b4-b6e794c5846b.PNG)

- New Deaths to Vaccinations

![New Deaths to Vaccinations across time](https://user-images.githubusercontent.com/76926631/156946081-40fe9231-87ae-4fd3-827b-01ccd5f5fe9f.PNG)


- Vaccinations to ICU

![Vaccinations to ICU](https://user-images.githubusercontent.com/76926631/156946083-4b584c6e-ecfb-4e87-9ccb-cb21b488e61a.PNG)

# Technologies Used
The Technology used for this project will be Python, PostGres and Tableau

## Data Cleaning and Analysis
Pandas will be used to clean the data and perform an exploratory analysis. Further analysis will be completed using different functions in Python.
For example to drop null values, drop any unnecessary columns, checking the types, updating the clean data into new dataframe. 

## Database Storage
PostGres is the database we will be using. We will be saving our final data in CSV, and we will integrate Tableau to CSV.

## Machine Learning
We will be using supervised machine learning.
SciKitLearn is the ML library for python. It has many modules including one for linear regression and LabEncoder for SVM (Support Vector Machine), a binary classifier.
We will work by seperating two classes in a dataset with the widest possible margins. We will:
* Split the data into input (X) and output (y).
* Create a train model
* Create predictions
* Validate the model

## Dashboard
We will be using Tableau as our dashboard. We will integerate our final csv file from pandas to display our findings. The dashboard will include different factor
analysis and the relation between them and how one factor effects the other. For example relation between new vaccinations vs new icu admissions or new deaths.

## Initial Analysis
A cursory review of the data through linear regression details a slight negative correlation through the total data set. The regression equation for correlating New Vaccinations to New Deaths is y=-0.00047023x +30.57783953149005; where as the linear regression equation for Vaccinations v. ICU patients is y=-0.00559162x + 124.30465400246385. 

![Linear Regression New Vaccinations to New Deaths](https://user-images.githubusercontent.com/76926631/156946245-d7eaedcd-9c84-471b-96b3-aac89353211f.PNG)

![Linear Regression Vaccinations v ICU patients](https://user-images.githubusercontent.com/76926631/156946248-0ae1fdd8-f2f2-4ad0-9042-28e6a503367f.PNG)

![KMeans](https://user-images.githubusercontent.com/76926631/156951027-1c7163f6-7d13-487e-9db5-4d412ad583e7.PNG)

![3D Model](https://user-images.githubusercontent.com/76926631/156951019-19afa134-b774-402c-bcb7-9e3467440d96.PNG)

The preliminary analysis notes a slight negative regression line, but at the moment, the data sets hold too much noise to accurately predict future values, much less have a high confidence interval. Therefore, further screening of the data should be done in order to ensure a higher confidence interval and p-value. 

## Next Steps

Due to the scope of the analysis, the data should be further cleaned to omit sources of data prior to vaccination role out. This will help reduce overall noise of the graphs. 
