%% Mission: Solving the Clusters!
function system=systematically(RR_test,k_max)
    RR_window=RR_test;
    kmax=k_max;
    %plot(RR_window(1:(length(RR_window)-1)), RR_window(2:length(RR_window)),'b.');

    X=[RR_window(1:(length(RR_window)-1)); RR_window(2:length(RR_window))].'; %x-values in 1. spalte, y-values in 2. spalte
    %plot(X(:,1), X(:,2),'r.');

%make a silhouette plot using the cluster indices output from kmeans. 
%The silhouette plot displays a measure of how close each point in one 
%cluster is to points in the neighboring cluster
% +1= totally fine defined, 0= can be either this or another cluster,
% -1=probably assigned the wrong cluster.

    %create a while loop through different ks... (this itself it not very
    %fast but also not ultra slow...)
    k=1;
    mean_vector=zeros(1,kmax);
    
    while k<kmax
        idx=kmeans(X,k);
        s=silhouette(X,idx);
        mean_silh_val=mean(s);
        mean_vector(k)=mean_silh_val;
        k=k+1;
    end    
    k_best=find(mean_vector==max(mean_vector)); %is varying! in discussion: checking for replicants and taking the best result!
    val=mean_vector(k_best);
    
    if val<0.85
       k_best=1;
    else
    end
    
    if k_best==1
        system=0;
    elseif k_best==kmax
        system=0;
    else
        system=1; %so there is a system in the window and thus no AF!
    end
end