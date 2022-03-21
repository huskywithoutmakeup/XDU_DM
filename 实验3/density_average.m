%% 5.计算平均社团密度
function ret_num = density_average(S,C)
density = 0;

for i=C(1:length(C)) 
    for j=C(1:length(C))
        if i~=j
            density = density+S(i,j);
        end
    end
end

density = density /(length(C)^2-length(C)); % 求取平均社团密度

ret_num = density;

if length(C)==1  % 若社团只有一个成员，则返回1
    ret_num = 1;
end
end