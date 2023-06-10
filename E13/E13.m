clc; clear; close all; warning off all;
bw=imread("text.png");
se=strel("line",20,100);
bw2=imdilate(bw,se);
imshow(bw),title("ORIGINAL"),figure,imshow(bw2),title("DILATED")