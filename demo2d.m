clc
clear
close all

%wavemngr('del','mwv');
wavemngr('add','mywav','mwv',1,'','mywav.m');

wavemngr('read')

im = rgb2gray(imread('1.jpg'));
im = histeq(im);
i = double(im);

[c,l] = wavedec2(i,1,'mwv');
A = appcoef2(c,l,'mwv');
[Dh,Dv,Dd] = detcoef2('all',c,l,1);

subplot(6,1,1); plot(i); title('data')
subplot(6,1,2); plot(A); title('Approximation Coefficients');
subplot(6,1,3); plot(Dh); title('Detail Coefficients');
subplot(6,1,4); plot(Dv); title('Detail Coefficients');
subplot(6,1,5); plot(Dd); title('Detail Coefficients');
subplot(6,1,6); plot(A+Dh+Dv+Dd); title('restored data');

figure(2);
subplot(2,3,1); imshow(uint8(im),[]); title('im');
subplot(2,3,2); imshow(uint8(A),[]); title('A');
subplot(2,3,3); imshow(uint8(Dh),[]); title('Dh');
subplot(2,3,4); imshow(uint8(Dv),[]); title('Dv');
subplot(2,3,5); imshow(uint8(Dd),[]); title('Dd');
subplot(2,3,6); imshow(uint8(A+Dh+Dv+Dd),[]); title('restored image');
 