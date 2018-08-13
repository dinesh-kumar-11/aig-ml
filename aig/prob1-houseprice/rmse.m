function rmseVal = rmse(predeictedvalues, actualValues) 
  % Root Mean Squared Error
  rmseVal = sqrt(mean((predeictedvalues - actualValues).^2));  
end
