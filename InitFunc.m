function [] = InitFunc(Fx,FxA,sv,rv,dv)
%INITFUNC Summary of this function goes here
%   Detailed explanation goes here

F = str2func(Fx);
Fa = str2func(FxA);
V = odnajdywanieWiezcholkow(str2num(sv),str2num(rv),str2num(dv));

if get(str2num(dv))==2
[V0,y0,dV,dy]=sumpleksFunkcjaDwuwymiarowa(F,Fa,V,100,400,0.002,1);
else
    
end
end

