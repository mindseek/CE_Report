%sso=load sso
clear all;close all
%sbi=load('/Users/zzb/Downloads/temp/DATA/post/s3c04a/soft/orbit/d_F2F1.dat');
%sbir=load('/Users/zzb/Downloads/temp/DATA/post/s3c04a/soft/orbit/r_F2F1.dat');
sbi=load('d_F2F1.dat');
sbir=load('r_F2F1.dat');
figure
%plot sbi delay
stnm=['BJ';'KM';'UR';'TM'];
bslnnm=['BJ-KM';'BJ-UR';'BJ-TM';'KM-UR';'KM-TM';'UR-TM'];
nsite=[2 3 4 5];
cs=8.1;
ce=8.3;
k=0;
for i=1:length(nsite)-1
    for j=i+1:length(nsite)
        clear indx sbie t
        indx=find(sbi(:,7)==nsite(i) & sbi(:,8)==nsite(j));
        sbie=sbi(indx,:);
        t=sbie(:,4)+sbie(:,5)/60+sbie(:,6)/3600;
        k=k+1;

        subplot(6,2,2*k-1);
        plot(t,sbie(:,9),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        ylim([-2 2]);xlim([3 12]);
        if k==1
        title('Delay(ns)'); 
        end
        if k==6
        xlabel('hr')
        end
        grid on
        
        clear indx sbie t
        indx=find(sbir(:,7)==nsite(i) & sbir(:,8)==nsite(j));
        sbier=sbir(indx,:);
        tr=sbier(:,4)+sbier(:,5)/60+sbier(:,6)/3600;
        %k=k+1;

        subplot(6,2,2*k);
        plot(tr,sbier(:,9),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        ylim([-2 2]);xlim([3 12]);
        if k==1
        title('Rate(ps)');
        elseif k==6
        xlabel('hr')
        end
        grid on
    end
end

figure %error plot
k=0;
for i=1:length(nsite)-1
    for j=i+1:length(nsite)
        clear indx sbie t
        indx=find(sbi(:,7)==nsite(i) & sbi(:,8)==nsite(j));
        sbie=sbi(indx,:);
        t=sbie(:,4)+sbie(:,5)/60+sbie(:,6)/3600;
        k=k+1;

        subplot(6,2,2*k-1);
        plot(t,sbie(:,10),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        ylim([0 2]);xlim([3 12]);
        if k==1
        title('Delay(ns)'); 
        end
        if k==6
        xlabel('hr')
        end
        grid on
        
        clear indx sbie t
        indx=find(sbir(:,7)==nsite(i) & sbir(:,8)==nsite(j));
        sbier=sbir(indx,:);
        tr=sbier(:,4)+sbier(:,5)/60+sbier(:,6)/3600;
        %k=k+1;

        subplot(6,2,2*k);
        plot(tr,sbier(:,10),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        ylim([0 3]);xlim([3 12]);
        if k==1
        title('Rate(ps)');
        elseif k==6
        xlabel('hr')
        end
        grid on
    end
end


figure
%pick out the data in the span of 9.85-10.05
k=0;
for i=1:length(nsite)-1
    for j=i+1:length(nsite)
        clear indx sbie t
        indx=find(sbi(:,7)==nsite(i) & sbi(:,8)==nsite(j));
        sbie=sbi(indx,:);
        t=sbie(:,4)+sbie(:,5)/60+sbie(:,6)/3600;
        indx2=find(t>cs & t<ce);
        sbie2=sbie(indx2,:);
        
        k=k+1;
        A(k).ts=[t(indx2),sbie2(:,9)];
        subplot(6,1,k);
        plot(t(indx2),sbie2(:,9),'r.');
        ylabel([stnm(i,:) '-' stnm(j,:)]);
    end
end
  
%close all
figure
for i=1:6
subplot(3,2,i)
B=A(i).ts(:,1);
C=A(i).ts(:,2);       
period_mean_fft(C)  
ylabel(bslnnm(i,:))
end        
        


clearvars -except stnm nsite
sbi=load('/Users/zzb/Downloads/temp/DATA/post/s3c04a/soft/orbit/d_F1.dat');
sbir=load('/Users/zzb/Downloads/temp/DATA/post/s3c04a/soft/orbit/r_F1.dat');
figure
k=0;
for i=1:length(nsite)-1
    for j=i+1:length(nsite)
        clear indx sbie t
        indx=find(sbi(:,7)==nsite(i) & sbi(:,8)==nsite(j));
        sbie=sbi(indx,:);
        t=sbie(:,4)+sbie(:,5)/60+sbie(:,6)/3600;
        k=k+1;

        subplot(6,2,2*k-1);
        plot(t,sbie(:,14),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        %ylim([-10 10])
        switch k
            case 1
                title('Res. delay(ns)');
                ylim([-6 4]);
            case 2
                ylim([-10 0]);
            case 3
                ylim([-5 5]);
            case 4  
                ylim([-8 2]);
            case 5
                ylim([0 10]);
            case 6
                ylim([0 10]);  
        end
        if k==6
        xlabel('hr')
        end
        grid on
        xlim([2 14])
        
        clear indx sbie t
        indx=find(sbir(:,7)==nsite(i) & sbir(:,8)==nsite(j));
        sbier=sbir(indx,:);
        tr=sbier(:,4)+sbier(:,5)/60+sbier(:,6)/3600;
        %k=k+1;

        subplot(6,2,2*k);
        plot(tr,sbier(:,14),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        ylim([-10 10])
        if k==1
        title('Rate(ps)');
        elseif k==6
        xlabel('hr')
        end
        grid on
        xlim([2 14])
    end
end


figure
k=0;
for i=1:length(nsite)-1
    for j=i+1:length(nsite)
        clear indx sbie t
        indx=find(sbi(:,7)==nsite(i) & sbi(:,8)==nsite(j));
        sbie=sbi(indx,:);
        t=sbie(:,4)+sbie(:,5)/60+sbie(:,6)/3600;
        k=k+1;

        subplot(6,2,2*k-1);
        plot(t,sbie(:,13),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        
    end
end



clearvars -except stnm nsite
sbi=load('/Users/zzb/Downloads/temp/DATA/post/s3c04a/soft/orbit/d_F2.dat');
sbir=load('/Users/zzb/Downloads/temp/DATA/post/s3c04a/soft/orbit/r_F2.dat');
figure
k=0;
for i=1:length(nsite)-1
    for j=i+1:length(nsite)
        clear indx sbie t
        indx=find(sbi(:,7)==nsite(i) & sbi(:,8)==nsite(j));
        sbie=sbi(indx,:);
        t=sbie(:,4)+sbie(:,5)/60+sbie(:,6)/3600;
        k=k+1;

        subplot(6,2,2*k-1);
        plot(t,sbie(:,14),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        %ylim([-10 10])
        switch k
            case 1
                title('Res. delay(ns)');
                ylim([-6 4]);
            case 2
                ylim([-10 0]);
            case 3
                ylim([-5 5]);
            case 4  
                ylim([-8 2]);
            case 5
                ylim([0 10]);
            case 6
                ylim([0 10]);  
        end
        if k==6
        xlabel('hr')
        end
        grid on
        xlim([2 14])
        
        clear indx sbie t
        indx=find(sbir(:,7)==nsite(i) & sbir(:,8)==nsite(j));
        sbier=sbir(indx,:);
        tr=sbier(:,4)+sbier(:,5)/60+sbier(:,6)/3600;
        %k=k+1;

        subplot(6,2,2*k);
        plot(tr,sbier(:,14),'b.');
        ylabel([stnm(i,:) '-' stnm(j,:)])
        ylim([-10 10])
        if k==1
        title('Rate(ps)');
        elseif k==6
        xlabel('hr')
        end
        grid on
        xlim([2 14])
    end
end

