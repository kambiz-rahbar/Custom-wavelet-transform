clc
clear
close all

%wavemngr('del','mwv');
wavemngr('add','mywav','mwv',1,'','mywav.m');

wavemngr('read')

im = rgb2gray(imread('1.jpg'));
im = histeq(im);
i = double(im(:));

[c,l] = wavedec(i,1,'mwv');
A = appcoef(c,l,'mwv');
D = detcoef(c,l);

subplot(4,1,1); plot(i); title('data');
subplot(4,1,2); plot(A); title('Approximation Coefficients');
subplot(4,1,3); plot(D); title('Detail Coefficients');
subplot(4,1,4); plot(A+D); title('restored data');

