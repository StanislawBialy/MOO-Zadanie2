function [] = InitFunc2(Fx,X,show,rowNum,columnNum)
%INITFUNC2 Summary of this function goes here
%   Detailed explanation goes here

% @(x,y,z)exp(x^.2+y.^2)+log(4+y.^2+2*z.^2)
% -6,0,-2,-4,2,5,2,4,1,3,-1,2

UserFunc = str2func(Fx)
F =UserFunc;
B = str2num(X)
C = reshape(B,str2num(rowNum),str2num(columnNum))

min1=10;%hard
max1=500;%hard
epsilon=0.00001;%w kodzie

% ner(F,C,show,min1,max1,epsilon);
ner2(F,C)
end

