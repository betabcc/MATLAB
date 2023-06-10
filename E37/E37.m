clc; clear; close all; warning off all;
Img = imread('airplane.jpg');
I = double(rgb2gray(Img));
d1x = [-1 0 1];
d1y = [-1;0;1];
Ix = conv2(I,d1x,'same');
Iy = conv2(I,d1y,'same');
J = sqrt((Ix.^2)+(Iy.^2));
K = J>10;
L = imclearborder(K);
M = imfill(L,'holes');
N = bwareaopen(M,100);
area = sum(sum(N));
O = bwmorph(N,'remove');
perimeter = sum(sum(O));
[B,L] = bwboundaries(N,'noholes');
figure,imshow(Img)
hold on
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'y', 'LineWidth', 2)
end
[row,col] = find(N==1);
[a,b] = size(N);
mask = false(a,b);
mask(min(row):max(row),min(col):max(col)) = 1;
mask =  bwperim(mask,8);
mask = imdilate(mask,strel('square',4));
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
R(mask) = 255;
G(mask) = 255;
B(mask) = 0;
RGB = cat(3,R,G,B);
figure, imshow(RGB);
crop = imcrop(Img,[min(col) min(row) max(col)-min(col) max(row)-min(row)]);
figure, imshow(crop);