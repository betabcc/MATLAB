clc; clear; close all; warning off all;
I=imread("8.jpg");
j=rgb2gray(I);
k=imbinarize(j,.55);
L=imcomplement(k);
m=bwareaopen(L,100);
[label,n]=bwlabel(m);
N=label2rgb(label);
figure,imshow(N,[]);
stats=regionprops(label,'Area','Centroid');
for k=1:n
  area=stats(k).Area;
    centroid=stats(k).Centroid;   
text(centroid(1), centroid(2)-12, num2str(k), 'color', 'k', 'Fontsize', 12, 'FontWeight', 'bold'); 
text(centroid(1)-12, centroid(2)+12, num2str(area), 'color', 'k', 'Fontsize', 12, 'FontWeight', 'bold');
end
p=bwareafilt(m,1,'smallest');
o=bwareafilt(m,1,'largest');
figure,imshow(p),title("EN KÜÇÜK")
figure,imshow(o),title("EN BÜYÜK")