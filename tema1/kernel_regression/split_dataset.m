function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)
  # TO DO: împarte setul de date în 2 seturi: 
  # un set de training si un set de test,
  # ambele reprezentate printr-o matrice de features un vector de clase
  # percentage este un parametru considerat intre 0 si 1
  
  # Fiecare linie a matricii X reprezinta x^{(i)} si fiecare element de pe
  # linia coloanei y reprezinta y^{(i)}

  lines = rows(X); % nr de randuri din X

  rows_train = round(percentage * lines); % nr de randuri din setul de antrenament
  rows_predict = round((1 - percentage) * lines);

  X_train = X(1 : rows_train, : ); % extragere primele rows_train randuri
  y_train = y(1 : rows_train, : ); % extragere primele rows_train coloane
  X_pred = X((rows_train + 1) : lines, : ); % extragere ultimele rows_predict randuri
  y_pred = y((rows_train + 1): lines, : ); % extragere ultimele rows_predict coloane

endfunction
