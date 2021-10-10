% ОРИГИАЛЬНОЕ ИЗОБРАЖЕНИЕ
img_A = imread('../resources/Pic_12_1.jpg');   
imshow(img_A); title('Original Image 1'); pause;

img_B = imread('../resources/Pic_12_2.jpg');
imshow(img_B); title('Original Image 2'); pause;

% СОВМЕЩЕННОЕ ИЗОБРАЖЕНИЕ =================================================
img_Size = [800 1200];
bright_A = 0.5;

img_A = imresize(img_A, img_Size);
img_B = imresize(img_B, img_Size);
img_composite = (img_A*bright_A)+(img_B*(1-bright_A));

imwrite(img_composite,'pic_12_3.jpg','jpg');
imshow(img_composite); title('Composite Image'); pause;