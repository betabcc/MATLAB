clc; clear; close all; warning off all;
I = imread("baby.jpg");
k = rgb2gray(I);
subplot(1,6,1), imshow(I);
subplot(1,6,2), imshow(k);
subplot(1,6,3), imshow(k*1.2);
subplot(1,6,4), imshow(k*3);
subplot(1,6,5), imshow(k-50);
subplot(1,6,6), imshow(k+50);