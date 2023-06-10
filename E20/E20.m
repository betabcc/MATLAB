clc; clear; close all; warning off all;
I = imread("tools.jpg");
j = rgb2gray(I);
k = imbinarize(j, .95);
L = imcomplement(k);
m = bwareaopen(L, 100);
imshow(m);