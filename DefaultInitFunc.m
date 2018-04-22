function [] = DefaultInitFunc(Fx,V1,N)
%DEFAULTINITFUNC Summary of this function goes here
%   Detailed explanation goes here

UserFunc = str2func(Fx)
F =UserFunc;

if N ==0
ner2(F,V1);
else
min1=10;%hard
max1=500;%hard
epsilon=0.00001;%w kodzie
show =1;
MetodaSumpleks(F,V1,min1,max1,epsilon,show)
end

