clear;clc;
Ima=load_nii('C:\Users\hanjx\Desktop\medical\out\Original\test1.nii');
Ima=Ima.img;
seedX=332;seedY=245;seedZ=100;T=500;
Smin=10;Smax=15;P=0.5;

% 以大尺度结构元素分割出主气管
%不保存中间结果文件
%% SECTION TITLE
% DESCRIPTIVE TEXT
%不保存中间文件nii
%保存中间结果文件nii
MI=SegByReconstruction(Ima,Smin,Smax,Smin,Smax,Smin,Smax,P,P,P);
MI=twoRegionGrowing3D(Ima,OI,seedX,seedY,seedZ,T);
Smin=1;Smax=5;P=0.4;
%以小尺度结构元素分割出小气管
RI=SegByReconstruction(Ima,Smin,Smax,Smin,Smax,Smin,Smax,P,P,P);

OI=MI|RI;
OI=twoRegionGrowing3D(Ima,OI,seedX,seedY,seedZ,T);
niiP='C:\Users\hanjx\Desktop\medical\out';
airwayP=strcat(niiP,'\AirwayTrees\','AirwayTrees.nii');%生成保存路径
sI=make_nii(OI);%转成nii格式（气管）
save_nii(sI,airwayP);%保存nii文件（气管）