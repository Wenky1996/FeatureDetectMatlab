%author  :       Wenky Jong
%Date    :       2020.03.16
%Address :       MianYang SWSUT
%Revision:       1st
%Function:
%Contact:        wenkyjong1996@gmail.com

clc;
clear all;

myPrc = imread('image8.bmp');

R = myPrc(:,:,1);
G = myPrc(:,:,2);
B = myPrc(:,:,3);

garyPrc = rgb2gray(myPrc);
pointGary = detectFASTFeatures(garyPrc);%�ԻҶ�ͼ������������ȡ

pointFastR = detectFASTFeatures(R);%����һ��conners����
pointFastG = detectFASTFeatures(G);%����һ��conners����
pointFastB = detectFASTFeatures(B);%����һ��conners����

pointStrongR = pointFastR.selectStrongest(100);
pointStrongG = pointFastG.selectStrongest(100);
pointStrongB = pointFastB.selectStrongest(100);

pointStrongGary = pointGary.selectStrongest(100);

locationPoints = pointStrongGary.Location();


figure(1);
subplot(1,2,2);
imshow(myPrc);
title("the features of image");hold on;
%plot(pointStrongR);
%plot(pointStrongG);
%plot(pointStrongB);
plot(pointStrongGary);

subplot(1,2,1);imshow(myPrc);
title("the original image");
