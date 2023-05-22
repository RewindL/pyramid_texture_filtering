close all;

% I\O setting
input_path = 'figures/';
output_path = 'output/';
if exist(output_path, 'dir')==0 
    mkdir(output_path);
end

% parameters
img_name = '01.png'; sigma_s = 5.0; sigma_r = 0.07; % example 1
% img_name = '02.png'; sigma_s = 5.0; sigma_r = 0.09; % example 2
% img_name = '03.png'; sigma_s = 5.0; sigma_r = 0.02; % example 3
% img_name = '04.png'; sigma_s = 5.0; sigma_r = 0.05; % example 4
% img_name = '05.png'; sigma_s = 5.0; sigma_r = 0.03; % example 5
% img_name = '06.png'; sigma_s = 5.0; sigma_r = 0.05; % example 6
% img_name = '07.png'; sigma_s = 7.0; sigma_r = 0.04; % example 7
% img_name = '08.png'; sigma_s = 7.0; sigma_r = 0.08; % example 8


% filtering
I = im2double(imread(strcat(input_path, img_name)));
tic;
R = PyramidTextureFilter(I,sigma_s,sigma_r);
toc;

% displaying
subplot(1,2,1);imshow(I);title('Input');
subplot(1,2,2);imshow(R);title('Result');

% saving
imwrite(R, strcat(output_path, 'result_', img_name));

