clc; clear; close all; warning off all;
I=imread("cameraman.tif");
j=imrotate(I,35,"bilinear");
m=imrotate(I,45,"nearest");
n=imrotate(I,60,"bicubic");
subplot(2,2,1),imshow(I);
subplot(2,2,2),imshow(j);
subplot(2,2,3),imshow(m);
subplot(2,2,4),imshow(n);