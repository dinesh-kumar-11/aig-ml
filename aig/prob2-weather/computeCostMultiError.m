function rmseVal = computeCostMultiError(predeictedvalues, actualValues) 
  % Root Mean Squared Error
  m=size(predeictedvalues,1);
  rmseVal = (1/(2*m))*(sum((predeictedvalues - actualValues).^2));  
end
