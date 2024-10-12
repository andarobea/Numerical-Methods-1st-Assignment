% Computes the probability density function of the multivariate gaussian distribution.
function probabilities = multivariate_gaussian(X, mean_values, variances)
    [n, m] = size(variances);

    [x, y] = size(X);

    probabilities = zeros(1, x)';

    for i = 1 : x
        elem = (-0.5) * (X(i, :) - mean_values) * inv(variances) * (X(i, :) - mean_values)';
        probabilities(i) = exp(elem) * (1 / ((2 * pi)^(n/2) * det(variances)^(1/2)));
    end

endfunction
