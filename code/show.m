clear;clc
%�򿪻�ȡ���ӵ��ͼƬ������ѡ��һ�ţ��˴�ѡ���100�š�
nii = load_nii('C:\Users\hanjx\Desktop\medical\out\Original\test_δ��ע.nii');
a = nii.img;
figure, imshow(a(:,:,100),[]);
