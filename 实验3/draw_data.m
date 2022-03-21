function draw_data(A,C)

data_edge=[];
data_pts = zeros(length(A),2);

for i=1:length(A)
    for j=i+1:length(A)
        if A(i,j)==1
            data_edge=[data_edge;i,j;];
        end
    end
end

for i=1:length(A)
    if ismember(C,i)==0
        data_pts(i,:)=[i,2];
    else
        data_pts(i,:)=[i,1];
    end
end

xlswrite("draw_data_edge.xls",data_edge);
xlswrite("draw_data_points.xls",data_pts);