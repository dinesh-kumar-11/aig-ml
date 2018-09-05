function [c, sigma] = computeCombination() 

i=0.01;
j=0.01;
do
  do
    fprintf("i value is %f ", i);
    fprintf("j value is %f \n", j);
    j = j+0.01;
  until (j>=30)
  i = i+0.01;
until (i>=30)

end