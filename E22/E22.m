clc; clear; close all; warning off all;
Img = imread("candy.jpg");
I = rgb2gray(Img);
robertshor = [0 1; -1 0];
robertsver = [1 0; 0 -1];
Ix = conv2(I, robertshor, "same");
Iy = conv2(I, robertsver, "same");
J = sqrt(Ix.^2 + Iy.^2);
N = bwareaopen(imfill(imbinarize(uint8(J), 0.08), "holes"), 10000);
[labeled, numObjects] = bwlabel(N, 8);
stats = regionprops(labeled, "BoundingBox");
figure, imshow(Img);
hold on;
for idx = 1 : numObjects
    rectangle('Position', stats(idx).BoundingBox, 'LineWidth', 2, 'EdgeColor', [.75 0 0]);
end
title(['BURADA ', num2str(numObjects), ' NESNE VAR']);
hold off;