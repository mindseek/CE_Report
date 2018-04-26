%load qcal_m1 and qcal_m2

%function [data,state]=dataRead(fileName,M,N)
clear;
%fileName='/Users/zzb/Desktop/tmp/scorr/s3c04a/soft/qcal/qcal_m2.dat';
fileName='/Users/zzb/Desktop/temp/DATA/post/b8423b/soft/qcal/qcal_m2.dat';
Nbsln=6;
Nsig=10;
strbsln=['1' '2' '3' '4' '5' '6'];


dir_file=dir(fileName);
fid=fopen(fileName,'rb');
k=0;
data=fread(fid,'double');
data4dim=reshape(data,Nbsln,Nsig,19,[]);

%3184704 and each takes up 4 bytes for double, and the total number of byte
%is 25477632  (s3c04a)

for i=1:Nbsln
    figure
    for j=1:Nsig
        subplot(Nsig/2,2,j);
        t=shiftdim(data4dim(i,j,2,:)*24+data4dim(i,j,3,:)+data4dim(i,j,4,:)/60+ ...
            (data4dim(i,j,5,:)+data4dim(i,j,6,:))/3600);
        
        derr=shiftdim(data4dim(i,j,8,:)*1e9);
        plot(t,derr,'r.');
        title(['#BSLN' strbsln(i) '#SIG' num2str(j)]);
        xlabel('hoy');ylabel('ns')
    end
end
    


