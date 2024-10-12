function [x] = conjugate_gradient (A, b, x0, tol, max_iter) 
  # Implementati algoritmul pentru metoda gradientului conjugat
  % implementarea algoritmului din enunt
  r = b - A*x0;
  v = r;
  x = x0;
  tol_sq = tol * tol;
  k = 1;
  while (k <= max_iter && r'*r > tol_sq)
      t = (r' * r) / (v' * A * v);
      x = x + t * v;
      rk = r - t * A * v;
      s = (rk' * rk) / (r' * r);
      v = rk + s * v;
      k = k + 1;
      r = rk;
  endwhile
endfunction
