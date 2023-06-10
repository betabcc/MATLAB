clc; clear; close all; warning off all;
image=imread("haribo.jpg");
imshow(image)
g=im2gray(image);
imshow(g)
imhist(g)
bw=g>160;
imshow(bw)
se=strel('disk',4);
afterOpening=imopen(bw,se);
imshow(afterOpening);
afterClosing=imclose(afterOpening,se);
imshow(afterClosing);
imshowpair(image,afterOpening,'montage');
imshowpair(image,afterClosing,'montage');
[L,num]=bwlabel(~afterClosing,4);