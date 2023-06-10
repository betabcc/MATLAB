clc; clear; close all; warning off all;
I = imread('candy.png');
figure, imshow(I);
I_Gray = rgb2gray(I);
figure, imshow(I);
I_bw = imbinarize(I_Gray,.88);
figure, imshow(I_bw);
I_bw = imcomplement(I_bw);
figure, imshow(I_bw);
I_bw = imfill(I_bw,'holes');
figure, imshow(I_bw);
I_Gray(~I_bw) = 0;
figure, imshow(I_Gray);
[L,num] = bwlabel(I_bw);
 
for n = 1:num
    bw = L==n;
    figure, imshow(bw);
    [a,b] = find(bw==1);
    gray_level = zeros(1,numel(a),1);
 
    for m = 1:numel(a)
        gray_level(m) = I_Gray(a(m),b(m));
    end
 
    mean_gray_level = mean(gray_level);
    max_gray_level = max(gray_level);
    min_gray_level = min(gray_level);
    std_gray_level = std(gray_level);
    var_gray_level = var(gray_level);
 
    [B,~] = bwboundaries(bw,'noholes');
    boundary = B{1};
    position = [boundary(1,2)+40,boundary(1,1)-50;boundary(1,2)+40,boundary(1,1)-25;...
        boundary(1,2)+40,boundary(1,1);boundary(1,2)+40,boundary(1,1)+25;...
        boundary(1,2)+40,boundary(1,1)+50;boundary(1,2)+40,boundary(1,1)+75];
 
    text_str = cell(6,1);
    text_str{1} = ['Label: ' num2str(n)];
    text_str{2} = ['Mean: ' num2str(mean_gray_level,'%0.2f')];
    text_str{3} = ['Max: ' num2str(max_gray_level)];
    text_str{4} = ['Min: ' num2str(min_gray_level)];
    text_str{5} = ['Std: ' num2str(std_gray_level,'%0.2f')];
    text_str{6} = ['Var: ' num2str(var_gray_level,'%0.2f')];
 
    I_Gray2 = I_Gray;
    I_Gray2(~bw) = 0;
    figure, imshow(I_Gray2);
    RGB = cat(3,I_Gray2,I_Gray2,I_Gray*0);
    RGB2 = insertText(RGB,position,text_str,'FontSize',16,'BoxOpacity',0.8,'TextColor','black');
    figure, imshow(RGB2);
end