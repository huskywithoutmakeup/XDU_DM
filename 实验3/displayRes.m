function displayRes(A,C_1)

    n=size(A,1);
    w=floor(sqrt(n));       
    h=floor(n/w);        
    x=[];
    y=[];
    for i=1:h           %使产生的随机点有其范围，使显示分布的更广
        for j=1:w
            x=[x 10*rand(1)+(j-1)*10];
            y=[y 10*rand(1)+(i-1)*10];
        end
    end
    ed=n-h*w;
    for i=1:ed
        x=[x 10*rand(1)+(i-1)*10]; 
        y=[y 10*rand(1)+h*10];
    end
    plot(x,y,'ro','MarkerSize',10);    

    title('社团聚类结果图'); 
    for i=1:n
        for j=i:n
            if A(i,j)~=0
                line([x(i) x(j)],[y(i) y(j)]);      %连线
            end
            if ismember(C_1,i)==0
            text(x(i),y(i),num2str(i),'Fontsize',12,'color','b');   %显示社团C1节点的序号 
            else
            text(x(i),y(i),num2str(i),'Fontsize',12,'color','r');   %显示社团C2节点的序号    
            end

            hold on;
        end  
    end   
end

