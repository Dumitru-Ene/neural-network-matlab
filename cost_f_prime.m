function [dEdY]=cost_f_prime(Y,true_Y)

dEdY=2*(Y-true_Y);

end