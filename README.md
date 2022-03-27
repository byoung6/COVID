# [COVID Google slides linked](https://docs.google.com/presentation/d/1rvp-qjYvUckpk5IVLhBNoNzQASPl3vkx3YNAJQ2HaII/edit#slide=id.gf3ad74aadf_0_14)

## Purpose

Using a COVID 19 dataset obtained as of February 28, 2022 from [OurworldinData](https://ourworldindata.org/coronavirus), analyze and develop machine learning models that correlates COVID new vaccinations, ICU Patients, and Deaths to infer the effectiveness of vaccinations and natural immunity. Our aim is to develop a model to predit death rates from new cases, icu patients, new vaccinations, people fully vaccinated, and total boosters. We train the model using the US specific data, and test against the remaining counties from the data set. 

### Technologies Used
The Technology used for this project are:
- Python/Jupyter Notebook
- PostgreSQL /pgAdmin 4
- Sklearn/Pandas
- Tableau

### Database Storage
The CSV will be stored via SQL, of which we will be pulling from the SQL server to instance data. Two tables were created, one specifically focusing on USA covid metrics, and the other looking at global covid metrics.

![ERD](https://user-images.githubusercontent.com/76926631/160034341-b09f97be-7e25-467e-afb0-dc47c80ae71b.png)

### Preliminary Data review and charting

### Reducing spreadsheet noise by ETL and exploratory data analysis

The data set includes approximately 60 columns of data that can be used for various purposes. Due to the our limited scope, pre-processing of data was conducted to limit the fields to specifically: date, location, continent, new_cases_smoothed, icu_patients, icu_patients_per_million, new_deaths_smoothed, new_vaccinations_smoothed, people_fully_vaccinated_per_hundred, total_boosters_per_hundred, new_people_vaccinated_smoothed_per_hundred, people_fully_vaccinated, total_boosters, and new_vaccinations. This was done by way of dropping null values, and dropping duplicate values. 

The following graphs were created to visualize the correlation of ICU patients, to Deaths, New Deaths to Vaccinations, and Vaccinations to ICUs, through the timeframe of January 2020 to February 26, 2022, without further filtering (global values).

- ICU to Deaths

![ICU to Deaths](https://user-images.githubusercontent.com/76926631/156946033-a94b5a36-b30a-4ebe-95b4-b6e794c5846b.PNG)

- New Deaths to Vaccinations

![New Deaths to Vaccinations across time](https://user-images.githubusercontent.com/76926631/156946081-40fe9231-87ae-4fd3-827b-01ccd5f5fe9f.PNG)

- Vaccinations to ICU

![Vaccinations to ICU](https://user-images.githubusercontent.com/76926631/156946083-4b584c6e-ecfb-4e87-9ccb-cb21b488e61a.PNG)

### Initial Analysis
A cursory review of the data through linear regression details a slight negative correlation through the total data set. The regression equation for correlating New Vaccinations to New Deaths is y=-0.00523123x + 122.90020074392727; where as the linear regression equation for Vaccinations v. ICU patients is y=-0.00047023x +30.57783953149005. 

![Linear Regression New Vaccinations to New Deaths_smoothed](https://user-images.githubusercontent.com/76926631/157681511-4f2bc479-2d92-474c-bb95-25b55b9987a5.PNG)

![Linear Regression Vaccinations v ICU patients](https://user-images.githubusercontent.com/76926631/156946248-0ae1fdd8-f2f2-4ad0-9042-28e6a503367f.PNG)

![KMeans](https://user-images.githubusercontent.com/76926631/156951027-1c7163f6-7d13-487e-9db5-4d412ad583e7.PNG)

![3D Model](https://user-images.githubusercontent.com/76926631/156951019-19afa134-b774-402c-bcb7-9e3467440d96.PNG)

The preliminary analysis notes a slight negative regression line, but at the moment, the data sets hold too much noise to accurately predict future values, much less have a high confidence interval. Therefore, further screening of the data should be done in order to ensure a higher confidence interval and p-value. 


### Machine Learning
The data is run through linear regression models, SVM models, and Random Forest Regressor models to find the best fit. Due to the nature of the data set, and the limitations inherent in the Linear Regression and SVM models, we have determined that Random Forest Regressor models are the best to predict future death rates. Random Forest Regressor is better for hybrid classification regression models. We decided to train 80% of the data set and test the remaining 20 on our model (US data set). Our training data set shows an average delta between predicted and actual deaths of 3.24%

![RFR Training US](https://user-images.githubusercontent.com/76926631/159176616-b8ea010b-72c6-4d69-8aef-7abf72990a0a.PNG)

![image](https://user-images.githubusercontent.com/76926631/159732237-9a2f09e0-5fe2-4764-9590-d51888c5a7ba.png)

Calculating the Mean Squared value gives us a MSE of 71.00843
![USA MSQ](https://user-images.githubusercontent.com/76926631/160300107-62d71ff7-597a-4322-8d24-a728951fd90f.PNG)


Once a training model was established, we tested the model on the remaining clean data.

### Testing

![RFR Test Canada](https://user-images.githubusercontent.com/76926631/159176630-3b0f4637-8026-4529-8251-d3df127fd929.PNG)
![RFR Test France](https://user-images.githubusercontent.com/76926631/159176631-83643b1a-8301-4843-9f83-d89d4ff5041c.PNG)
![RFR Test Germany](https://user-images.githubusercontent.com/76926631/159176632-aca99228-6d15-420a-9ede-ff500e8a5ae9.PNG)
![RFR Test Italy](https://user-images.githubusercontent.com/76926631/159176633-c46e7827-e8c4-413e-8358-ade999a72b98.PNG)
![RFR Test Spain](https://user-images.githubusercontent.com/76926631/159176634-80676c50-e66f-49f4-8cc3-673ef4eeb411.PNG)
![RFR Test United Kingdom](https://user-images.githubusercontent.com/76926631/159176635-afefa56a-8ff5-480e-8a26-7acc219d7f38.PNG)

### Problems with the Model
Despite some relative succcess in testing and training, with a low average delta, there are some variables of the data set that caused poor test samples. Examples as follows:

![Poor Ireland](https://user-images.githubusercontent.com/76926631/159176958-7b6ab066-5148-4553-8686-00c2d3f3977f.PNG)
![Poor Israel](https://user-images.githubusercontent.com/76926631/159176959-2e7bf4fc-6175-4c2d-9793-78c7ea168826.PNG)
![Poor Japan](https://user-images.githubusercontent.com/76926631/159176961-11e95752-5033-4814-88c1-33d74069e94f.PNG)
![Poor Portugal](https://user-images.githubusercontent.com/76926631/159176962-3b740d87-1bbd-4bf4-859f-ba1cb5d71b08.PNG)

The sudden spikes in delta note deficiencies or alternative causes for predicting death rates. As such, more data would be necessary in some cases (such as japan only having 7 data points), or alternative "x" independent variables would be required to properly predict death rate. 
