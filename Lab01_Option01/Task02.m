% INPUT IMAGE
imgA = imread('resources/Pic_12_1.jpg');   
imshow(imgA); title('Original Image 1'); pause;

imgB = imread('resources/Pic_12_2.jpg');
imshow(imgB); title('Original Image 2'); pause;

% COMPOSITE IMAGE
imgSize = [800 1200];
brightA = 0.5;

imgA = imresize(imgA, imgSize);
imgB = imresize(imgB, imgSize);
imgComposite = (imgA*brightA)+(imgB*(1-brightA));

imshow(imgComposite); title('Composite Image'); pause;
imwrite(imgComposite,'results/lab01_opt01_task02_01.jpg');