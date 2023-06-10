clc; clear; close all; warning off all;
a = imread("baby.jpg");
subplot(2,2,1), imshow(a)
R = a;
G = a;
B = a;
R(:,:,2:3) = 0;
G(:,:,1) = 0;
G(:,:,3) = 0;
B(:,:,1) = 0;
B(:,:,2) = 0;
subplot(2,2,2), imshow(R);
subplot(2,2,3), imshow(G);
subplot(2,2,4), imshow(B);