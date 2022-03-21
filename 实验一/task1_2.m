clc;
clear all;

load('ratings.dat');

rate_Number = length(ratings);     % 评价条数
users_Number = max(ratings(:,1));  % 用户个数
movies_Number = max(ratings(:,2)); % 电影个数

%% 4.算法预测准确性预测

% 将二部图中的边随机分为两部分，其中90%归为训练集，10%归为测试集。重新进行1，2，3运算

%% 获得训练集和测试集

A = zeros(users_Number,movies_Number);   % 二部图的邻接矩阵

k_User = zeros(6040,1); % 用户的度

k_Moive = zeros(3952,1);% 电影的度

count_Edge = 0;                 % 边的条数

edges = zeros(rate_Number,2);   % 边的两点信息集合

for i=1:rate_Number             %计算边的条数
    if(ratings(i,3)>3)
        count_Edge = count_Edge+1;
        edges(count_Edge,1:2) = ratings(i,1:2);
    end
end

random_Edge = randperm(count_Edge);     % 将边的序号随机排列

train_Set =   edges(random_Edge(1:round(0.9*count_Edge)),:);    % 获得训练集
train_Number = length(train_Set);
A_train = zeros(users_Number,movies_Number);   % 训练图的邻接矩阵

for i=1:train_Number                   % 构造训练图邻接矩阵，计算用户度，电影度
    A_train(train_Set(i,1),train_Set(i,2)) = 1;
    k_User(train_Set(i,1),1) = k_User(train_Set(i,1),1)+1;
    k_Moive(train_Set(i,2),1) = k_Moive(train_Set(i,2),1)+1;
end

test_Set  =  edges(random_Edge(round(0.9*count_Edge)+1:count_Edge),:);  %获得测试集
test_Number  =  length(test_Set);              
A_test = zeros(users_Number,movies_Number);   % 测试图的邻接矩阵

for i=1:test_Number
    A_test(test_Set(i,1),test_Set(i,2)) = 1;
end


%% 进行训练

% 2. 资源配额矩阵
W_train = zeros(movies_Number,movies_Number); % 利用公式计算
for i=1:movies_Number
    for j=1:movies_Number
        W_sum = 0;
        for k=1:users_Number
            if k_User(k,1) ~= 0
            W_sum = W_sum + A_train(k,i)*A_train(k,j)/k_User(k,1);
            end
        end
        W_train(i,j)=W_sum/k_Moive(j,1);
        if isnan(W_train(i,j))
            W_train(i,j) = 0;
        end
    end
end

% 3. 对应项评分矩阵 
A_train_grade = A_train * W_train;   

A_train_grade_sort = zeros(users_Number,movies_Number);  % 排序后的对应项评分矩阵

A_train_grade_rank = zeros(users_Number,movies_Number);  % 排序后的对应项排名矩阵

% 4.算法预测准确性预测

% 即求R(i,j)
for i=1:users_Number
    [A_train_grade_sort(i,:),I] = sort(A_train_grade(i,:),'descend');
    for j=1:movies_Number
        A_train_grade_rank(i,I(j))=j;
    end
end

% 求L(i)
L = zeros(users_Number,1);
for i=1:users_Number
    %for j=1:movies_Number
        %if A_train(i,j)==0
            %L(i)=L(i)+1;
        %end
    %end
    L(i) = movies_Number - k_User(i);
end 

% 求 r(i,j) = R(i,j)/L(i)
r = zeros(users_Number,movies_Number);

for i=1:users_Number
    for j=1:movies_Number
        if A_test(i,j)==1
            r(i,j) = A_train_grade_rank(i,j)/L(i);
        end  
    end
end

% 对所有用户的rij求平均值
r_average = mean(r(:)); 
disp(r_average);

%% 5.画出ROC曲线

TPR =[];
FPR =[];

for threshold =0:0.001:1
    A_isRight = double(A_train_grade_rank < (movies_Number * threshold));
    % 0，1矩阵，排名在threshold*movie_size之前的为靠前=1，否则=0   

    % 若一个电影获得过评价，且排名靠前（即，预测正确），则试其为真阳性
    A_TP = A_test .* A_isRight;
    TP = sum(A_TP(:));
    % 若一个电影未获得过评价，且排名靠前（即，预测错误），则试其为假阳性
    A_FP = (1 - A_test) .* A_isRight;
    FP = sum(A_FP(:));

    TPR = [TPR,TP/test_Number];
    FPR = [FPR,FP/(users_Number*movies_Number-test_Number)];
end

%画图
figure('NumberTitle', 'off','Name','ROC曲线_19049100002_张泽群')
plot(FPR,TPR,'-ro','LineWidth',1,'MarkerSize',1,"Color",'b');
xlabel('FPR');
ylabel('TPR');
title('ROC Curve');

% 计算包围面积,返回auc
auc = trapz(FPR,TPR);
disp(auc);












