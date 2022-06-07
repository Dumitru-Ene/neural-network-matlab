%load('GD_trained_net.mat')
load('SGD_trained_net.mat')
load('marks_data.mat')

n=n_test*4;
correct=0;
wrong=0;
wrongs=zeros(1,n_test*4);
for i=1:n
    x=X_test(:,i);
    y=predict(x,W1,B1,W2,B2,W3,B3);
    true_y=true_Y_test(:,i);
    
    [~,predicted]=max(y);
    [~,expected]=max(true_y);
    
    if(predicted==expected)
        correct=correct+1;
    else
        wrong=wrong+1;
        wrongs(wrong)=i;
        err=cost_f(y,true_y);
        disp(["expected:" num2str(expected);"computed:" num2str(predicted);"error:" num2str(err)]);
    end
    
    
 
end
wrongs=wrongs(1,1:wrong);
disp(["correct guesses:" num2str(correct);"wrong guesses:" num2str(wrong)]);
disp(["accuracy:" num2str(correct/n*100)])