clc;
clear all;

%% 1.导入蚜虫-巴克纳氏共生体的新陈代谢网络并进行数据处理

load('buc_net_s.txt');

pts_set = unique(buc_net_s);  % 获得网络节点集合

pts_number = length(pts_set); % 获得网络节点个数，为270个

% 重新设置节点的序号：1-270
for i=1:pts_number
    buc_net_s(buc_net_s==pts_set(i))=i;
end

%% 2.在真实网络中，计算13种三元组模体各自出现的个数

% 构造有向图的邻接矩阵
A = zeros(pts_number,pts_number);

for i=1:length(buc_net_s)
    A(buc_net_s(i,1),buc_net_s(i,2))=1;
end

% 寻找13种网络，函数实现
[num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11,num12,num13]=find_motif13(A);

ture_motif_num = [num1;num2;num3;num4;num5;num6;num7;num8;num9;num10;num11;num12;num13;];

%% 3.产生与真实网络具有相同规模的随机网络100个
%% 4. 对每一个随机网络，计算13种三元组模体各自出现的个数

% 存放100个随机网络13种motif数量的数组
[num1_set,num2_set,num3_set,num4_set,num5_set,num6_set,num7_set,num8_set,num9_set,num10_set,num11_set,num12_set,num13_set]=deal(zeros(100,1));

for i=1:100
    A_random = random_network(A,buc_net_s,100); % 通过random_network函数生成随机网络，可以指定重复次数
    [num1_set(i),num2_set(i),num3_set(i),num4_set(i),num5_set(i),num6_set(i),num7_set(i),num8_set(i),num9_set(i),num10_set(i),num11_set(i),num12_set(i),num13_set(i)]=find_motif13(A_random);
end

%% 5. 对100个随机网络，计算13种三元组模体各自出现个数的均值、标准差，计算大于等于小于等于真实集的个数

% 计算 13种三元组模体各自出现个数的均值
average_3motif = [sum(num1_set)/100;sum(num2_set)/100;sum(num3_set)/100;sum(num4_set)/100;sum(num5_set)/100;sum(num6_set)/100;
    sum(num7_set)/100;sum(num8_set)/100;sum(num9_set)/100;sum(num10_set)/100;sum(num11_set)/100;sum(num12_set)/100;sum(num13_set)/100;];

% 计算 13种三元组模体各自出现个数的标准差
std_3motif = [std(num1_set);std(num2_set);std(num3_set);std(num4_set);std(num5_set);std(num6_set);
    std(num7_set);std(num8_set);std(num9_set);std(num10_set);std(num11_set);std(num12_set);std(num13_set);];

% 计算 13种三元组模体各自出现大于等于真实集的个数
large_3motif = cmp_motif_num(ture_motif_num,num1_set,num2_set,num3_set,num4_set,num5_set,num6_set,num7_set,num8_set,num9_set,num10_set,num11_set,num12_set,num13_set,0);

% 计算 13种三元组模体各自出现小于等于真实集的个数
small_3motif = cmp_motif_num(ture_motif_num,num1_set,num2_set,num3_set,num4_set,num5_set,num6_set,num7_set,num8_set,num9_set,num10_set,num11_set,num12_set,num13_set,1);

%% 6.生成Motif数目统计表格

result_data = [ture_motif_num,average_3motif,std_3motif,large_3motif,small_3motif;];

xlswrite("motifResult.xls",result_data,'A2:E14');


%% 7.获取画图数据，利用Cytoscape画图
data_edge=[];

for i=1:length(A_random)
    for j=1:length(A_random)
        if A_random(i,j)==1
            data_edge=[data_edge;i,j;];
        end
    end
end

xlswrite("draw_data_edge_100.xls",data_edge,'A2:B443');
