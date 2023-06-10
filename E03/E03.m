clc; clear; close all; warning off all;
I = imread("rice.png");
k = imread("cameraman.tif");
subplot(1,3,1), imshow(I)
subplot(1,3,2), imshow(k)
subplot(1,3,3), imshow(I + k)