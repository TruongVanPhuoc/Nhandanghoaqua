clc
clear all
for i =1: 100
path = ['C:\thom\input\' num2str(i) '.jpg']
A=imread(path);  
b=rgb2gray(A);
w = graythresh(b);
c= ~imbinarize(b,w);
c=imresize(c,[512 512])
 for k=1:512
      for j=1:512
          if c(k,j) >= 1
              c(k,j)=0;
             
          else c(k,j)=256;
          end
      end
 end
out= ['C:\thom\output\' num2str(i) '.jpg' ];
imwrite( c ,out );
end