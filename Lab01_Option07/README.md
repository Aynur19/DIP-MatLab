# Course "Digital Image Processing"
[Read in Russian][ru]

## Laboratory work 1. Option 7


---
### Task 1
1. Build a rectangular mesh on a given image with the option to select the following mesh parameters:
    - distance between lines
    - line thickness
    - color of grid lines
2. Place a semi-transparent circle on the image with the choice of:
    - center circle
    - radius
    - colors
3. Place a selectable square on the image:
    - center of the square
    - side size
    - colors
4. Write the resulting images to a .bmp file

Solution script: [Task01.m][Task01]

|||
|:---:|:---:|
|Original image <br> ![res01]|Adding a rectangular grid <br> ![result01_01]|
|Adding a semi-transparent circle <br> ![result01_02]|Adding a semi-transparent square <br> ![result01_03]|


---
### Task 2
1. Convert original image to:
    - halftone
    - negative
    - grayscale with a specified number of shades of gray
    - palette with a given palette matrix
2. Write the resulting images to a **.jpg** file

Solution script: [Task02.m][Task02]


|||
|:---:|:---:|
|Original image <br> ![res02]|Halftone <br> ![result02_01]|
|Negative image <br> ![result02_02]|Grayscale with a specified number of gradations (N = 10) <br> ![result02_03]|
|Palette image (palette - WINTER) <br> ![result02_04]|


---
[en]: README.md
[ru]: README-ru.md
[Task01]: Task01.m
[Task02]: Task02.m
[res01]: resources/Pic_22_1.bmp
[res02]: resources/Pic_22_2.jpg
[result01_01]: results/lab01_opt07_task01_01.bmp
[result01_02]: results/lab01_opt07_task01_02.bmp
[result01_03]: results/lab01_opt07_task01_03.bmp
[result02_01]: results/lab01_opt07_task02_01.jpg
[result02_02]: results/lab01_opt07_task02_02.jpg
[result02_03]: results/lab01_opt07_task02_03.jpg
[result02_04]: results/lab01_opt07_task02_04.jpg