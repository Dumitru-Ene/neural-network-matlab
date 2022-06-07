function [E]=cost_f(Y,true_Y)

E=(Y-true_Y).^2;
E=sum(E,1);

end