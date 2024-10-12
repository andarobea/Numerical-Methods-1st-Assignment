function probs = sample_next_word (text, words_idx, k_secv_idx, k, stoch)
    % return scaled or unscaled probabilities (line of the stochastic matrix) corresponding to the last k-squence of text
    last_k_seq = text(end-k+1:end);

    % Găsim indicele corespunzător în dicționarul k-secvențelor
    k_seq_index = find(strcmp(k_secv_idx, last_k_seq));
    % Returnăm probabilitățile asociate liniei corespunzătoare în matricea stochastică
    probs = stoch(k_seq_index, :);
endfunction
