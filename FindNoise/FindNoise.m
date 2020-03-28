%author  :       Wenky Jong
%Date    :       2020.01.17
%Address :       MianYang SWSUT
%Revision:       1st
%Function:
%Contact:        wenkyjong1996@gmail.com

clc;
clear all;

myPrc = imread('21.bmp');
R = myPrc(:,:,1);
G = myPrc(:,:,2);
B = myPrc(:,:,3);

figure(1),imshow(myPrc);
[rows ,cols] = size(R);

bitNoise = false(size(R));
%bitNoise = R<1;

%the first approach if
THRESHOLD = 200;

noiseLocaltion=[];
cnt = 1;
for i=1:rows
    for j=1:cols
        RintensionPixels = R(i,j);
        GintensionPixels = G(i,j);
        BintensionPixels = B(i,j);
         %the noise single pixels value will be more than THERSHOLD
        if(RintensionPixels>=THRESHOLD||GintensionPixels>=THRESHOLD||BintensionPixels)
            totalIntension = RintensionPixels+GintensionPixels+BintensionPixels;
            if(totalIntension<=2*THRESHOLD)
                bitNoise(i,j) = true;
            end
        end
    end
end

figure(2),imshow(bitNoise);

% the second approach
bitNoise1 = false(size(R));

R = double(R);
G = double(G);
B = double(B);
R=medfilt2(R,[5,5]);
G=medfilt2(G,[5,5]);
B=medfilt2(B,[5,5]);
for i=1:rows
    for j=1:cols
        RintensionPixels = R(i,j);
        GintensionPixels = G(i,j);
        BintensionPixels = B(i,j);
        totalIntension = RintensionPixels+GintensionPixels+BintensionPixels+10;
        ratioR = RintensionPixels/double(totalIntension);
        ratioG = GintensionPixels/double(totalIntension);
        ratioB = BintensionPixels/double(totalIntension);
        % if(ratioR>0.8||ratioB>0.8||ratioG>0.8)
        %     bitNoise1(i,j) = true;
        % end
        if(ratioB>0.5||ratioG>0.5||ratioR>0.5)
            bitNoise1(i,j) = true;
            noiseLocaltion(cnt,1)=i;
            noiseLocaltion(cnt,2)=j;
            cnt=cnt+1;
        end
    end
end
figure(3),imshow(bitNoise1);
