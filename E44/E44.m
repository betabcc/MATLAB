clc; clear; close all; warning off all;
img = imread('soru1.jpg');
hsvImg = rgb2hsv(img);
binaryImg = hsvImg(:,:,1) > 0.53 & hsvImg(:,:,1) < 0.92 & hsvImg(:,:,2) > 0.2;
se = strel('disk', 2);
binaryImg = imopen(binaryImg, se);
binaryImg = imfill(binaryImg, 'holes');
binaryImg = bwareaopen(binaryImg, 120);
props = regionprops(binaryImg, 'Centroid', 'BoundingBox', 'Area', 'Solidity', 'Eccentricity', 'Extent');
minArea = 120; 
minSolidity = 0.55; 
maxEccentricity = 0.75; 
minExtent = 0.5;
props([props.Area] < minArea | [props.Solidity] < minSolidity | [props.Eccentricity] > maxEccentricity | [props.Extent] < minExtent) = [];
num = numel(props);
imshow(img);
hold on
for k = 1:num
    plot(props(k).Centroid(1), props(k).Centroid(2), 'r*');
    rectangle('Position', props(k).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
end
hold off
fprintf('YABAN MERSINI SAYISI: %d\n', num);