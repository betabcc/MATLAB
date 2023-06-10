clc; clear; close all; warning off all;
I = imread('balls.jpg');
J = rgb2hsv(I);
H = J(:,:,1);
S = J(:,:,2);
V = J(:,:,3);
bw = imbinarize(S,.25);
bw = bwareaopen(bw,50);
[L,num] = bwlabel(bw);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
R(~bw) = 0;
B(~bw) = 0;
G(~bw) = 0;
RGB = cat(3,R,G,B);
RGB2 = I;
for n = 1:num
 bw2 = L==n;
 R = I(:,:,1);
 G = I(:,:,2);
 B = I(:,:,3);
 R(~bw2) = 0;
 G(~bw2) = 0;
 B(~bw2) = 0;
 RGB = cat(3,R,G,B);
 [a,b] = find(bw2==1);
 Red = 0;
 Green = 0;
 Blue = 0;
 for m = 1:numel(a)
 Red = Red+double(R(a(m),b(m)));
 Green = Green+double(G(a(m),b(m)));
 Blue = Blue+double(B(a(m),b(m)));
 end
 Red = Red/numel(a);
 Green = Green/numel(a);
 Blue = Blue/numel(a);
 [B,~] = bwboundaries(bw2,'noholes');
 boundary = B{1};
 position = [boundary(1,2)-40,boundary(1,1)-160;boundary(1,2)-40,boundary(1,1)-80;...
 boundary(1,2)-40,boundary(1,1);boundary(1,2)-40,boundary(1,1)+80];
 box_color = {'yellow','red','green','blue'};
 text_str = cell(4,1);
 text_str{1} = ['Label: ' num2str(n)];
 text_str{2} = ['Red: ' num2str(Red,'%0.2f')];
 text_str{3} = ['Green: ' num2str(Green,'%0.2f')];
 text_str{4} = ['Blue: ' num2str(Blue,'%0.2f')];
 RGB2 = insertText(RGB2,position,text_str,'FontSize',40,'BoxColor',box_color,'BoxOpacity',0.8,'TextColor','white');
 figure, imshow(RGB2);
end