clc; clear; close all; warning off all;
I=imread("cameraman.tif");
subplot(2,2,1),imshow(I);
subplot(2,2,2),imshow(fliplr(I));
subplot(2,2,3),imshow(flipud(I));
subplot(2,2,4),imshow(I');