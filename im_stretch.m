clc; clear; close all;
warning('off')

addpath('utils\')

fname = 'Vaihingen-2.tif';

percent = 0.02;
gamma = 0.8;

im = imread(fname);

figure; imshow(mat2gray(get_rgb_bands(im))); title('ԭʼͼ��')

%% �ٷֱȲü�����
res = Percent_Cut_Stretch(im, percent, gamma);
figure; imshow(res); title('�ٷֱ�����')

%% ��������
res = Linear_Stretch(im, percent, gamma);
figure; imshow(res); title('��������')

%% ��׼������
res = Std_Stretch( im, 2.5);
figure; imshow(res); title('��׼������')

%% ��ֵ����
res = MaxMin_Stretch(im, 0.01,0.2);
figure; imshow(res); title('��ֵ����')

%% ֱ��ͼ���⻯
res = HistEqua_Stretch(im);
figure; imshow(res); title('ֱ��ͼ���⻯')

% figure; imshow(im);
% res = Linear_Stretch(im, 0.01, gamma);
% figure; imshow(res);
