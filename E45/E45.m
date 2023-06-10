clc; clear; close all; warning off all;
% I=imread("baby.jpg");
% e=rgb2gray(I);
% imhist(e)
% I2=histeq(e);
% imshow(I2);

I=imread("rice.png");
imhist(I)
I2=histeq(I);
imhist(I2)
imshow(I2)