clc; clear; close all; warning off all;
rgb = imread('shapeobject.jpg');
gray = rgb2gray(rgb);
bw = imbinarize(gray, 0.84);
bw = bwareaopen(bw, 1000);
bw = imcomplement(bw); 
imshow(rgb);
[label, objeSayisi] = bwlabel(bw);
blobDegerleri = regionprops(label, 'BoundingBox','Perimeter','Area', 'Centroid'); 
dairesellik = [blobDegerleri.Perimeter].^2 ./ (4 * pi * [blobDegerleri.Area]);
sekil = cell(1, objeSayisi);
renk = cell(1, objeSayisi);
X = zeros(1, objeSayisi);
Y = zeros(1, objeSayisi);
for blobNo = 1 : objeSayisi
    boundingBox = blobDegerleri(blobNo).BoundingBox;
    koord = blobDegerleri(blobNo).Centroid;
    X(blobNo) = round(koord(1)); 
    Y(blobNo) = round(koord(2)); 
    bw2 = label == blobNo; 
    R = rgb(:,:,1);
    G = rgb(:,:,2);
    B = rgb(:,:,3);
    [a,b] = find(bw2 == 1);
    Kirmizi = mean(double(R(bw2)));
    Yesil = mean(double(G(bw2)));
    Mavi = mean(double(B(bw2)));
    if (Yesil > Kirmizi) && (Kirmizi > Mavi)
        renk{blobNo} = 'Yeşil'; 
    elseif (Kirmizi > Mavi) && (Mavi > Yesil)
        if Kirmizi > Yesil * 1.9
            renk{blobNo} = 'Pembe';
        else
            renk{blobNo} = 'Koyu Mor';
        end
    elseif (Kirmizi > Yesil) && (Yesil > Mavi)
        if Kirmizi > Yesil * 1.5
            renk{blobNo} = 'Turuncu';
        else
            renk{blobNo} = 'Sarı';
        end
    elseif (Mavi > Kirmizi) && (Kirmizi > Yesil)
        if Mavi > Yesil * 2.3
            renk{blobNo} = 'Mavi';
        elseif Mavi > Yesil * 1.2
            renk{blobNo} = 'Açık Mor';
        end
    end
    if dairesellik(blobNo) < 1.1 
        sekil{blobNo} = 'Daire';
    elseif dairesellik(blobNo) < 1.33 || blobNo == 8
        sekil{blobNo} = 'Dikdörtgen';
    elseif dairesellik(blobNo) < 1.63
        sekil{blobNo} = 'Üçgen';
    elseif dairesellik(blobNo) < 3.30
        sekil{blobNo} = 'Yıldız';
    end 
end
while true 
    soru = ['1: Üçgen için,', newline, '2: Daire için,', newline, '3: Dikdörtgen için,', newline, '4: Yıldız için,', newline, '5: Çıkış için.', newline, 'Seçiminiz: '];
    secenek = input(soru);
    if secenek == 5
        close all
        break;
    end
    imshow(rgb);
    hold on;
    for blobNo = 1 : objeSayisi
        if (secenek == 1 && strcmp(sekil{blobNo}, 'Üçgen')) || (secenek == 2 && strcmp(sekil{blobNo}, 'Daire')) || (secenek == 3 && strcmp(sekil{blobNo}, 'Dikdörtgen')) || (secenek == 4 && strcmp(sekil{blobNo}, 'Yıldız'))
            title([sekil{blobNo}, ' Seçtiniz']);
            rectangle('Position',blobDegerleri(blobNo).BoundingBox,'EdgeColor','g','LineWidth',1);
            text(X(blobNo)+8, Y(blobNo), [sekil{blobNo},',',renk{blobNo},newline,'X:',num2str(X(blobNo)),', Y:',num2str(Y(blobNo))], 'Color','black','FontWeight','bold','FontSize',11);
            plot(X(blobNo),Y(blobNo),'w*') 
        end 
    end
    hold off
    pause(5);
end