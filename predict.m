function [y] = predict(x,W1,B1,W2,B2,W3,B3)
y=activation(B3+W3*activation(B2+W2*activation(W1*x+B1)));
end

