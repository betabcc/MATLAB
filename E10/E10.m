clc; clear; close all; warning off all;
I=imread("rice.png");
BW=imbinarize(I,graythresh(I));
B=bwboundaries(BW);
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(BW);