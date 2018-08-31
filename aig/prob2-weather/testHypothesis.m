function [RMSE, PredictedYAndActualY, predictedY] = testHypothesis(testDataX, testDataY, theta, algorithmName) 

fprintf('Sample testDataX for %s... \n', algorithmName);
testDataX(1:5,:)

testSize = size(testDataX, 1);
predictedY = zeros(size(testDataY), 1);
% ============================================================

for i= 1:testSize
  predictedY(i) = testDataX(i,:)*theta;
endfor

fprintf("Predicted Y, actual Y in  %s... \n", algorithmName);

PredictedYAndActualY = horzcat(predictedY, testDataY);
PredictedYAndActualY(1:5,:)
fprintf('....Modify code to see all values \n')
fprintf('Histogram of Predicted Y, ActualY \n')
clf
plot (PredictedYAndActualY);
%hist (PredictedYAndActualY);
%c = predictedY .* testDataY;
%scatter (predictedY, testDataY,[], c);
hold on

title(algorithmName);
legend("Predicted Y", "Actual Y");
ylabel("Y Values")
fprintf('Press enter to continue.. \n')
pause

RMSE = rmse(predictedY, testDataY);
fprintf('RMSE for %s regression is. %f \n',algorithmName, RMSE);
J = computeCostMultiError(predictedY, testDataY, theta);
fprintf('J (cost error with trained theta) for testset in  %s regression is. %f \n',algorithmName, J);
end