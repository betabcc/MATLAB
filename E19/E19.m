clc; clear; close all; warning off all;
A=imread("circlesBrightDark.png");
imshow(A)
Rmin=30;
Rmax=65;
[centersBright,radiiBright]=imfindcircles(A,[Rmin Rmax],"ObjectPolarity","bright");
viscircles(centersBright,radiiBright,'Color','b');
[centersDark,radiiDark]=imfindcircles(A,[Rmin Rmax],"ObjectPolarity","dark");
viscircles(centersDark,radiiDark,'Color','g');