function [y,z] = layer_forward(x,W,B)
y=W*x+B;
z=activation(y);
end

