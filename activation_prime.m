function z = activation_prime(y)
s = activation(y);
z = s - s.^2 ;
end