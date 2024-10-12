function B = k_secv (A, k)
  % given an array [a b a b c] and k=2
  % should return [ab ba ab bc]
  % HINT: use strjoin 
    l = length(A);
    inc = 1; % indexul de start al secventei
    fin = inc + k - 1;  % indexul de final al secventei
    cnt = 0; % indexul elementului curent
    while (fin < l) % cat timp nu am ajuns la ultima secventa
        C = A(inc:fin); % extrag secventa
        cnt = cnt + 1;
        B{cnt} = strjoin(C,' ');  % cinvertitre la string in formatul cerut
        inc++; % trecem la urmatoarea secventa
        fin++;
    endwhile
    B = B';
endfunction
