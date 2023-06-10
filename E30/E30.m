clc; clear; close all; warning off all;
Img = imread('para.jpg');
Img_gray = rgb2gray(Img);
bw = imbinarize(Img_gray,graythresh(Img_gray));
bw = imcomplement(bw);
bw = bwareaopen(bw,100);
bw = imfill(bw,'holes');
str = strel('disk',5);
bw = imclose(bw,str);
bw = imclearborder(bw);
[B,L] = bwlabel(bw);
stats = regionprops(B,'All');
YCbCr = rgb2ycbcr(Img);
Cb = YCbCr(:,:,2);
figure, imshow(Img);
hold on
Boundaries = bwboundaries(bw,'noholes');
toplam = 0;
for n = 1:L
    boundary = Boundaries{n};
    bw_label = (B==n);
    Cb_label = immultiply(Cb,bw_label);
    Cb_label = (sum(sum(Cb_label)))/(sum(sum(bw_label)));
    Area = stats(n).Area;
    centroid = stats(n).Centroid;
    if Cb_label>120
        plot(boundary(:,2), boundary(:,1), 'y', 'LineWidth', 4)
        text(centroid(1)-50,centroid(2),num2str(nilai),...
            'Color','y','FontSize',20,'FontWeight','bold');
    else
        if Area<11000 
            nilai = 5;
        elseif Area<13800 
            nilai = 25;
        elseif Area<18500 
            nilai = 50;
        elseif Area<21973 
            nilai = 100;
        end
        toplam = toplam + nilai; 
        plot(boundary(:,2), boundary(:,1), 'c', 'LineWidth', 4)
        text(centroid(1)-50,centroid(2),num2str(nilai),...
            'Color','c','FontSize',20,'FontWeight','bold');
    end
end
disp(['TOPLAM:', num2str(toplam)]);