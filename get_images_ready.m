clear;clc;close all;

n1=100;
n2=100;
n3=100;
n4=100;
n5=100;
n_test=50;
image_l=30;
image_w=24;


X=zeros(image_l*image_w,n1+n2+n3+n4);
X_test=zeros(image_l*image_w,n_test*4);
%ones train
for i=1:n1
    image=imread("dataset/1/"+num2str(i)+".jpg");
    %imshow(image)
    image=reshape(image,[image_w*image_l 1]);
    X(:,i)=image;
end

%onestest
for i=1:n_test
    image=imread("dataset/1/"+num2str(i+1000)+".jpg");
    %imshow(image)
    image=reshape(image,[image_w*image_l 1]);
    X_test(:,i)=image;
end
disp("ok")
%twos train
for i=1:n2
    image=imread("dataset/2/"+num2str(i)+".jpg");
    %imshow(image)
    image=reshape(image,[image_w*image_l 1]);
    X(:,i+n1)=image;
end
%twos test
for i=1:n_test
    image=imread("dataset/2/"+num2str(i+1000)+".jpg");   
    %imshow(image)
    image=reshape(image,[image_w*image_l 1]);
    X_test(:,i+n_test)=image;
end
disp("ok")
%threes train
for i=1:n3
    image=imread("dataset/3/"+num2str(i)+".jpg");
    %imshow(image)
    image=reshape(image,[image_w*image_l 1]);
    X(:,i+n1+n2)=image;
end
%threes test
for i=1:n_test
    image=imread("dataset/3/"+num2str(i+1000)+".jpg");
    %imshow(image)
    image=reshape(image,[image_w*image_l 1]);
    X_test(:,i+n_test*2)=image;
end

disp("ok")
%fours train
for i=1:n4
    image=imread("dataset/4/"+num2str(i)+".jpg");
    %imshow(image)
    image=reshape(image,[image_w*image_l 1]);
    X(:,i+n1+n2+n3)=image;
end
%fours test
for i=1:n_test
    image=imread("dataset/4/"+num2str(i+1000)+".jpg");
    %imshow(image)
    image=reshape(image,[image_w*image_l 1]);
    X_test(:,i+n_test*3)=image;
end
disp("ok")
true_Y=zeros(4,n1+n2+n3+n4);
true_Y(1,1:n1)=1;
true_Y(2,n1+1:n1+n2)=1;
true_Y(3,n1+n2+1:n1+n2+n3)=1;
true_Y(4,n1+n2+n3+1:end)=1;

true_Y_test=zeros(4, n_test*4);
true_Y_test(1, 1:n_test)=1;
true_Y_test(2, n_test+1:n_test*2)=1;
true_Y_test(3, n_test*2+1:n_test*3)=1;
true_Y_test(4, n_test*3+1:end)=1;

save('marks_data.mat','X','true_Y','X_test','true_Y_test','n1','n2','n3','n4','n_test');
close all;

