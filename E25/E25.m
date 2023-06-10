clc; clear; close all; warning off all;
I = imread("tools.jpg");
j = rgb2gray(I);
m = bwareaopen(imcomplement(imbinarize(j, .95)), 100);
[label, n] = bwlabel(m);
N = label2rgb(label);
figure, imshow(N,[]);
stats = regionprops(label, 'Area', 'Centroid');
for k = 1:n 
    area = stats(k).Area;
    centroid = stats(k).Centroid;
    text(centroid(1), centroid(2)-12, num2str(k), 'color', 'k', 'Fontsize', 12, 'FontWeight', 'bold');
    text(centroid(1)-12, centroid(2)+12, num2str(area), 'color', 'k', 'Fontsize', 12, 'FontWeight', 'bold');
end
o = bwareafilt(m, [3000 6000]);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
R(~o) = 255;
G(~o) = 255;
B(~o) = 255;
I = cat(3, R, G, B);