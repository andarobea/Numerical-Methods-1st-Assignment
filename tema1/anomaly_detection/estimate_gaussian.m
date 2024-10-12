% This function estimates the parameters of a Gaussian distribution using the data in X.

function [mean_values variances] = estimate_gaussian(X)

    [m, n] = size(X);

    mean_values(1:n) = sum(X(:, 1:n)) / m; % suma de pe coloanele 1:n

    variances = ((X( :, :) - mean_values)' * (X( :, :) - mean_values)) * 1 / m; % matricea de deviatii dupa formula din enunt

endfunction
