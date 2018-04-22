function F = ner2( Fx,W )
% @(x,y,z) exp(x^.2+y.^2)+log(4+y.^2+2*z.^2)
F = Fx
fun = @(u) F(u(1),u(2),u(3))
% V = [-6 0 -2; 
%     -4 2 5; 
%     2 4 1;
%     3 -1 2];
V =W;
F=fun;
min1=10;
max1=5000;
al=1;
gam=2;
bet=0.5;
epsilon=0.00001;
[mm n]=size(V)
% ?????????????????? ??????
for j=1:n+1
    Z=V(j,1:n)
    Y(j)=feval(F,Z)
end
 
[mm lo]=min(Y)
[mm hi]=max(Y)
li=hi
ho=lo
for j=1:n+1
    if (j~=lo&j~=hi&Y(j)<=Y(li))
        li=j
    end
    if (j~=hi&j~=lo&Y(j)>=Y(ho))
        ho=j
    end
end
cnt=0
S=zeros(1,n)
    for j=1:n+1
        S=S+V(j,1:n)
    end
    xc=(S-V(hi,1:n))/n 
  Fxc=feval(F,xc)
  for w=1:n+1
      Razn(w)=(Y(w)-Fxc)^2
  end
  Razn=sum(Razn)
        
% ?????? ????????? ???????-????
while ((1/(n+1))*Razn^(1/2)>epsilon & cnt<max1) |  cnt<min1
    S=zeros(1,n)
    for j=1:n+1
        S=S+V(j,1:n)
    end
    xc=(S-V(hi,1:n))/n       %M=xc    ??????????
    xR=(1+al)*xc-V(hi,1:n)           %R=xr ?????????
    yR=feval(F,xR)
    if(yR<Y(ho))               
        if (Y(li)<yR)
            V(hi,1:n)=xR
            Y(hi)=yR
        else
            xE=(1-gam)*xc+gam*xR          %E=xe  ??????????
            yE=feval(F,xE)
            if(yE<Y(li))
                V (hi,1:n)=xE
                Y(hi)=yE
            else
                V(hi,1:n)=xR
                Y(hi)=yR
            end
        end
    else
        if(yR<Y(hi))        %?????? ???????
            V(hi,1:n)=xR
            Y(hi)=yR
        end
        C=bet*V(hi,1:n)+(1-bet)*xc        %??????
        yC=feval(F,C)
        C2=(xc+xR)/2
        yC2=feval(F,C2)
        if(yC2<yC)
            C=C2
            yC=yC2
        end
        if(yC<Y(hi))
            V(hi,1:n)=C
            Y(hi)=yC
        else
            for j=1:n+1
                if (j~=lo)
                    V(j,1:n)=(V(j,1:n)+V(lo,1:n))/2
                    Z=V(j,1:n)
                    Y(j)=feval(F,Z)
                end
            end
        end
    end
    [mm lo]=min(Y)
    [mm hi]=max(Y)
    li=hi
    ho=lo
    for j=1:n+1
        if (j~=lo&j~=hi&Y(j)<=Y(li))
            li=j
        end
        if (j~=hi&j~=lo&Y(j)>=Y(ho))
            ho=j
        end
    end
    Y
   Fxc=feval(F,xc)
  for w=1:n+1
      Razn(w)=(Y(w)-Fxc)^2
  end
  Razn=sum(Razn)
    cnt=cnt+1
    P(cnt,:)=V(lo,:)
    Q(cnt)=Y(lo)
    
  
end
%????? ????????? ???????-????
%??????????? ??????? ?????????
P
Q=Q'
V0=V(lo,1:n);
V0=vpa(V0,6)
y0=Y(lo);
y0=vpa(y0,6)
kolit=size(P)
end