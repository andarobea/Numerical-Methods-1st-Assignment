function probability = gaussian_distribution(X, mean_value, variance)

    [m, n] = size(X);
    elem = (-1 / 2) * (X(:, :) - mean_value) * inv(variance) * (X(:, :)- mean_value)';
    probability = exp(elem) * (1 / ((2 * pi)^(n/2) * det(variance)^(1/2)));
endfunction