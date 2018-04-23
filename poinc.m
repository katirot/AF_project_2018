function AF_cand_Poincare = poinc(RRinterval, window_size, step_size)
    % AF_cand_Poincare is looking or AF candidates in RRinterval using the Poincare plot method according to 
    % 'Atrial Fibrillation Detection Based on Poincar? plot of RR Intervals' by G. Tuboly and G. Kozmann 
    % The function is analyzing part of the RRinterval in one window positioned around a point p and giving
    %  back '1' if it detected AF, otherwise '0', for this point p. The
    %  output has the same length as the analyzed area. Thus
    %  length(AF_cand_Poincare)=length(RRinterval)-start_point;
    %
    % Input:
    % RRinterval = Vector with RRintervals to be investigated
    % start_point = Integer. Position in RRinterval where to start to
    % search for AFs. Note, start_point > window_size/2 && <
    % lengt(RRinterval-window_size/2)
    % window_size = Integer. Size of window of RR interval to be investigated at once (slided over RRinterval)
    % step_size = Integer. Step size for sliding the window 
    %
    % start_point must be an index of RRinterval and <(length(RRinterval)-window_size/2)
    % window_size must be smaller than length(RRinterval)
    
    %% START

    %run Poincare Testing
    AF_cand_Poincare=2*ones(1,length(RRinterval)); %output just for analyzed region!
    %AF_cand=2; %0= no definitely not, 1= yes AF (candidate), 2= unsure/to be defined
    p=1+window_size/2; %counter/position in AF_cand_poincare (+1 due to RR_test generation)
    c=1; %counter of iterations/position in AF_cand_Poincare
    
    while p <= (length(RRinterval)-window_size/2) %p=position of calculation (mitten av foenstret)
        RR_test=RRinterval((p-window_size/2):(p+window_size/2)); %to be analyzed window to get 'yes or no'
        
        sum1=0;
        for j=1:(window_size-1)
            sum1=sum1+(RR_test(j)-RR_test(j+1))^2;
        end
        sum2=0;
        for k=1:(window_size-1)
         sum2=sum2+abs(RR_test(k)-RR_test(k+1));
        end
        sum3=0;
        for l=1:(window_size-1)
           sum3=sum3+RR_test(l);
        end
        
        d=sqrt(1/(2*(window_size-1))*sum1-(1/((window_size-1)*sqrt(2))*sum2)^2)/(1/(2*(window_size-1))*(-RR_test(1)-RR_test(window_size+1)+2*sum3));
        
        if d <= 0.06 %0.06
            AF_cand=0;
        else
            AF_cand=1;

        end
        AF_cand_Poincare(p)=AF_cand;
        
        c=c+1;
        p=p+step_size;
    end         
end