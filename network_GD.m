clear;
n_input=720; %30*24
n_layer1=120;
n_layer2=20;
n_output=4;

%init weights and biases randomly

W1=rand(n_layer1,n_input)-0.5;
B1=rand(n_layer1,1)-0.5;
W2=rand(n_layer2,n_layer1)-0.5;
B2=rand(n_layer2,1)-0.5;
W3=rand(n_output,n_layer2)-0.5;
B3=rand(n_output,1)-0.5;

%get the dataset
load('marks_data.mat');


nr_epochs=10000;
error = zeros(1,nr_epochs/1000);
alpha=0.1; %learning rate


n=n1+n2+n3+n4; %number of training pictures
shuffle=randperm(size(X,2));
X=X(:,shuffle); 
true_Y=true_Y(:,shuffle);
for i=1:nr_epochs
    
    %forward_prop
    [y1,z1] = layer_forward(X,W1,B1);
    [y2,z2] = layer_forward(z1,W2,B2);
    [y3,z3] = layer_forward(z2,W3,B3);
       
    %computing error
    if(mod(i,1000) == 0)
        error(i/1000) = error(i/1000) + mean(cost_f(true_Y, z3));
            
    end
       
    %backprop
    dEdz3=cost_f_prime(z3,true_Y);
       
    [dEdz2,dEdw3,dEdb3] = get_grad(dEdz3,z2,y3,W3);
    [dEdz1,dEdw2,dEdb2] = get_grad(dEdz2,z1,y2,W2);
    [~,dEdw1,dEdb1] = get_grad(dEdz1,X,y1,W1);

    [W1,B1]=grad_step(W1,B1,dEdw1,dEdb1,alpha);
    [W2,B2]=grad_step(W2,B2,dEdw2,dEdb2,alpha);
    [W3,B3]=grad_step(W3,B3,dEdw3,dEdb3,alpha);
    
    if(mod(i,1000) ==0)
       error(i/1000) = error(i/1000)/n; 
       disp(i);
       disp(['eroarea este:' num2str(error(i/1000))])
    end
end
plot(error);
title('Error every 1000 epochs');
save('GD_trained_net.mat','W1','B1','W2','B2','W3','B3','n_output','n_input')



