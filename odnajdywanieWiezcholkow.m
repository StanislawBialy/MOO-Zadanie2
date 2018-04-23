function[V]=odnajdywanieWiezcholkow(x, odleglosc, nWymiar)
N=nWymiar;
A=zeros(N+1:N);
for  i=1:N+1;
    for j=1:N;
        if(i~=j)
            A(i,j)=x;
        else
            A(i,j)=x+odleglosc;
    end
end

V =A;

end