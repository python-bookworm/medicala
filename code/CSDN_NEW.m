clear;clc;
Ima=load_nii('C:\Users\hanjx\Desktop\medical\out\Original\test1.nii');
Ima=Ima.img;
seedX=332;seedY=245;seedZ=100;T=500;
Smin=10;Smax=15;P=0.5;

% �Դ�߶ȽṹԪ�طָ��������
%�������м����ļ�
%% SECTION TITLE
% DESCRIPTIVE TEXT
%�������м��ļ�nii
%�����м����ļ�nii
MI=SegByReconstruction(Ima,Smin,Smax,Smin,Smax,Smin,Smax,P,P,P);
MI=twoRegionGrowing3D(Ima,OI,seedX,seedY,seedZ,T);
Smin=1;Smax=5;P=0.4;
%��С�߶ȽṹԪ�طָ��С����
RI=SegByReconstruction(Ima,Smin,Smax,Smin,Smax,Smin,Smax,P,P,P);

OI=MI|RI;
OI=twoRegionGrowing3D(Ima,OI,seedX,seedY,seedZ,T);
niiP='C:\Users\hanjx\Desktop\medical\out';
airwayP=strcat(niiP,'\AirwayTrees\','AirwayTrees.nii');%���ɱ���·��
sI=make_nii(OI);%ת��nii��ʽ�����ܣ�
save_nii(sI,airwayP);%����nii�ļ������ܣ�