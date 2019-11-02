clear;clc;
Ima=load_nii('C:\Users\hanjx\Desktop\medical\out\Original\test_未标注.nii');
Ima=Ima.img;
%种子点，注意X，Y数值对换，Z为种子点的图片序号
seedX=332;seedY=242;seedZ=100;T=500;
Smin=10;Smax=15;P=0.5;

% 以大尺度结构元素分割出主气管
%不保存中间结果文件
%% SECTION TITLE
% DESCRIPTIVE TEXT
%不保存中间文件nii
%保存中间结果文件nii
OI=SegByReconstruction(Ima,Smin,Smax,Smin,Smax,Smin,Smax,P,P,P);
OI=twoRegionGrowing3D(Ima,OI,seedX,seedY,seedZ,T);
%生成文件的保存路径
niiP='C:\Users\hanjx\Desktop\medical\out';
airwayP=strcat(niiP,'\AirwayTrees\','MainAirwayTrees2.nii');%生成保存路径，文件夹自建
sI=make_nii(OI);%转成nii格式（气管）
save_nii(sI,airwayP);%保存nii文件（气管）
clear OI
Smin=1;Smax=5;P=0.4;
%以小尺度结构元素分割出小气管
OI=SegByReconstruction(Ima,Smin,Smax,Smin,Smax,Smin,Smax,P,P,P);
%生成文件的保存路径
niiP='C:\Users\hanjx\Desktop\medical\out';
airwayP=strcat(niiP,'\AirwayTrees\','RSAirwayTrees.nii');%生成保存路径，文件夹自建
sI=make_nii(OI);%转成nii格式（气管）
save_nii(sI,airwayP);%保存nii文件（气管）
clear OI

RI=load_nii('C:\Users\hanjx\Desktop\medical\out\AirwayTrees\RSAirwayTrees.nii');
RI=RI.img;MI=load_nii('C:\Users\hanjx\Desktop\medical\out\AirwayTrees\MainAirwayTrees2.nii');
MI=MI.img;
OI=MI|RI;
OI=twoRegionGrowing3D(Ima,OI,seedX,seedY,seedZ,T);
niiP='C:\Users\hanjx\Desktop\medical\out';
airwayP=strcat(niiP,'\AirwayTrees\','AirwayTrees.nii');%生成保存路径
sI=make_nii(OI);%转成nii格式（气管）
save_nii(sI,airwayP);%保存nii文件（气管）

