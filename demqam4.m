function [ Id, Qd ] = demqam4( QdSr, IdSr , P)

for i=1:1:P
    if IdSr(i)>0
        Id(i)=1;
    else IdSr(i)<= 0
        Id(i)=-1;
    end
    
if QdSr(i)>0
        Qd(i)=-1;
    else QdSr(i)<= 0
        Qd(i)=1;
    end
    
    
end;

end
