%% 2.计算两个节点邻居节点的并集
function ret_num = or_number(A,i,j)
ret_num = 0;

for k=1:size(A,1)
    if A(i,k)==1 || A(j,k)==1
        ret_num = ret_num+1;
    end
end
end