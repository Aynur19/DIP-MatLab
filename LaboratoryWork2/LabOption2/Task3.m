clc;
clear all;
close all;

imgOrigin = imread('resources/Pic_2_03a_gray_dark.tif');
figure(); imshow(imgOrigin); title('Original Image');
figure(); histogram(imgOrigin); title('Original Image histogram');
imwrite(imgOrigin, 'results/l2_o2_t3_origin_pic.png');
saveas(gcf, 'results/l2_o2_t3_origin_hist.png')

P2 = imadjust(imgOrigin, [], [], 0.25);
figure();  imshow(P2); title('Image after imadjust() function (coef=0.25)');
figure(); histogram(P2); title('Image histogram after imadjust() function (coef=0.25)');
imwrite(P2, 'results/l2_o2_t3_imadjust_pic.png');
saveas(gcf, 'results/l2_o2_t3_imadjust_hist.png')

PE = histeq(imgOrigin); 
figure(); imshow(PE); title('Image after histeq() function');
figure(); histogram(PE); title('Image histogram histeq() function is applied');
imwrite(PE, 'results/l2_o2_t3_histeq_pic.png');
saveas(gcf, 'results/l2_o2_t3_histeq_hist.png')

B = imlocalbrighten(imgOrigin);
figure(); imshow(PE); title('Image after imlocalbrighten() function');
figure(); histogram(PE); title('Image histogram imlocalbrighten() function is applied');
imwrite(B, 'results/l2_o2_t3_imlocalbrighten_pic.png');
saveas(gcf, 'results/l2_o2_t3_imlocalbrighten_hist.png')

%gray = rgb2gray(imgOrigin);
%imshow(gray);
%imcontrast();
imgImcontrast = imread('results/l2_o2_t3_imcontrast_pic.png');
figure(); imshow(imgImcontrast); title('Image after imcontrast() function');
figure(); histogram(imgImcontrast); title('Image histogram imcontrast() function is applied');
saveas(gcf, 'results/l2_o2_t3_imcontrast_hist.png')
