[<< To main][main_en] 

# Course "Digital Image Processing"
[Read in Russian][ru]

## Laboratory work 2. Option 1


---
### Task 1
1. The original image **Img2_01_1.jpg** is a panoramic photograph of the earth's surface. Converting to a binary image using thresholding of the original image, find 10 regions with the highest brightness.
2. Determine the coordinates of these points.

Solution script: [Task01.m][Task01]

||
|:---:|
|Original image <br> ![source01_01]|
|10 areas with the highest brightness <br> ![result01_01]|
|Point coordinates <br> ![result01_02]|


---
### Task 2
1. Create an image of a white rectangle on a black square background:
    - the dimensions of the square are 1001x1001 pixels.
    - the dimensions of the rectangle are 81x201 pixels.
2. Construct a 2D centered spectrum of the image using the standard fft2 and fftshift functions.
3. Using the logarithmic transformation of brightness, construct an image of the spectrum, which shows not only its central part, but also the behavior at the edges of the image.
4. By changing the parameters of the logarithmic brightness conversion function, provide the ability to change the dynamic range of brightness, in which you can change the ratio of brightness at the edges and in the center of the spectrum image.
5. Determine the dynamic range of the brightness of the image spectrum before and after the logarithmic transformation of the brightness.
6. Plot 1D spectrum plots corresponding to the horizontal and vertical line sections of the image through the center of the spectrum image. Build each pair of graphs for two cases: before and after the logarithmic transformation of brightness.
7. Construct a similar image of the spectrum for the same rectangle located in the upper left edge of the spatial image.

Solution script: [Task02.m][Task02]

|||
|:---:|:---:|
|White rectangle in the center <br> ![result02_01]|White rectangle in the upper left corner <br> ![result02_08]|
|Centered spectrum <br> ![result02_02]|Centered spectrum <br> ![result02_09]|
|Logarithmic transformation of the spectrum brightness: **K=0.01** <br> ![result02_03]|Logarithmic transformation of the spectrum brightness: **K=0.01** <br> ![result02_10]|
|Logarithmic transformation of the spectrum brightness: **K=1** <br> ![result02_04]|Logarithmic transformation of the spectrum brightness: **K=1** <br> ![result02_11]|
|Logarithmic transformation of the spectrum brightness: **K=100** <br> ![result02_05]|Logarithmic transformation of the spectrum brightness: **K=100** <br> ![result02_12]|
|Spectrum plot corresponding to image cross-sections with horizontal and vertical lines passing through the center of the spectrum image: **before the logarithmic transformation of brightness: K=1** <br> ![result02_06]|Spectrum plot corresponding to image cross-sections with horizontal and vertical lines passing through the center of the spectrum image: **before the logarithmic transformation of brightness: K=1** <br> ![result02_13]|
|Spectrum plot corresponding to image cross-sections with horizontal and vertical lines passing through the center of the spectrum image: **after the logarithmic transformation of brightness: K=1** <br> ![result02_07]|Spectrum plot corresponding to image cross-sections with horizontal and vertical lines passing through the center of the spectrum image: **after the logarithmic transformation of brightness: K=1** <br> ![result02_14]|


---
### Task 3
1. Given the image **Img2_01_3.jpg**. Construct a histogram of the brightness of the specified image.
2. Use the `imajust` function to correct the contrast. Construct a histogram of the brightness of the corrected image.
3. Use the `histeq` function to equalize the histogram. Build a histogram of luminance after equalization.
4. Use the `imlocalbrighten` function to improve contrast. Construct a histogram of the corrected image.
5. Use the `imcontrast` function to improve brightness and contrast. Construct a histogram of the corrected image.

Solution script: [Task03.m][Task03]

<table width="100%">
  <tr align="center">
    <td width="50%">
        Original image <br>
        <img src="resources/Img2_01_3.jpg">
    </td>
    <td width="50%">
        Brightness histogram of the original image <br>
        <img src="results/lab02_opt01_task03_01.png">        
    </td>
  </tr>
  <tr align="center">
    <td width="50%">
        Image after contrast correction: <code>imadjust(gamma=25.0)</code> <br>
        <img src="results/lab02_opt01_task03_02.png">
    </td>
    <td width="50%">
        Brightness histogram after brightness correction <code>imadjust(gamma=25.0)</code> <br>
        <img src="results/lab02_opt01_task03_03.png">        
    </td>
  </tr>
  <tr align="center">
    <td width="50%">
        Image after histogram equalization: <code>histeq()</code> <br>
        <img src="results/lab02_opt01_task03_04.png">
    </td>
    <td width="50%">
        Brightness histogram after histogram equalization: <code>histeq()</code> <br>
        <img src="results/lab02_opt01_task03_05.png">        
    </td>
  </tr>
  <tr align="center">
    <td width="50%">
        Image after contrast improvement: <code>imadjust(gamma=50.0) + imlocalbrighten(amount=0.5)</code> <br>
        <img src="results/lab02_opt01_task03_06.png">
    </td>
    <td width="50%">
        Brightness histogram after contrast improvement: <code>imadjust(gamma=50.0) + imlocalbrighten(amount=0.5)</code> <br>
        <img src="results/lab02_opt01_task03_07.png">        
    </td>
  </tr>
  <tr align="center">
    <td width="50%">
        Image after improving brightness and contrast: <code>imcontrast()</code> <br>
        <img src="results/lab02_opt01_task03_08.png">
    </td>
    <td width="50%">
        Brightness histogram after improving brightness and contrast: <code>imcontrast()</code> <br>
        <img src="results/lab02_opt01_task03_09.png">        
    </td>
  </tr>
</table>


---
[en]: README.md
[ru]: README-ru.md

[main_en]: ../README.md
[main_ru]: ../README-ru.md

[Task01]: Task01.m
[Task02]: Task02.m
[Task03]: Task03.m

[source01_01]: resources/Img2_01_1.jpg
[source03_01]: resources/Img2_01_3.jpg

[result01_01]: results/lab02_opt01_task01_01.png
[result01_02]: results/lab02_opt01_task01_02.png

[result02_01]: results/lab02_opt01_task02_01.png
[result02_02]: results/lab02_opt01_task02_02.png
[result02_03]: results/lab02_opt01_task02_03.png
[result02_04]: results/lab02_opt01_task02_04.png
[result02_05]: results/lab02_opt01_task02_05.png
[result02_06]: results/lab02_opt01_task02_06.png
[result02_07]: results/lab02_opt01_task02_07.png
[result02_08]: results/lab02_opt01_task02_08.png
[result02_09]: results/lab02_opt01_task02_09.png
[result02_10]: results/lab02_opt01_task02_10.png
[result02_11]: results/lab02_opt01_task02_11.png
[result02_12]: results/lab02_opt01_task02_12.png
[result02_13]: results/lab02_opt01_task02_13.png
[result02_14]: results/lab02_opt01_task02_14.png

[result03_01]: results/lab02_opt01_task03_01.png
[result03_02]: results/lab02_opt01_task03_02.png
[result03_03]: results/lab02_opt01_task03_03.png
[result03_04]: results/lab02_opt01_task03_04.png
[result03_05]: results/lab02_opt01_task03_05.png
[result03_06]: results/lab02_opt01_task03_06.png
[result03_07]: results/lab02_opt01_task03_07.png
[result03_08]: results/lab02_opt01_task03_08.png
[result03_09]: results/lab02_opt01_task03_09.png
