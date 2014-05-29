function [ Id, Qd ] = demqam64( QdSr, IdSr , P)

for i=1:1:P
    if IdSr(i)>=6
        Id(i)=7;
    elseif IdSr(i)<6 && IdSr(i)>=4
        Id(i)=5;
    elseif IdSr(i)<4 && IdSr(i)>=2
        Id(i)=3;
    elseif IdSr(i)<2 && IdSr(i)>=0
        Id(i)=1;
    elseif IdSr(i)<0 && IdSr(i)>=-2
        Id(i)=-1;
    elseif IdSr(i)<-2 && IdSr(i)>=-4
        Id(i)=-3;
    elseif IdSr(i)< -4 && IdSr(i)>=-6
        Id(i)=-5;
    else IdSr(i)< -6
        Id(i)=-7;
    end
    
    if QdSr(i)>=6
        Qd(i)=-7;
    elseif QdSr(i)<6 && QdSr(i)>=4
        Qd(i)=-5;
    elseif QdSr(i)<4 && QdSr(i)>=2
        Qd(i)=-3;
    elseif QdSr(i)<2 && QdSr(i)>=0
        Qd(i)=-1;
    elseif QdSr(i)<0 && QdSr(i)>=-2
        Qd(i)=1;
    elseif QdSr(i)<-2 && QdSr(i)>=-4
        Qd(i)=3;
    elseif QdSr(i)< -4 && QdSr(i)>=-6
        Qd(i)=5;
    else QdSr(i)< -6
        Qd(i)=7;
    end
    
end;

end
