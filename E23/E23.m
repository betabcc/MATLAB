clc; clear; close all; warning off all;
baby = imread('baby.jpg');
baby_gray = rgb2gray(baby);
baby_bw = imbinarize(baby_gray, 243/255);
baby_bw2 = imcomplement(baby_bw);
baby_bw3 = imfill(baby_bw2, 'holes');
baby_bw3(end, :) = 1;
baby_bw3 = imfill(baby_bw3, 'holes');
baby_bw3(end, :) = 0;
baby_bw4 = imerode(baby_bw3, strel('disk', 1));
red_baby = baby(:, :, 1);
green_baby = baby(:, :, 2);
blue_baby = baby(:, :, 3);
cloud = imread('cloud.jpg');
red_cloud = cloud(:, :, 1);
green_cloud = cloud(:, :, 2);
blue_cloud = cloud(:, :, 3);
red_cloud(baby_bw4) = red_baby(baby_bw4);
green_cloud(baby_bw4) = green_baby(baby_bw4);
blue_cloud(baby_bw4) = blue_baby(baby_bw4);
rgb = cat(3, red_cloud, green_cloud, blue_cloud);
imshow(rgb);