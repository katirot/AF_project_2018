function detectorCV = CV(RRinterval, window_size, step_size, threshold)
% Calculates the detector value with Coefficient of Variation
    RRlength = length(RRinterval);
    detectorCV = 2*ones(1,RRlength);
    CV = zeros(1,RRlength);
    for beat = window_size/2 + 1:RRlength-window_size/2
        currentValues = RRinterval(beat-window_size/2:beat+window_size/2);
        CV(beat) = var(currentValues)/mean(currentValues);
        if CV(beat) > threshold
            detectorCV(beat) = 1;
        else 
            detectorCV(beat) = 0;
        end     
    end    
end

