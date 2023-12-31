clc; clear; close all; warning off all;
Img=imread("mario.jpg");
Gray=rgb2gray(Img);
bw=imbinarize(Gray,.99);
bw=imcomplement(bw);
bw=imfill(bw,"holes");
bw=bwareaopen(bw,100);
str=strel("disk",5);
bw=imerode(bw,str);
Img2 = imread('background.jpg');
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
R2 = Img2(:,:,1);
G2 = Img2(:,:,2);
B2 = Img2(:,:,3);
R2(bw) = R(bw);
G2(bw) = G(bw);
B2(bw) = B(bw);
RGB = cat(3,R2,G2,B2);
figure, imshow(RGB);