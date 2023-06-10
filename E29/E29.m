clc; clear; close all; warning off all;
Img = imread('para.jpg');
bw = imcomplement(imbinarize(rgb2gray(Img), graythresh(rgb2gray(Img))));
bw = imfill(bwareaopen(bw, 100), 'holes');
bw = imclose(imclearborder(bw), strel('disk', 5));
[B, L] = bwlabel(bw);
stats = regionprops(B, 'Area', 'Centroid');
YCbCr = rgb2ycbcr(Img);
Cb = YCbCr(:, :, 2);
figure, imshow(Img);
hold on
Boundaries = bwboundaries(bw, 'noholes');
for n = 1:L
    boundary = Boundaries{n};
    bw_label = (B == n);
    Cb_label = mean(Cb(bw_label));
    Area = stats(n).Area;
    centroid = stats(n).Centroid;
    if Cb_label > 120
        if Area < 70000
            nilai = 100;
        elseif Area < 80000
            nilai = 200;
        else
            nilai = 500;
        end
        plot(boundary(:, 2), boundary(:, 1), 'y', 'LineWidth', 4)
        text(centroid(1) - 50, centroid(2), num2str(nilai), 'Color', 'y', 'FontSize', 20, 'FontWeight', 'bold');
    else
        if Area < 70000
            nilai = 500;
        else
            nilai = 1000;
        end
        plot(boundary(:, 2), boundary(:, 1), 'c', 'LineWidth', 4)
        text(centroid(1) - 50, centroid(2), num2str(nilai), 'Color', 'c', 'FontSize', 20, 'FontWeight', 'bold');
    end
end