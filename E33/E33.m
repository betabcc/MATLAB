clc; clear; close all; warning off all;
im = imread('ronaldo.jpg');
figure,imshow(im);
im_gray = rgb2gray(im);
figure,imshow(im_gray);
e = edge(im_gray, 'canny');
figure,imshow(e);
radii = 25:1:40;
h = circle_hough(e, radii, 'same', 'normalise');
peaks = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);
figure,imshow(im);
hold on;
bw = false(size(im_gray));
for peak = peaks
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'y-','LineWidth',4);
    bw(x+peak(2), y+peak(1)) = true;
end
hold off
im2 = insertShape(im,'circle',[peaks(1),peaks(2),peaks(3)],'LineWidth', 4);
R = im2(:,:,1);
G = im2(:,:,2);
B = im2(:,:,3);
[r,c,~] = find(R==255 & G==255 & B==0);
numind = size(r,1);
bin = false(size(im2,1), size(im2,2));
for i=1:numind
    bin(r(i),c(i)) = 1;
end
bin = imfill(bin,'holes');
str = strel('disk',5);
bin = imerode(bin,str);
figure, imshow(bin);
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);
R(~bin) = 0;
G(~bin) = 0;
B(~bin) = 0;
RGB = cat(3,R,G,B);
figure,imshow(RGB);
stats = regionprops(bin,'All');
bbox = cat(1,stats.BoundingBox);
im3 = imcrop(RGB,bbox);
figure, imshow(im3);
area = cat(1,stats.Area);
perimeter = cat(1,stats.Perimeter);
disp(['Area = ',num2str(area)])
disp(['Perimeter = ',num2str(perimeter)])