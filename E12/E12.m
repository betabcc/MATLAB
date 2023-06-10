clc; clear; close all; warning off all;
I=imread("eight.tif");
no=imnoise(I,"salt & pepper",0.02);
filt1=medfilt2(no);
filt2=wiener2(no);
subplot(2,2,1); imshow(I), title("ORİJİNAL RESİM")
subplot(2,2,2); imshow(no), title("GÜRÜLTÜLÜ RESİM")
subplot(2,2,3), imshow(filt1), title("MEDYAN FİLTRESİ UYGULANMIŞ RESİM")
subplot(2,2,4), imshow(filt2), title("WIENER FİLTRESİ UYGULANMIŞ RESİM")