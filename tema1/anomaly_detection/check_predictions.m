
function [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths)
    false_pozitives = 0;
    false_negatives = 0;
    true_pozitives = 0;
    p = rows(predictions);

    for i = 1:p
        if (predictions(i) == truths(i))
            true_pozitives += predictions(i);
        else
            false_pozitives += predictions(i);
            false_negatives += truths(i);
        endif
    end

endfunction