% 3.计算模块密度函数_社团内部
function ret_num = dens1_number(A,C)
ret_num = 0;
C_size = length(C);   % 社团节点个数

for i = C(1:C_size)
    for j = C(1:C_size)
        if i~=j && A(i,j)==1
        ret_num = ret_num+1;
        end
    end
end

ret_num = ret_num/C_size;
end