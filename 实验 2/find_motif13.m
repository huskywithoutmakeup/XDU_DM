function  [num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11,num12,num13]=find_motif13(A)
% 寻找13种三元组motif
pts_number = length(A);   % 节点个数

[num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11,num12,num13]=deal(0);

for i=1:pts_number % 点 1
    for j=1:pts_number % 点 2
        for k=1:pts_number % 点 3

            if i~=k && i~=j && j~=k % 三点均不相等

                if A(j,i)==1 && A(j,k)==1 && A(i,j)==0 && A(k,i)==0 && A(i,k)==0 && A(k,j)==0
                    num1=num1+1;
                elseif A(j,i)==1 && A(j,k)==0 && A(i,j)==0 && A(k,i)==0 && A(i,k)==0 && A(k,j)==1                        
                    num2=num2+1;
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==0 && A(k,i)==0 && A(i,k)==0 && A(k,j)==1                        
                    num3=num3+1;
                elseif A(j,i)==1 && A(j,k)==0 && A(i,j)==0 && A(k,i)==1 && A(i,k)==0 && A(k,j)==0                        
                    num4=num4+1;
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==0 && A(k,i)==1 && A(i,k)==0 && A(k,j)==0                         
                    num5=num5+1;
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==0 && A(k,i)==1 && A(i,k)==0 && A(k,j)==1                        
                    num6=num6+1;
                elseif A(j,i)==0 && A(j,k)==1 && A(i,j)==1 && A(k,i)==0 && A(i,k)==0 && A(k,j)==1                        
                    num7=num7+1;
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==1 && A(k,i)==0 && A(i,k)==0 && A(k,j)==1                        
                    num8=num8+1;
                elseif A(j,i)==0 && A(j,k)==1 && A(i,j)==1 && A(k,i)==1 && A(i,k)==0 && A(k,j)==0                        
                    num9=num9+1;
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==1 && A(k,i)==1 && A(i,k)==0 && A(k,j)==0                        
                    num10=num10+1;
                elseif A(j,i)==1 && A(j,k)==0 && A(i,j)==1 && A(k,i)==1 && A(i,k)==0 && A(k,j)==1                       
                    num11=num11+1;
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==1 && A(k,i)==1 && A(i,k)==0 && A(k,j)==1                    
                    num12=num12+1;
                elseif A(j,i)==1 && A(j,k)==1 && A(i,j)==1 && A(k,i)==1 && A(i,k)==1 && A(k,j)==1                        
                    num13=num13+1;
                end
            end
        end
    end
end
num1 = num1/2;
num4 = num4/2;
num5 = num5/1;
num6 = num6/2;
num8 = num8/2;
num9 = num9/3;
num11 =num11/2;
num13 = num13/6;
end