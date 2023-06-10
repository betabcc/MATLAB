clc; clear; close all; warning off all;
im = imread("top.jpg");
bw_im = imbinarize(rgb2gray(im));
stats = regionprops(bw_im, 'Centroid', 'MajorAxisLength', 'Area');
figure, imshow(im);
hold on;
top_sayisi = 0;
for i = 1:numel(stats)
    radius = stats(i).MajorAxisLength / 2;
    if stats(i).Area > 5000 && radius > 30  
        viscircles(stats(i).Centroid, radius, 'EdgeColor', 'y', 'LineWidth', 4);
        top_sayisi = top_sayisi + 1;
    end
end
hold off;
fprintf('TOP SAYISI: %d\n', top_sayisi);