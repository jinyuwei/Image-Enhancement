clc; clear; close all;
warning('off')

addpath('utils\')

fname = 'Vaihingen-2.tif';

percent = 0.02;
gamma = 0.8;

im = imread(fname);

figure; imshow(mat2gray(get_rgb_bands(im))); title('原始图像')

%% 百分比裁剪拉伸
res = Percent_Cut_Stretch(im, percent, gamma);
figure; imshow(res); title('百分比拉伸')

%% 线性拉伸
res = Linear_Stretch(im, percent, gamma);
figure; imshow(res); title('线性拉伸')

%% 标准差拉伸
res = Std_Stretch( im, 2.5);
figure; imshow(res); title('标准差拉伸')

%% 最值拉伸
res = MaxMin_Stretch(im, 0.01,0.2);
figure; imshow(res); title('最值拉伸')

%% 直方图均衡化
res = HistEqua_Stretch(im);
figure; imshow(res); title('直方图均衡化')

% figure; imshow(im);
% res = Linear_Stretch(im, 0.01, gamma);
% figure; imshow(res);
