clear;clc;
fP='C:\Users\hanjx\Desktop\medical\data';%�ļ���·��,�ļ����Խ�
F = dir(fP);
fNum=size(F,1)-2;
% �����ļ������·��,�ļ����Խ�
niiP='C:\Users\hanjx\Desktop\medical\out';
% ��ȡ�ļ��������л�����Ϣ
for fn=1:fNum
    [Ima,pName]=readExactFiles(fn,F,fP);
    originalP=strcat(niiP,'\Original\',pName,'.nii');%���ɱ���·�����ļ����Խ�
    oIma=make_nii(Ima);%ת��nii��ʽ��ԭͼ��
    save_nii(oIma,originalP);%����nii�ļ���ԭͼ��;
end
