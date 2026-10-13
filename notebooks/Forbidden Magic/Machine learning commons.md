# EDA - correlation
Get correlation percentages. Values are 0.0-1.0
```python
df.corr()
```
Drop unnecessary columns
```python
df = df.drop(['CYLINDERS', 'FUELCONSUMPTION_CITY', 'FUELCONSUMPTION_HWY','FUELCONSUMPTION_COMB',],axis=1)
```
Check redundancy and linearity
```python
axes = pd.plotting.scatter_matrix(df, alpha=0.2)
# need to rotate axis labels so we can read them
for ax in axes.flatten():
    ax.xaxis.label.set_rotation(90)
    ax.yaxis.label.set_rotation(0)
    ax.yaxis.label.set_ha('right')

plt.tight_layout()
plt.gcf().subplots_adjust(wspace=0, hspace=0)
plt.show()
```

---
# Extract features and labels
```python
X = df.iloc[:,[0,1]].to_numpy()
y = df.iloc[:,[2]].to_numpy()
```
For more features change the list part of X (`[0,1]` above)
- If in array form, `[0,3,5]`, this selects specific columns
- If in range form, `0:5`, this selects range of columns

---
# Train test split
```python
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2,random_state=42)
```

If standardized, make sure to use `X_std` or whatever var name was used in pre-processing
```python
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X_std,y,test_size=0.2,random_state=42)
```

---
# Fit
## Simple linear regression
```python
from sklearn import linear_model

regressor = linear_model.LinearRegression()
regressor.fit(X_train.reshape(-1, 1), y_train)

# Print the coefficients
coef_ =  regressor.coef_
intercept_ = regressor.intercept_

# with simple linear regression there is only one coefficient, here we extract it from the 1 by 1 array.
print ('Coefficients: ',coef_[0])
print ('Intercept: ',intercept_)
```

`X_train.reshape(-1, 1)`
- Convert X_train from 1D array to single column 2D array (since sklearn models expect 2D array with shape (n_observations, n_features))

`np.shape`
Returns `(rows, columns)`

`ndarray.reshape(rows, cols)`
rows = number of rows
cols = number of cols

## Multiple linear regression
```python
from sklearn import linear_model

# create a model object
regressor = linear_model.LinearRegression()

# train the model in the training data
regressor.fit(X_train, y_train)

# Print the coefficients
coef_ =  regressor.coef_
intercept_ = regressor.intercept_

print ('Coefficients: ',coef_)
print ('Intercept: ',intercept_)
```

---
# Transform coefficients back
Transform the coefficients back from the standardized space to the original space
```python
# Get the standard scaler's mean and standard deviation parameters
means_ = std_scaler.mean_
std_devs_ = np.sqrt(std_scaler.var_)

# The least squares parameters can be calculated relative to the original, unstandardized feature space as:
coef_original = coef_ / std_devs_
intercept_original = intercept_ - np.sum((means_ * coef_) / std_devs_)

print ('Coefficients: ', coef_original)
print ('Intercept: ', intercept_original)
```

---
# Plot best fit
```python
plt.scatter(X_train, y_train,  color='blue')
plt.plot(X_train, regressor.coef_ * X_train + regressor.intercept_, '-r')
plt.xlabel("Engine size")
plt.ylabel("Emission")
```

---
# Plot model outputs (multiple linear regression)
Plot coefficients one at a time. Can help determine what features the model handles well.
Ex. bad match for linear regression - output is a curve and model is trying to fit a line

```python
plt.scatter(X_train[:,0], y_train,  color='blue')
plt.plot(X_train[:,0], intercept_[0] + coef_[0,0] * X_train[:,0], '-r')
plt.xlabel("Engine size")
plt.ylabel("Emission")
plt.show()
```
`X_train[:,0]` where column 0 is for the target feature: Engine size

```python
plt.scatter(X_train[:,1], y_train,  color='blue')
plt.plot(X_train[:,1], intercept_[0] + coef_[0,1] * X_train[:,1], '-r')
plt.xlabel("FUELCONSUMPTION_COMB_MPG")
plt.ylabel("Emission")
plt.show()
```
`X_train[:,1]` where column 1 is for the target feature: Fuel consumption comb mpg

---
# Evaluate model
```python
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# Use the predict method to make test predictions
y_pred = regressor.predict(X_test.reshape(-1,1))

# Evaluation
print("Mean absolute error: %.2f" % mean_absolute_error(y_test, y_pred))
print("Mean squared error: %.2f" % mean_squared_error(y_test, y_pred))
print("Root mean squared error: %.2f" % np.sqrt(mean_squared_error(y_test, y_pred)))
print("R2-score: %.2f" % r2_score(y_test, y_pred))
```

---
# Visualization
## Visualize 2 features best fit (plane-hyperplane) Regression
```python
#from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import matplotlib.pyplot as plt

# Ensure X1, X2, and y_test have compatible shapes for 3D plotting
X1 = X_test[:, 0] if X_test.ndim > 1 else X_test
X2 = X_test[:, 1] if X_test.ndim > 1 else np.zeros_like(X1)

# Create a mesh grid for plotting the regression plane
x1_surf, x2_surf = np.meshgrid(np.linspace(X1.min(), X1.max(), 100), 
                               np.linspace(X2.min(), X2.max(), 100))

y_surf = intercept_ +  coef_[0,0] * x1_surf  +  coef_[0,1] * x2_surf

# Predict y values using trained regression model to compare with actual y_test for above/below plane colors
y_pred = regressor.predict(X_test.reshape(-1, 1)) if X_test.ndim == 1 else regressor.predict(X_test)
above_plane = y_test >= y_pred
below_plane = y_test < y_pred
above_plane = above_plane[:,0]
below_plane = below_plane[:,0]

# Plotting
fig = plt.figure(figsize=(20, 8))
ax = fig.add_subplot(111, projection='3d')

# Plot the data points above and below the plane in different colors
ax.scatter(X1[above_plane], X2[above_plane], y_test[above_plane],  label="Above Plane",s=70,alpha=.7,ec='k')
ax.scatter(X1[below_plane], X2[below_plane], y_test[below_plane],  label="Below Plane",s=50,alpha=.3,ec='k')

# Plot the regression plane
ax.plot_surface(x1_surf, x2_surf, y_surf, color='k', alpha=0.21,label='plane')

# Set view and labels
ax.view_init(elev=10)

ax.legend(fontsize='x-large',loc='upper center')
ax.set_xticks([])
ax.set_yticks([])
ax.set_zticks([])
ax.set_box_aspect(None, zoom=0.75)
ax.set_xlabel('ENGINESIZE', fontsize='xx-large')
ax.set_ylabel('FUELCONSUMPTION', fontsize='xx-large')
ax.set_zlabel('CO2 Emissions', fontsize='xx-large')
ax.set_title('Multiple Linear Regression of CO2 Emissions', fontsize='xx-large')
plt.tight_layout()
plt.show()
```

