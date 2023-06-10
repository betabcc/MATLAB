clc; clear; close all; warning off all;
I = imread('bintang.jpg');
I = imresize(I,0.2);
I_gray = rgb2gray(I);
bw = imbinarize(I_gray,.82);
bw2 = bwperim(bw);
[H,theta,s] = hough(bw2,'Theta',-90:0.5:89);
P = houghpeaks(H,100,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(bw2,theta,s,P,'FillGap',10,'MinLength',2);
xy2 = zeros(length(lines)*2, 2);
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    xy2((k-1)*2+1:k*2,:) = xy;
end
xy3 = sortrows(xy2);
for k = 1:length(lines)
    bbox = xy3(k*2,:) - 10;
    I = insertText(I,bbox, num2str(k),'FontSize',20);
end
imshow(I);
title('KÖŞE NOKTASI ALGILAMA SONUÇLARI');