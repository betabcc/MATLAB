clc; clear; close all; warning off all;
img = imread("bintang.jpg");
I = rgb2gray(img);
Y=repmat(I,[1 1 3]);
corners = detectHarrisFeatures(I, "MinQuality", 0.03);
topcorners=corners.selectStrongest(10);
imshow(img); hold on;
for i=1:size(topcorners)
    crn=topcorners(i).Location;
    x=crn(1);
    y=crn(2);
    plot(double(x),double(y),'-s',"Color","g","MarkerSize",30,"MarkerEdgeColor","g","MarkerFaceColor",[0 .6 .0]);
    text(double(crn(1)),double(crn(2)),num2str(i));
end