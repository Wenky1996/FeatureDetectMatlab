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
pointGary = detectFASTFeatures(garyPrc);%对灰度图进行特征点提取

pointFastR = detectFASTFeatures(R);%返回一个conners对象
pointFastG = detectFASTFeatures(G);%返回一个conners对象
pointFastB = detectFASTFeatures(B);%返回一个conners对象

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
