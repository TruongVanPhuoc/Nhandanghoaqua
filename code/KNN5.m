clc
clear all
format long
test = xlsread('C:\Users\GIN PC\Documents\MATLAB\Datachuoi\chuoi\XuatHU\huk2.xlsx');
data = xlsread('C:\Users\GIN PC\Documents\MATLAB\Datachuoi\chuoi\XuatHU\Hu400.xlsx');
h=size(test);
h1=size(data);
for i=1:20
 for j=1:400
     dis(i,j) = abs(test(i,1)- data(j,1)) + abs(test(i,2)- data(j,2))+abs(test(i,3)- data(j,3))+ abs(test(i,4)- data(j,4))+abs(test(i,5)- data(j,5)) +abs(test(i,6)- data(j,6))+ abs(test(i,7)- data(j,7))      
 end
 L1(i)=dis(i,400)
 for k=1:400
    if dis(i,k)<L1(i) L1(i)=dis(i,k)
                      A1(i)=k  
    end
 end
 L2(i)=dis(i,400)
 for k=1:400
     if (dis(i,k)<L2(i) && dis(i,k)>L1(i)) L2(i)=dis(i,k)
                                           A2(i)=k
     end
 end
 L3(i)=dis(i,400)
 for k=1:400
     if (dis(i,k)<L3(i) && dis(i,k)>L2(i)) L3(i)=dis(i,k)
                                           A3(i)=k
     end
 end
 L4(i)=dis(i,400)
 for k=1:400
     if (dis(i,k)<L4(i) && dis(i,k)>L3(i)) L4(i)=dis(i,k)
                                           A4(i)=k
     end
 end
 L5(i)=dis(i,400)
 for k=1:400
     if (dis(i,k)<L5(i) && dis(i,k)>L4(i)) L5(i)=dis(i,k)
                                           A5(i)=k
     end
 end

 L(i,:)=[L1(i) L2(i) L3(i) L4(i) L5(i)] %la k diem gan nhat
 A(i,:)=[A1(i) A2(i) A3(i) A4(i) A5(i)] %vi tri nhan
 
 C1=0;C2=0;C3=0;C4=0;C5=0

     for j=1:5
         if (A(i,j)>=1) && (A(i,j)<=80) C1=C1+1
         else if A(i,j)<=160 C2=C2+1
             else if A(i,j)<=240 C3=C3+1
                 else if A(i,j)<=320 C4=C4+1
                     else if A(i,j)<=400 C5=C5+1
                         end
                     end
                 end
             end
         end
     end 
 
 Max1 = 0;
 C(i,:)=[C1 C2 C3 C4 C5]
 for j=1:5
     if C(i,j)>Max1 Max1=C(i,j)
                   d=j;
     end
 end
 kiemtra=0;
 for j=1:5
     if (C(i,j)==Max1) && (j ~= d) Max2=C(i,j);
                                   n=j; 
                                   kiemtra=1
     end
 end
 % chi roi vao 3 TH: TH1: 5 qua deu xuat hien 1, TH2:2 qua xuat hien 2 lan
 %TH3:1 qua xuat hien nhieu hon cac qua con lai
if Max1==1 VT= randi(1,5)
           C6=VT
else if (kiemtra==1) VT= randi(1,2)
                if VT==1 C6=d
                else C6=n
                end
    else C6=d
    end
end

KQ(i,:)= [C1 C2 C3 C4 C5 C6] %C6 la ket qua
end
