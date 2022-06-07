function [adjusted_W,adjusted_B] = grad_step(W,b,dEdw,dEdb,alpha)

    adjusted_W=W-alpha*dEdw;
    adjusted_B=b-alpha*sum(dEdb,2);
end

