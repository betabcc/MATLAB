clc; clear; close all; warning off all;
I=imread("cameraman.tif");
se=strel("rectangle",[5,5]);
I2=imerode(I,se);
I3=imdilate(I,se);
subplot(1,3,1),imshow(I),title("ORİJİNAL");
subplot(1,3,2),imshow(I2),title("AŞINDIRMA");
subplot(1,3,3),imshow(I3),title("AÇMA");