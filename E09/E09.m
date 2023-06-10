clc; clear; close all; warning off all;
I=imread("rice.png");
bw=imbinarize(I,graythresh(I));
bw1=bwareaopen(bw,50);
bw2=bwareaopen(bw,70);
bw3=bwareaopen(bw,10);
subplot(1,4,1),imshow(I);
subplot(1,4,2),imshow(bw1);
subplot(1,4,3),imshow(bw2);
subplot(1,4,4),imshow(bw3);