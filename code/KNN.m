clc
clear all
format long
test = xlsread('C:\Users\GIN PC\Documents\MATLAB\Datachuoi\chuoi\XuatHU\huk.xlsx');
data = xlsread('C:\Users\GIN PC\Documents\MATLAB\Datachuoi\chuoi\XuatHU\hufinal.xlsx');
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
 
end 


