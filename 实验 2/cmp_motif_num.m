function ret_data = cmp_motif_num(ture_set,set1,set2,set3,set4,set5,set6,set7,set8,set9,set10,set11,set12,set13,model)
ret_data = zeros(13,1);
% model为0表示大于，1表示小于
for i=1:100
    if set1(i)>=ture_set(1) && model==0
        ret_data(1)=ret_data(1)+1;
    elseif set1(i)<=ture_set(1) && model==1
        ret_data(1)=ret_data(1)+1;
    end
    if set2(i)>=ture_set(2) && model==0
        ret_data(2)=ret_data(2)+1;
    elseif set2(i)<=ture_set(2) && model==1
        ret_data(2)=ret_data(2)+1;
    end
    if set3(i)>=ture_set(3) && model==0
        ret_data(3)=ret_data(3)+1;
    elseif set3(i)<=ture_set(3) && model==1
        ret_data(3)=ret_data(3)+1;
    end
    if set4(i)>=ture_set(4) && model==0
        ret_data(4)=ret_data(4)+1;
    elseif set4(i)<=ture_set(4) && model==1
        ret_data(4)=ret_data(4)+1;
    end
    if set5(i)>=ture_set(5) && model==0
        ret_data(5)=ret_data(5)+1;
    elseif set5(5)<=ture_set(5) && model==1
        ret_data(5)=ret_data(5)+1;
    end
    if set6(i)>=ture_set(6) && model==0
        ret_data(6)=ret_data(6)+1;
    elseif set6(i)<=ture_set(6) && model==1
        ret_data(6)=ret_data(6)+1;
    end
    if set7(i)>=ture_set(7) && model==0
        ret_data(7)=ret_data(7)+1;
    elseif set7(i)<=ture_set(7) && model==1
        ret_data(7)=ret_data(7)+1;
    end
    if set8(i)>=ture_set(8) && model==0
        ret_data(8)=ret_data(8)+1;
    elseif set8(i)<=ture_set(8) && model==1
        ret_data(8)=ret_data(8)+1;
    end
    if set9(i)>=ture_set(9) && model==0
        ret_data(9)=ret_data(9)+1;
    elseif set9(i)<=ture_set(9) && model==1
        ret_data(9)=ret_data(9)+1;
    end
    if set10(i)>=ture_set(10) && model==0
        ret_data(10)=ret_data(10)+1;
    elseif set10(i)<=ture_set(10) && model==1
        ret_data(10)=ret_data(10)+1;
    end
    if set11(i)>=ture_set(11) && model==0
        ret_data(11)=ret_data(11)+1;
    elseif set11(i)<=ture_set(11) && model==1
        ret_data(11)=ret_data(11)+1;
    end
    if set12(i)>=ture_set(12) && model==0
        ret_data(12)=ret_data(12)+1;
    elseif set12(i)<=ture_set(12) && model==1
        ret_data(12)=ret_data(12)+1;
    end
    if set13(i)>=ture_set(13) && model==0
        ret_data(13)=ret_data(13)+1;
    elseif set13(i)<=ture_set(13) && model==1
        ret_data(13)=ret_data(13)+1;
    end    
end