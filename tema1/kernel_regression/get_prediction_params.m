function [a] = get_prediction_params (K, y, lambda)
  # TO DO: folosind metode neiterative, implementati logica
  # pentru a obtine vectorul coloana a, asa cum este descris in enuntul temei
  m = rows(K);
  Im = eye(m);
  A = lambda * Im + K;
  C = cholesky(A);
  L = get_lower_inverse(C); % inversa lui C
  % formula pentru obtinerea lui a, descrisa in enunt
  a = lambda * L' * L * y;

endfunction


# A*B=I
# L*LT*B=Im
# LT*B=L^-1
# B = (LT)-1 * L^-1
# inversa transpusei unei matrice inferior triunghiulare este transpusa inversei matricei respective