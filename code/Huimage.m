clc;
clear all;
i=imread('C:\Users\GIN PC\Documents\MATLAB\Datachuoi\chuoi\xuat2\48.jpg')
image=i/255;
image=im2double(image);


[height, width] = size(image);

xgrid = repmat((-floor(height/2):1:ceil(height/2)-1)',1,width);
ygrid = repmat(-floor(width/2):1:ceil(width/2)-1,height,1);

[x_bar, y_bar] = centerOfMass(image,xgrid,ygrid);

xnorm = x_bar - xgrid;
ynorm = y_bar - ygrid;

mu_11 = central_moments( image ,xnorm,ynorm,1,1);
mu_20 = central_moments( image ,xnorm,ynorm,2,0);
mu_02 = central_moments( image ,xnorm,ynorm,0,2);
mu_21 = central_moments( image ,xnorm,ynorm,2,1);
mu_12 = central_moments( image ,xnorm,ynorm,1,2);
mu_03 = central_moments( image ,xnorm,ynorm,0,3);
mu_30 = central_moments( image ,xnorm,ynorm,3,0);

S1   = mu_20 + mu_02;
S2   = (mu_20 - mu_02)^2 + 4*(mu_11)^2;
S3 = (mu_30 - 3*mu_12)^2 + (mu_03 - 3*mu_21)^2;
S4  = (mu_30 + mu_12)^2 + (mu_03 + mu_21)^2;
S5  = (mu_30 - 3*mu_12)*(mu_30 + mu_12)*((mu_30 + mu_12)^2 - 3*(mu_21 + mu_03)^2) + (3*mu_21 - mu_03)*(mu_21 + mu_03)*(3*(mu_30 + mu_12)^2 - (mu_03 + mu_21)^2);
S6   = (mu_20 - mu_02)*((mu_30 + mu_12)^2 - (mu_21 + mu_03)^2) + 4*mu_11*(mu_30 + mu_12)*(mu_21 + mu_03);
S7 = (3*mu_21 - mu_03)*(mu_30 + mu_12)*((mu_30 + mu_12)^2 - 3*(mu_21 + mu_03)^2) + (mu_30 - 3*mu_12)*(mu_21 + mu_03)*(3*(mu_30 + mu_12)^2 - (mu_03 + mu_21)^2);


hu_moments_vector = [S1, S2, S3,S4,S5,S6,S7];
hu_moments_vector_norm= -sign(hu_moments_vector).*(log10(abs(hu_moments_vector)));
hu_moments_vector
hu_moments_vector_norm

