function [dEdx,dEdw,dEdb] = get_grad(dEdz,x,y,W)
%y=Wx+B
dEdb=dEdz.*activation_prime(y);
dEdw=dEdb*x'*(1/size(x,1));
%dEdb=dEdy.*activation_prime(y)
dEdx=W'*dEdb;
dEdb=dEdb*(1/size(x,1));
end

