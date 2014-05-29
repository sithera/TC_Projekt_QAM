function [ Id, Qd ] = demqam16( QdSr, IdSr , P)

for i=1:1:P
    if IdSr(i)>=2
        Id(i)=3;
    elseif IdSr(i)<2 && IdSr(i)>=0
        Id(i)=1;
    elseif IdSr(i)>= -2 && IdSr(i)<0
        Id(i)=-1;
    else IdSr(i)< -2
        Id(i)=-3;
    end
    
    if QdSr(i)>=2
        Qd(i)=-3;
    elseif QdSr(i)<2 && QdSr(i)>=0
        Qd(i)=-1;
    elseif QdSr(i)>= -2 && QdSr(i)<0
        Qd(i)=1;
    else QdSr(i)< -2
        Qd(i)=3;
    end
    
end;

end

