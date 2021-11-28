[<< To main][main_en] 

# Course "Digital Image Processing"
[Read in Russian][ru]

## Laboratory work 1. Option 1

---
### Task 1
1. Create an image on a dark gray background, 400x400 pixels in size.
2. Place a 40 px magenta circle in the center of the created image.
3. In the upper left corner of the image, place a 50x50 px yellow square centered at the point (100, 100).
4. In the upper right corner of the image, place an equilateral triangle with sides of 50 pixels. The color of the triangle is green, the center of its location is at the point (100, 300).
5. Write the resulting images to a **.jpg** file.

Solution script: [Task01.m][Task01]

|||
|:---:|:---:|
|Gray square <br> ![result01_01]| Adding a purple circle <br> ![result01_02]|
|Adding a yellow square <br> ![result01_03]| Adding a green triangle <br> ![result01_04]|


---
### Task 2
1. There are two images ***Pic_12_1.jpg*** and ***Pic_12_2.jpg***. Create a composition of two specified images so that you can change the brightness of one image relative to the other.
2. Write the resulting image to a **.jpg** file.

Solution script: [Task02.m][Task02]

|||
|:---:|:---:|
|Original Image 1 <br> ![source01]| Original Image 2 <br> ![source02]|
|Composition of two images <br> ![result02_01]|


---
[en]: README.md
[ru]: README-ru.md

[main_en]: ../README.md
[main_ru]: ../README-ru.md

[Task01]: Task01.m
[Task02]: Task02.m

[source01]: resources/Pic_12_1.jpg
[source02]: resources/Pic_12_2.jpg

[result01_01]: results/lab01_opt01_task01_01.jpg
[result01_02]: results/lab01_opt01_task01_02.jpg
[result01_03]: results/lab01_opt01_task01_03.jpg
[result01_04]: results/lab01_opt01_task01_04.jpg
[result02_01]: results/lab01_opt01_task02_01.jpg