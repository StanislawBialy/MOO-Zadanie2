function [] = InitFunc(Fx,X,show,rowNum,columnNum)

UserFunc = str2func(Fx)
F =UserFunc;

%@(x,y) x.*exp(-x.^2-y.^2);

B = str2num(X)
C = reshape(B,str2num(rowNum),str2num(columnNum))

min1=10;%hard
max1=500;%hard
epsilon=0.00001;%w kodzie

MetodaSumpleks(F,C,min1,max1,epsilon,show)

end

