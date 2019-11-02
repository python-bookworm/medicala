function [Iout,pName]=readExactFiles(N,F,P)
%这个文件只能读取文件名按期望的顺序排列的文件
%N为文件序列号，就是文件夹中第几个子文件夹的序号
%F为文件结构体
%P为文件夹路径
%Iout返回一个三维图像
%pName返回患者姓名
N=N+2;
pName=F(N).name;%获取患者文件夹名称
fP=strcat(P,'\',pName);%获取患者文件夹路径
pF=dir(fP);%获取患者文件夹结构体
iN=size(pF,1)-2;%获取患者文件夹下子文件数量
%循环读取该患者的所有切片dcm
for i=1:iN
    fileName=pF(i+2).name;
    filePath=strcat(fP,'\',fileName);
    Iout(:,:,i)=dicomread(filePath);
end
end