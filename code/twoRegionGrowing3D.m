function OI=twoRegionGrowing3D(Ima,MIma,seedX,seedY,seedZ,T)
%Ima为原图像，MIma为重建图像，OI为输出图像
%seedX,seedY为种子点的坐标
%T为阈值
[xV,yV,zV]=size(Ima);
OI=zeros(xV,yV,zV);
seedMat=[seedX,seedY,seedZ];
while size(seedMat, 1)
    x = seedMat(1,1);
    y = seedMat(1,2);
    z = seedMat(1,3);
    seedMat(1,:)=[];
    for i = -1:1
        for j = -1:1
            for k = -1:1
                if x+i > 0  &&  x+i <= xV && y+j > 0  &&  y+j <= yV && z+k > 0  &&  z+k <= zV && ~all([i,j,k]==0) && ~OI(x+i,y+j,z+k) && Ima(x+i,y+j,z+k)<T && MIma(x+i,y+j,z+k)>0
                    seedMat(end+1,:) = [x+i, y+j,z+k]; 
                    OI(x+i, y+j,z+k)=true;
                end
            end
            %% SECTION TITLE
            % DESCRIPTIVE TEXT
        end
    end
end

for n=1:zV
    se=strel('disk',2);
    OI(:,:,n)=imclose(OI(:,:,n),se);
end

end