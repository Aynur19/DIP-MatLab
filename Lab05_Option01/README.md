[<< На главную][main_ru] 

# Курс "Цифровая обработка изображений и сигналов"
[Read in English][en]

## Лабораторная работа 5. Цифровая обработка изображений в частотной области. Часть 1
Вариант 1


---
### Задание 1
Исходное изображение представлено в виде двумерной матрицы, записанной в формате ***Matlab*** в файле [***A5_01_1.mat***][source01].
1. Постройте заданное изображение в пространственной области.
2. Вычислите и отобразите на экране его амплитудный и фазовый спектр.
3. Используя свойство преобразования Фурье о сдвиге, выполните сдвиг изображения на 100 пикселей вправо и 100 пикселей вниз путем преобразования спектра в частотной области.
4. Вычислите амплитудный и фазовый спектр сдвинутого изображения. 
5. Отобразите на экране сдвинутое изображение и его спектр.

Проведите анализ и сравнение спектров исходного и сдвинутого изображений. Объясните полученные результаты.

Сохраните все построенные изображения в формате ***.jpg*** для представления в отчете с комментариями.

> **Рекомендация**: При построении амплитудных спектров изображений целесообразно использовать логарифмическое преобразование яркости.

Скрипт решения: [Task01.m][Task01]

|||
|:---:|:---:|
|<br>![task01_imgOrigin]|<br>![task01_imgShifted]|
|<br>![task01_imgOriginAS]|<br>![task01_imgShiftedAS]|
|<br>![task01_imgOriginASL]|<br>![task01_imgShiftedASL]|
|<br>![task01_imgOriginFS]|<br>![task01_imgShiftedFS]|


---
### Задание 2


---
[en]: README.md
[ru]: README-ru.md

[main_en]: ../README.md
[main_ru]: ../README-ru.md

[Task01]: Task01.m

[source01]: resources/A5_01_1.mat

[task01_imgOrigin]: results/lab05_opt01_task01_imgOrigin.jpg
[task01_imgOriginAS]: results/lab05_opt01_task01_imgOriginAS.jpg
[task01_imgOriginASL]: results/lab05_opt01_task01_imgOriginASL.jpg
[task01_imgOriginFS]: results/lab05_opt01_task01_imgOriginFS.jpg

[task01_imgShifted]: results/lab05_opt01_task01_imgShifted.jpg
[task01_imgShiftedAS]: results/lab05_opt01_task01_imgShiftedAS.jpg
[task01_imgShiftedASL]: results/lab05_opt01_task01_imgShiftedASL.jpg
[task01_imgShiftedFS]: results/lab05_opt01_task01_imgShiftedFS.jpg

