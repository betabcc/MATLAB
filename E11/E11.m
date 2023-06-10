clc; clear; close all; warning off all;
I=imread("rice.png");
J=imadd(I,50);
lvl=graythresh(I);
BW=imbinarize(I,lvl);
bw=imcomplement(BW);
subplot(1,3,1),imshow(I);
subplot(1,3,2),imshow(J);
subplot(1,3,3),imshow(bw);