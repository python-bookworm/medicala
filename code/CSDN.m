clear;clc;
Ima=load_nii('C:\Users\hanjx\Desktop\medical\out\Original\test_δ��ע.nii');
Ima=Ima.img;
%���ӵ㣬ע��X��Y��ֵ�Ի���ZΪ���ӵ��ͼƬ���
seedX=332;seedY=242;seedZ=100;T=500;
Smin=10;Smax=15;P=0.5;

% �Դ�߶ȽṹԪ�طָ��������
%�������м����ļ�
%% SECTION TITLE
% DESCRIPTIVE TEXT
%�������м��ļ�nii
%�����м����ļ�nii
OI=SegByReconstruction(Ima,Smin,Smax,Smin,Smax,Smin,Smax,P,P,P);
OI=twoRegionGrowing3D(Ima,OI,seedX,seedY,seedZ,T);
%�����ļ��ı���·��
niiP='C:\Users\hanjx\Desktop\medical\out';
airwayP=strcat(niiP,'\AirwayTrees\','MainAirwayTrees2.nii');%���ɱ���·�����ļ����Խ�
sI=make_nii(OI);%ת��nii��ʽ�����ܣ�
save_nii(sI,airwayP);%����nii�ļ������ܣ�
clear OI
Smin=1;Smax=5;P=0.4;
%��С�߶ȽṹԪ�طָ��С����
OI=SegByReconstruction(Ima,Smin,Smax,Smin,Smax,Smin,Smax,P,P,P);
%�����ļ��ı���·��
niiP='C:\Users\hanjx\Desktop\medical\out';
airwayP=strcat(niiP,'\AirwayTrees\','RSAirwayTrees.nii');%���ɱ���·�����ļ����Խ�
sI=make_nii(OI);%ת��nii��ʽ�����ܣ�
save_nii(sI,airwayP);%����nii�ļ������ܣ�
clear OI

RI=load_nii('C:\Users\hanjx\Desktop\medical\out\AirwayTrees\RSAirwayTrees.nii');
RI=RI.img;MI=load_nii('C:\Users\hanjx\Desktop\medical\out\AirwayTrees\MainAirwayTrees2.nii');
MI=MI.img;
OI=MI|RI;
OI=twoRegionGrowing3D(Ima,OI,seedX,seedY,seedZ,T);
niiP='C:\Users\hanjx\Desktop\medical\out';
airwayP=strcat(niiP,'\AirwayTrees\','AirwayTrees.nii');%���ɱ���·��
sI=make_nii(OI);%ת��nii��ʽ�����ܣ�
save_nii(sI,airwayP);%����nii�ļ������ܣ�

