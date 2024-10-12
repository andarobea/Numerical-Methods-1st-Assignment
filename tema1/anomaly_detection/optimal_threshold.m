% Finds the best threshold to use for selecting outliers.
function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)

    % initializare
    best_epsilon = 0;
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;
    % minimul si maximul vectorului de probabilitati
    min_prob = min(probabilities);
    max_prob = max(probabilities);
    % genereaza 1001 epsilon-uri echidistante între min_prob si max_prob
    epsilons = linspace(min_prob, max_prob, 1001);

    for i = 1 : 1001
        predictions = 0;
        predictions = probabilities < epsilons(i); % prezice aberatiile pe baza epsilon-ului curent
        [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths);

        % Calculează totalul pozitivelor
        total_positives = true_pozitives + false_pozitives;

        precision = true_pozitives / total_positives;
        recall = true_pozitives / (true_pozitives + false_negatives);
        F1 = 2 * precision * recall / (precision + recall); % calculare F1

        if (F1 > best_F1) % alege best_F1 si retine precizia si recall-ul asociate
            best_F1 = F1;
            associated_precision = precision;
            associated_recall = recall;
            best_epsilon = epsilons(i);
        endif

    endfor

endfunction
