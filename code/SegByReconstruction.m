function OI=SegByReconstruction(Ima,nx,Nx,ny,Ny,nz,Nz,Tx,Ty,Tz)
[x,y,z]=size(Ima);
OI1=ones(x,y,z);

for n=1:z
I=Ima(:,:,n);
I=squeeze(I);
mask=[0,1/4,0;1/4,1/4,1/4;0,1/4,0];%拉普拉斯滤波模板
I=imfilter(I,mask);%前面是图片，后面是模板
[x1,y1]=size(I);
CI=zeros(x1,y1);
for i=nz:Nz
se=strel('disk',i);
J=imclose(I,se);
isStop=true;
se=strel('disk',1);
while isStop
    tJ=J;
    J=imerode(J,se);
    J=max(J,I);
    if J==tJ
        isStop=false;
    end
end
DI=J-I;
vma=max(max(DI));
vmi=min(min(DI));
Tmax=(vma-vmi)*Tz;
ind=find(DI>Tmax);
DI=zeros(x1,y1);
DI(ind)=1;
CI=max(CI,DI);
end
OI1(:,:,n)=CI;
end

OI2=ones(x,y,z);
for n=1:x
I=Ima(n,:,:);
I=squeeze(I);
mask=[0,1/4,0;1/4,1/4,1/4;0,1/4,0];%拉普拉斯滤波模板
I=imfilter(I,mask);%前面是图片，后面是模板
[x2,y2]=size(I);
CI=zeros(x2,y2);
for i=nx:Nx
se=strel('disk',i);
J=imclose(I,se);
isStop=true;
se=strel('disk',1);
while isStop
    tJ=J;
    J=imerode(J,se);
    J=max(J,I);
    if J==tJ
        isStop=false;
    end
end
DI=J-I;
vma=max(max(DI));
vmi=min(min(DI));
Tmax=(vma-vmi)*Tx;
ind=find(DI>Tmax);
DI=zeros(x2,y2);
DI(ind)=1;
CI=max(CI,DI);
end
OI2(n,:,:)=CI;
end

OI3=ones(x,y,z);
for n=1:y
% [x,y]=size(I);
I=Ima(:,n,:);
I=squeeze(I);
mask=[0,1/4,0;1/4,1/4,1/4;0,1/4,0];%拉普拉斯滤波模板
I=imfilter(I,mask);%前面是图片，后面是模板
[x3,y3]=size(I);
CI=zeros(x3,y3);
for i=ny:Ny
se=strel('disk',i);
J=imclose(I,se);
isStop=true;
se=strel('disk',1);
while isStop
    tJ=J;
    J=imerode(J,se);
    J=max(J,I);
    if J==tJ
        isStop=false;
    end
end
DI=J-I;
vma=max(max(DI));
vmi=min(min(DI));
Tmax=(vma-vmi)*Ty;
ind=find(DI>Tmax);
DI=zeros(x3,y3);
DI(ind)=1;
CI=max(CI,DI);
end
OI3(:,n,:)=CI;
end

OI1=max(OI1,OI2);
OI=max(OI1,OI3);
end