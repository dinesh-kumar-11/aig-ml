function [theta] = normalEqnRegularized(X, y, lamda)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------

%Regularization
%θ=pinv(X'X+λ⋅L)X'y
L= eye(size(X, 2));
L(1) = 0;
L

temp = pinv((X'*X)+lamda*L);
theta = temp*X'*y;


% -------------------------------------------------------------


% ============================================================

end
