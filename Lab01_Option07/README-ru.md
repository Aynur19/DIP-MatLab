[<< На главную][main_ru] 

# Курс "Цифровая обработка изображений"
[Read in English][en]

## Лабораторная работа 1. Вариант 7


---
### Задание 1
1. На заданном изображении построить прямоугольную сетку с возможностью выбора следующих параметров сетки:
    - расстояние между линиями 
    - толщина линий
    - цвет линий сетки
2. Поместить на изображении полупрозрачный круг с возможностью выбора: 
    - центра круга
    - радиуса
    - цвета
3. Поместить на изображении квадрат с возможностью выбора: 
    - центра квадрата
    - размера стороны
    - цвета
4. Записать результирующие изображения в файл в формате **.bmp**

Скрипт решения: [Task01.m][Task01]

|||
|:---:|:---:|
|Исходное изображение <br> ![source01]|Добавление прямоугольной сетки <br> ![result01_01]|
|Добавление полупрозрачного круга <br> ![result01_02]|Добавление полупрозрачного квадрата <br> ![result01_03]|


---
### Задание 2
1. Преобразовать исходное изображение в: 
    - полутоновое 
    - негативное 
    - полутоновое с заданным числом градаций серого
    - палитровое с заданной матрицей палитры
2. Записать результирующие изображения в файл в формате **.jpg**

Скрипт решения: [Task02.m][Task02]

|||
|:---:|:---:|
|Исходное изображение <br> ![source02]|Полутоновое изображение <br> ![result02_01]|
|Негативное изображение <br> ![result02_02]|Полутоновое с заданным числом градаций (N = 10) <br> ![result02_03]|
|Палитровое изображение (палитра - WINTER) <br> ![result02_04]|


---
[en]: README.md
[ru]: README-ru.md

[main_en]: ../README.md
[main_ru]: ../README-ru.md

[Task01]: Task01.m
[Task02]: Task02.m

[source01]: resources/Pic_22_1.bmp
[source02]: resources/Pic_22_2.jpg

[result01_01]: results/lab01_opt07_task01_01.bmp
[result01_02]: results/lab01_opt07_task01_02.bmp
[result01_03]: results/lab01_opt07_task01_03.bmp
[result02_01]: results/lab01_opt07_task02_01.jpg
[result02_02]: results/lab01_opt07_task02_02.jpg
[result02_03]: results/lab01_opt07_task02_03.jpg
[result02_04]: results/lab01_opt07_task02_04.jpg