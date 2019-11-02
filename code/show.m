clear;clc
%打开获取种子点的图片，随意选择一张，此处选择第100张。
nii = load_nii('C:\Users\hanjx\Desktop\medical\out\Original\test_未标注.nii');
a = nii.img;
figure, imshow(a(:,:,100),[]);
