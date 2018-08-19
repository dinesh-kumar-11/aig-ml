%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%Load All Data
allData = load('house_all_clean.csv');
allRowDataSize = size(allData,1)
trainPercentageRows = round((90/100)*allRowDataSize)
trainData = allData(1:trainPercentageRows,:);
% Print out some data points
fprintf('First 5 examples from the trainData dataset: \n');
fprintf(' trainData = ;');
trainData(1:5, :)
testData = allData(trainPercentageRows+1:allRowDataSize,:);
% Print out some data points
fprintf('First 5 examples from the testData dataset: \n');
fprintf(' testData = ;');
testData(1:5, :)

pause;

%% Load Data
data_col = size(trainData,2)
X = trainData(:, 1:(data_col-1));
y = trainData(:, data_col);
m = length(y);

% Print out some data points
fprintf('First 5 examples from the dataset: \n');
fprintf(' x = ;');
X(1:5, :)
fprintf(' y = ')
y(1:5,:)

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.05;
num_iters = 500;

% Init Theta and Run Gradient Descent 
theta = zeros(data_col, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
[testDataX, testDataY] = loadTestData(testData);

% Normalize the test based on mean and sigma from test data
testDataX = featureNormalizeTest(testDataX, mu, sigma);

% What if normalize using test data?
%[testDataX, mu, sigma] = featureNormalize(testDataX);

% Add intercept term to X
testDataX = [ones(size(testDataX, 1), 1) testDataX];


[RMSE, PredictedYAndActualY, predictedY] = testHypothesis(testDataX,testDataY, theta, "Gradient Decent");
fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data_col = size(trainData,2)
X = trainData(:, 1:(data_col-1));
y = trainData(:, data_col);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% ====================== Testing Data and RMSE ======================
[testDataX, testDataY] = loadTestData(testData);

% Add intercept term to X
testDataX = [ones(size(testDataX, 1), 1) testDataX];

[RMSE, PredictedYAndActualY, predictedY] = testHypothesis(testDataX,testDataY, theta,"Normal Eq");

fprintf('Program paused. Press enter to continue.\n');
pause;

% ============================================================

% OLS Regression in Octave

data_col = size(trainData,2)
olsX = trainData(:, 1:(data_col-1));
olsY = trainData(:, data_col);
% Add intercept term to X
olsX = [ones(m, 1) olsX];
[BETA, SIGMA, R] = ols (olsY, olsX);

fprintf('The values of Theta, Sigma, R from OLS regression is ');
BETA
SIGMA
% ====================== YOUR CODE HERE ======================
[testDataX, testDataY] = loadTestData(testData);

% Add intercept term to X
testDataX = [ones(size(testDataX, 1), 1) testDataX];

[RMSE, PredictedYAndActualY, predictedY] = testHypothesis(testDataX,testDataY, BETA,"OLS");

fprintf('Program paused. Press enter to continue.\n');
pause;

% ================ Part 3: Normal Equations ================

fprintf('Solving with regularized normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data_col = size(trainData,2)
X = trainData(:, 1:(data_col-1));
y = trainData(:, data_col);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqnRegularized(X, y, 800);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% ====================== Testing Data and RMSE ======================
[testDataX, testDataY] = loadTestData(testData);

% Add intercept term to X
testDataX = [ones(size(testDataX, 1), 1) testDataX];

[RMSE, PredictedYAndActualY, predictedY] = testHypothesis(testDataX,testDataY, theta,"Normal Eq Regularized");

fprintf('Program paused. Press enter to continue.\n');
pause;

