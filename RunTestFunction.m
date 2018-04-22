function [] = RunTestFunction()

F = @(x,y) x.*exp(-x.^2-y.^2);
V = [1 2;1 -3;-2 1];

min1=10;%hard
max1=500;%hard
epsilon=0.00001;%w kodzie
show = 0

MetodaSumpleks(F,V,min1,max1,epsilon,show)

end

