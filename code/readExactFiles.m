function [Iout,pName]=readExactFiles(N,F,P)
%����ļ�ֻ�ܶ�ȡ�ļ�����������˳�����е��ļ�
%NΪ�ļ����кţ������ļ����еڼ������ļ��е����
%FΪ�ļ��ṹ��
%PΪ�ļ���·��
%Iout����һ����άͼ��
%pName���ػ�������
N=N+2;
pName=F(N).name;%��ȡ�����ļ�������
fP=strcat(P,'\',pName);%��ȡ�����ļ���·��
pF=dir(fP);%��ȡ�����ļ��нṹ��
iN=size(pF,1)-2;%��ȡ�����ļ��������ļ�����
%ѭ����ȡ�û��ߵ�������Ƭdcm
for i=1:iN
    fileName=pF(i+2).name;
    filePath=strcat(fP,'\',fileName);
    Iout(:,:,i)=dicomread(filePath);
end
end