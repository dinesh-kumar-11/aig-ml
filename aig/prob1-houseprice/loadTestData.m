function [testDataX, testDataY] = loadTestData(testData)


data_col = size(testData,2);
X = testData(:, 1:(data_col-1));
y = testData(:, data_col);
m = length(y);

testDataX = X;
testDataY = y;

end