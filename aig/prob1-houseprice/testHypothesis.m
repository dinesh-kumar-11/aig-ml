function [RMSE, PredictedYAndActualY, predictedY] = testHypothesis(testDataX, testDataY, theta, algorithmName) 

fprintf('Sample testDataX for %s... \n', algorithmName);
testDataX(1:5,:)

testSize = size(testDataX, 1);
predictedY = zeros(size(testDataY), 1);
% ============================================================

for i= 1:testSize
  predictedY(i) = testDataX(i,:)*theta;
endfor

fprintf("Predicted Price, actual Price in  %s... \n", algorithmName);

PredictedYAndActualY = horzcat(predictedY, testDataY);
PredictedYAndActualY(1:5,:)
fprintf('....Modify code to see all values \n')

RMSE = rmse(predictedY, testDataY);
fprintf('RMSE for %s regression is. %f \n',algorithmName, RMSE);
end