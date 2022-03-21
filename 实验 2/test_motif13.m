function  [num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11,num12,num13]=test_motif13(A)
% 寻找13种三元组motif
pts_number = length(A);   % 节点个数

[set1,set2,set3,set4,set5,set6,set7,set8,set9,set10,set11,set12,set13]=deal([]);

for i=1:pts_number % 点 1
    for j=1:pts_number % 点 2
        for k=1:pts_number % 点 3

            if i~=k && i~=j && j~=k % 三点均不相等

                if A(j,i)==1 && A(j,k)==1 && A(i,j)==0 && A(k,i)==0 && A(i,k)==0 && A(k,j)==0
                    set1=[set1;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==0 && A(i,j)==0 && A(k,i)==0 && A(i,k)==0 && A(k,j)==1                        
                    set2=[set2;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==0 && A(k,i)==0 && A(i,k)==0 && A(k,j)==1                        
                    set3=[set3;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==0 && A(i,j)==0 && A(k,i)==1 && A(i,k)==0 && A(k,j)==0                        
                    set4=[set4;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==0 && A(k,i)==1 && A(i,k)==0 && A(k,j)==0                         
                    set5=[set5;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==0 && A(k,i)==1 && A(i,k)==0 && A(k,j)==1                        
                    set6=[set6;i,j,k;];
                elseif A(j,i)==0 && A(j,k)==1 && A(i,j)==1 && A(k,i)==0 && A(i,k)==0 && A(k,j)==1                        
                    set7=[set7;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==1 && A(k,i)==0 && A(i,k)==0 && A(k,j)==1                        
                    set8=[set8;i,j,k;];
                elseif A(j,i)==0 && A(j,k)==1 && A(i,j)==1 && A(k,i)==1 && A(i,k)==0 && A(k,j)==0                        
                    set9=[set9;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==1 && A(k,i)==1 && A(i,k)==0 && A(k,j)==0                        
                    set10=[set10;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==0 && A(i,j)==1 && A(k,i)==1 && A(i,k)==0 && A(k,j)==1                       
                    set11=[set11;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==1 && A(k,i)==1 && A(i,k)==0 && A(k,j)==1                    
                    set12=[set12;i,j,k;];
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==1 && A(k,i)==1 && A(i,k)==1 && A(k,j)==1                        
                    set13=[set13;i,j,k;];
                end
            end
        end
    end
end

num1 = pro_deal(set1);
num2 = pro_deal(set2);
num3 = pro_deal(set3);
num4 = pro_deal(set4);
num5 = pro_deal(set5);
num6 = pro_deal(set6);
num7 = pro_deal(set7);
num8 = pro_deal(set8);
num9 = pro_deal(set9);
num10 = pro_deal(set10);
num11 = pro_deal(set11);
num12 = pro_deal(set12);
num13 = pro_deal(set13);
end

function num = pro_deal(set)
set = sort(set,2);
set = unique(set,'rows');
num = size(set,1);
end