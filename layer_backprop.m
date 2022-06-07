function [dEdx,adjusted_W,adjusted_B] = layer_backprop(dEdz,x,y,learn_rate,W,B)
%y=Wx+B
dEdz_=dEdz.*activation_prime(y);

dEdw=dEdz_*x';
%dEdb=dEdy.*activation_prime(y)

dEdx=W'*dEdz_;

%gradient step
adjusted_W=W-learn_rate*dEdw;
adjusted_B=B-learn_rate*dEdz_;
end

