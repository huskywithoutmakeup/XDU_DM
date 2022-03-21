function  A_random =random_network(A,edge_set,repeat_num)
% 生成随机网络
edge_number = length(edge_set); % 边的条数

A_random = A;

for i=1:repeat_num % 可重复指定次数
    rand_edge1 = floor(randi(edge_number));  % 随机生成两条边的序号
    rand_edge2 = floor(randi(edge_number));
    X1 = edge_set(rand_edge1,1);             % 两条边对应的起点和终点
    X2 = edge_set(rand_edge2,1);
    Y1 = edge_set(rand_edge1,2);
    Y2 = edge_set(rand_edge2,2);

    if A_random(X1,Y2)==0 && A_random(X2,Y1)==0 && X1~=Y2 && X2~=Y1 % 若起点和终点不相同且新生成的边不存在
        A_random(X1,Y2)=1;
        A_random(X2,Y1)=1;
        A_random(X1,Y1)=0;
        A_random(X2,Y2)=0;
        edge_set(rand_edge1,:)=[X1,Y2;]; % 将新边放在边集中
        edge_set(rand_edge2,:)=[X2,Y1;];
    end
end
end