function[V]=odnajdywanieWiezcholkow(x, y, odleglosc)
%tab[3][2];
%for v = 1.0:+1:3.0
xV = [x;x-odleglosc;x+odleglosc];
yV = [y+odleglosc;y-odleglosc;y-odleglosc];
V =[xV,yV]
%

end