function degreeMap = getDegree(A)
degreeMap = zeros(length(A),2);
for i=1:length(A)
    degreeMap(i,1)=sum(A(i,:)); % 计算出度
    degreeMap(i,2)=sum(A(:,i)); % 计算入度
end
end