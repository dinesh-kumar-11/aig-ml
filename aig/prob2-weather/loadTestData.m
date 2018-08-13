function [testDataX, testDataY] = loadTestData(fileName)

data = load(fileName);
data_col = size(data,2);
X = data(:, 1:(data_col-1));
y = data(:, data_col);
m = length(y);

testDataX = X;
testDataY = y;

end