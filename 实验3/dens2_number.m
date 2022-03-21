%% 4.计算模块密度函数_社团之间
function ret_num = dens2_number(A,C)
ret_num = 0;
A_size = size(A,1);   % 网络节点个数
C_size = length(C);   % 社团节点个数
C_all = (1:A_size);   % 社团节点全集
C_rest = C_all(ismember(C_all,C)==0); % 其余社团节点

for i = C(1:C_size)
    for j = C_rest(1:length(C_rest))
        if i~=j && A(i,j)==1
        ret_num = ret_num+1;
        end
    end
end

ret_num = ret_num/C_size;
end