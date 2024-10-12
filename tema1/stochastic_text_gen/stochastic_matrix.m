function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)
    m = length(k_secv_set);
    n = length(words_set);
    retval = sparse(m, n); % Utilizam o matrice sparse pentru eficienta

    % Cream un map pentru a cauta rapid indexul cuvintelor
    word_indices = containers.Map(words_set, 1:n);

    for i = 1:m
        k_sec = k_secv_set{i}; % k_secventa din setul sortat și UNIC

        % Cautam indicii la care se afla k_sec in k_secv_corpus
        k_indices = find(strcmp(k_secv_corpus, k_sec));
        l = length(k_indices);

        % Initializăm un contor pentru numărarea aparitiilor cuvintelor
        word_count = zeros(1, n);

        % Calculam de cate ori apare cuvantul corespunzator
        for j = 1:l
            % Calculare index
            idx = k_indices(j) + k;

            % Verificam daca indexul depaseste limitele
            if idx > 0 && idx <= length(corpus_words)
                % Calculam indexul cuvantului corespunzator
                word_index = word_indices(corpus_words{idx});

                % Incrementam word_count
                word_count(word_index) = word_count(word_index) + 1;
            end
        end

        % Actualizare linie matrice
        retval(i, :) = word_count;
    end
end
