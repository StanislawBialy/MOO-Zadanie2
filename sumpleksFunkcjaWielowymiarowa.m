function[V0,y0,dV,dy,V]=MetodaSumpleks(F,V,min1,max1,epsilon,show)
%Wejscie -   F   -   funkcja ’F’
%        -   V   -   maciez 3 ? p, z poczatkowym simpleksem
%        - mini & maxi - minimum i maksymum iteracji
%        - epsilon 
%        - show == 1 - pokazuje ilosc iteracji
% dodac srodek z punktem i dlugość ramion
%dodac wielowymiarowosc 
%Wyjscie -    V0  -   wieszcholek minimum
%        -    y0  -   wartosc w F(V0)
%        -    dV  -   rozmiar sumpleksu wyjsciowego
%        -    dy  -   blad
%        -    ?   -   maciez z iteracjami
%        -    Q   -   maciez z iteracjami F(P)
%wywołanie przykład: 
%V = odnajdywanieWiezcholkow(1,5,3)
%[V0,y0,dV,dy,V]=MetodaSumpleks(F,V,10,400,0.0000001,1)

% F=@(x,y,z)((x + 1).^2 + y.^2 + (z - 1).^2 - sin(x + 1).^2 + y.^2 + (z - 1).^2).^2;
F = @(u) F(u(1),u(2),u(3));
if nargin==5,
    show=0;
end
[mm n]=size(V);

% kolejnosc wieszcholkow
for j=1:n+1
    Z=V(j,1:n);
    Y(j)=feval(F,Z);
end
 
[mm best]=min(Y);
[mm bad]=max(Y);
li=bad;
good=best;
for j=1:n+1
    if (j~=best&j~=bad&Y(j)<=Y(li))
        li=j;
    end
    if (j~=bad&j~=best&Y(j)>=Y(good))
        good=j;
    end
end
cnt=0;
% poczatek algorytmu
xxx = V(:,1);
yyy = V(:,2);
xxx(end+1)=xxx(1);
yyy(end+1)=yyy(1);
simpleksSize=0;
for g=1:n+1
    s=norm(V(g)-V(best));
    if(s>=simpleksSize)
       simpleksSize=s;
    end
end
while (simpleksSize > epsilon & cnt<max1) |  cnt<min1
    S=zeros(1,n);
    for j=1:n+1
        S=S+V(j,1:n);
    end
    M=(S-V(bad,1:n))/n;
    R=2*M-V(bad,1:n); %R=xr odbicie najgorszego
    yR=feval(F,R);
    if(yR<Y(good))
        if (Y(li)<yR)
            V(bad,1:n)=R; 
            Y(bad)=yR;
        else
            E=2*R-M;            %E=xe  rozciagniecie
            yE=feval(F,E);
            if(yE<Y(li))
                V (bad,1:n)=E;
                Y(bad)=yE;
            else
                V(bad,1:n)=R;
                Y(bad)=yR;
            end
        end
    else
        if(yR<Y(bad))
            V(bad,1:n)=R;   %pamieniamy miejscami
            Y(bad)=yR;
        end
        C=(V(bad,1:n)+M)/2;  %sciskanie
        yC=feval(F,C);
        C2=(M+R)/2;
        yC2=feval(F,C2);
        if(yC2<yC)
            C=C2;
            yC=yC2;
        end
        if(yC<Y(bad))
            V(bad,1:n)=C;
            Y(bad)=yC;
        else
            for j=1:n+1
                if (j~=best)
                    V(j,1:n)=(V(j,1:n)+V(best,1:n))/2;
                    Z=V(j,1:n);
                    Y(j)=feval(F,Z);
                end
            end
        end
    end
    [mm best]=min(Y);
    [mm bad]=max(Y);
    li=bad;
    good=best;
    for j=1:n+1
        if (j~=best&j~=bad&Y(j)<=Y(li))
            li=j;
        end
        if (j~=bad&j~=best&Y(j)>=Y(good))
            good=j;
        end
    end
    cnt=cnt+1;
    P(cnt,:)=V(best,:);
    Q(cnt)=Y(best);
    
    xxx = V(end-2:end, 1);
    yyy = V(end-2:end, 2);
    xxx(end+1)=xxx(1);
    yyy(end+1)=yyy(1);
   for g=1:n+1
        s=norm(V(g)-V(best));
        if(s>=simpleksSize)
            simpleksSize=s;
        end
    end
end
%koniec algorytmu
%wyznaczenie rozmiaru sympleksu
snorm=0;
for j=1:n+1
    s=norm(V(j)-V(best));
    if(s>=snorm)
        snorm=s;
    end
end
Q=Q';
V0=V(best,1:n);
y0=Y(best);
%V = Y();
dV=snorm;
dy=abs(Y(bad)-Y(best));
if show==1
    disp(P);
    disp(Q);
end