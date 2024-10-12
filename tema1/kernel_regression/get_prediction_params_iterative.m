function [a] = get_prediction_params_iterative (K, y, lambda)
  # TO DO: folosind metode iterative, implementati logica
  # pentru a obtine vectorul coloana a, asa cum este descris in enuntul temei
  m = rows(K);
  Im = eye(m);
  A = lambda * Im + K;
  B = zeros(m,m); % inversa lui A
  x0 = zeros(m, 1);
  tol = 10^(-7);
  max_iter = 1000;

  for i = 1 : m
      B(: , i) = conjugate_gradient(A, Im(:, i), x0, tol, max_iter);
      % calcularea coloanelor lui B cu metoda gradientului conjugat
  endfor

  a = lambda * B * y;
  % formula pentru obtinerea lui a, descrisa in enunt

endfunction
