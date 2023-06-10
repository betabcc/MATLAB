clc; clear; close all; warning off all;
I=imread("rice.png");
s=edge(I,"sobel",0.1);
k=edge(I,"sobel",0.1,"vertical");
m=edge(I,"sobel",0.1,"horizontal");
subplot(2,2,1),imshow(I);
subplot(2,2,2),imshow(s);
subplot(2,2,3),imshow(k);
subplot(2,2,4),imshow(m);