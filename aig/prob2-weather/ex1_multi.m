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


%% Load Data
data = load('house_train_clean.csv');
data_col = size(data,2)
X = data(:, 1:(data_col-1));
y = data(:, data_col);
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
[testDataX, actualPrice] = loadTestData("house_test_clean.csv");

% Normalize the test based on mean and sigma from test data
testDataX = featureNormalizeTest(testDataX, mu, sigma);

% What if normalize using test data?
%[testDataX, mu, sigma] = featureNormalize(testDataX);

% Add intercept term to X
testDataX = [ones(size(testDataX, 1), 1) testDataX];

fprintf('Sample testDataX... \n');
testDataX(1:5,:);


testSize = size(testDataX, 1);
predictedPrize = zeros(size(actualPrice), 1);
% ============================================================

for i= 1:testSize
  predictedPrize(i) = testDataX(i,:)*theta;
endfor

fprintf("Predicted Price, actual Price is \n");

resultGradientDecent = horzcat(predictedPrize, actualPrice);
fprintf('result from Gradient Decent...')
resultGradientDecent(1:5,:)
fprintf('....Modify code to see all values')

rmseGradDecent = rmse(predictedPrize, actualPrice);
fprintf('RMSE for Gradient Decent is. %f \n', rmseGradDecent);


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
data = csvread('house_train_clean.csv');
data_col = size(data,2)
X = data(:, 1:(data_col-1));
y = data(:, data_col);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
[testDataX, actualPrice] = loadTestData("house_test_clean.csv");

% Add intercept term to X
testDataX = [ones(size(testDataX, 1), 1) testDataX];

fprintf('Sample testDataX... \n');
testDataX(1:5,:)

testSize = size(testDataX, 1);
predictedPrize = zeros(size(actualPrice), 1);
% ============================================================

for i= 1:testSize
  predictedPrize(i) = testDataX(i,:)*theta;
endfor

fprintf("Predicted Price, actual Price is \n");

predictedPrize(1:2, :)
resultNormalEq = horzcat(predictedPrize, actualPrice);

fprintf('results from Normal Equation...')
resultNormalEq(1:5,:)
fprintf('....Modify code to see all values \n')

rmseGradDecent = rmse(predictedPrize, actualPrice);
fprintf('RMSE for Gradient Decent is. %f \n', rmseGradDecent);
