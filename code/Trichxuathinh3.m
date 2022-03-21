clc
clear all
scrfile = dir('C:\Users\GIN PC\Documents\MATLAB\Datachuoi\Chuoi\Datachuoi\*.jpg');
for r =1: length (scrfile)
    filename = strcat( 'C:\Users\GIN PC\Documents\MATLAB\Datachuoi\Chuoi\Datachuoi\',scrfile(r).name );

A=imread(filename);  
b=rgb2gray(A);
w = graythresh(b);
c= imbinarize(b,w);  
h=size(c)
 for i=1:h(1)
      for j=1:h(2)
          if c(i,j) >= 1
              c(i,j)=0;
             
          else c(i,j)=256;
          end
      end
 end
out= strcat('C:\Users\GIN PC\Documents\MATLAB\Datachuoi\Chuoi\Xuat2\',scrfile(r).name );
imwrite( c ,out );
imshow(c);
end 