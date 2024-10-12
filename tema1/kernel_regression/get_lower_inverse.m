%eliminare Gauss-Jordan

function [P] = get_lower_inverse (L)
  # TO DO: Determinati printr-o metoda matriceala neiterativa inversa
  # unei matrici de tipul lower
    
    n=rows(L);
    T=[L eye(n)];
    detL=1;
    for i=1:n
        [~,p]=max(abs(T(i:n,i)));
        p+=i-1;

        if p~=i
            detL*=-1;
            tempr=T(i,:);
            T(i,:)=T(p,:);
            T(p,:)=tempr;
        endif

        detL*=T(i,i);
        for j=i+1:n
            T(j,:)=T(j,:)-T(j,i)/T(i,i)*T(i,:);
        endfor
    endfor

    for i=n:-1:1
      T(i,:)/=T(i,i);
      for j=i-1:-1:1
        T(j,:)=T(j,:)-T(j,i)*T(i,:);
      endfor

    endfor
    P=T(:,n+(1:n));

endfunction
