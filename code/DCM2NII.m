clear;clc;
fP='C:\Users\hanjx\Desktop\medical\data';%文件夹路径,文件夹自建
F = dir(fP);
fNum=size(F,1)-2;
% 生成文件保存的路径,文件夹自建
niiP='C:\Users\hanjx\Desktop\medical\out';
% 读取文件夹中所有患者信息
for fn=1:fNum
    [Ima,pName]=readExactFiles(fn,F,fP);
    originalP=strcat(niiP,'\Original\',pName,'.nii');%生成保存路径，文件夹自建
    oIma=make_nii(Ima);%转成nii格式（原图）
    save_nii(oIma,originalP);%保存nii文件（原图）;
end
