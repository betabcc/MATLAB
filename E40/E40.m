clc; clear; close all; warning off all;
I=imread("stabilo.jpg");
HSV=rgb2hsv(I);
H=HSV(:,:,1);
S=HSV(:,:,2);
V=HSV(:,:,3);
bw=imbinarize(S,.4);
bw=imfill(bw,'holes');
bw=bwareaopen(bw,1000);
str=strel('square',12);
bw=imopen(bw,str);
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
R(~bw)=0;
G(~bw)=0;
B(~bw)=0;
RGB=cat(3,R,G,B);
[L,num]=bwlabel(bw);
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
    Hue = 0;
 
    for m = 1:numel(a)
        Hue = Hue+double(H(a(m),b(m)));
    end
 
    Hue = Hue/numel(a);
 
    if Hue < 11/255       
        Warna = 'merah';
    elseif Hue < 32/255   
        Warna = 'jingga';
    elseif Hue < 54/255   
        Warna = 'kuning';
    elseif Hue < 116/255  
        Warna = 'hijau';
    elseif Hue < 141/255  
        Warna = 'cyan';
    elseif Hue < 185/255 
        Warna = 'biru';
    elseif Hue < 202/255
        Warna = 'ungu';
    elseif Hue < 223/255
        Warna = 'magenta';
    elseif Hue < 244/255
        Warna = 'merah muda';
    else
        Warna = 'merah';
    end
 
    [B,~] = bwboundaries(bw2,'noholes');
    boundary = B{1};
    position = [boundary(1,2),boundary(1,1)-80;boundary(1,2),boundary(1,1)-40;...
        boundary(1,2),boundary(1,1)];
    box_color = {'yellow','yellow','yellow'};
 
    text_str = cell(2,1);
    text_str{1} = ['Label: ' num2str(n)];
    text_str{2} = ['Hue: ' num2str(Hue,'%0.2f')];
    text_str{3} = ['Warna: ' Warna];
 
    RGB2 = insertText(I,position,text_str,'FontSize',20,'BoxColor',box_color,'BoxOpacity',0.8,'TextColor','white');
    figure, imshow(RGB2);
end