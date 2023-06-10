clc; clear; close all; warning off all;
I=imread("cameraman.tif");
se=strel("rectangle",[5,5]);
I2=imdilate(I,se);
imshow(I), title("ORİJİNAL"), figure, imshow(I2), title("DILATED");