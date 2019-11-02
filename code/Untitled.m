str='C:\Users\hanjx\Desktop\medical\test\CHE0189.dcm';
Image_dicom=dicomread(str); 
figure;imshow(Image_dicom, 'DisplayRange',[]);
title('dicomÍ¼Ïñ');