[<< На главную][main_ru] 

# Курс "Цифровая обработка изображений"
[Read in English][en]

## Лабораторная работа 4. Фильтрация цифровых сигналов
Вариант 1


---
### Задание 1
1. Сформировать сигнал в виде суммы 3-х гармонических колебаний с частотами **100 Гц, 1 кГц, 10 кГц**.
Длительность сигнала составляет **1 секунда**.
2. Построить спектр результирующего сигнала и определить области всех гармонических составляющих.
3. Создать фильтр, выделяющий только сигнал с частотой **100 Гц**.
4. Построить импульсную и частотную характеристики фильтра.
5. Выполнить *фильтрацию во временной области* путем использования функции свертки сигнала с импульсной характеристикой (ИХ) фильтра.
6. Выполнить *фильтрацию сигнала в частотной области* с помощью операции ДПФ.
7. Сравните результаты фильтрации при использовании обоих способов и проанализируйте сигнал на выходе фильтра.
8. Постройте спектр выходного сигнала.

Скрипт решения: [Task01.m][Task01]

||
|:---:|
|<br>![result01_mixS_01]|
|<br>![result01_mixS_02]|
|<br>![result01_mixS_03]|
|<br>![result01_spectrumMixS_01]|
|<br>![result01_spectrumMixS_02]|
|<br>![result01_spectrumMixS_03]|
|<br>![result01_filterImpulseChar]|
|<br>![result01_filterFrequencyChar]|
|<br>![result01_timeDomainFiltering_01]|
|<br>![result01_timeDomainFiltering_02]|
|<br>![result01_frequencyDomainFiltering_01]|
|<br>![result01_frequencyDomainFiltering_02]|
|<br>![result01_spectrumTimeDomainFiltering_01]|
|<br>![result01_spectrumTimeDomainFiltering_02]|
|<br>![result01_spectrumFrequencyDomainFiltering_01]|
|<br>![result01_spectrumFrequencyDomainFiltering_02]|

---
### Задание 2
Дан аудиофайл **W4_01.wav** с записью голоса, на который наложена помеха.

1. Постройте спектр сигнала и определите частотный состав помехи.
2. Постройте режекторный фильтр, подавляющий все частоты помехи.
3. С помощью полученного фильтра подавите помехи в заданном сигнале и определите голосовую информацию, содержащуюся в заданной аудиозаписи.
4. Постройте спектр отфильтрованного сигнала, сравните его со спектром исходного сигнала и проведите анализ результатов фильтрации.

>**Рекомендация**: Для лучшей фильтрации очень сильной помехи, во много раз превосходящей по мощности полезный сигнал, целесообразно в качестве ЧХ фильтра использовать произведение одной и той же ЧХ РФ на себя (2, 3 или более раз).

Скрипт решения: [Task02.m][Task02]

||
|:---:|
|<br>![result02_noisyAS_01]|
|<br>![result02_noisyAS_02]|
|<br>![result02_noisyAS_03]|
|<br>![result02_spectrumNAS_01]|
|<br>![result02_spectrumNAS_02]|
|<br>![result02_spectrumNAS_03]|
|<br>![result02_filterIC_01]|
|<br>![result02_filterIC_02]|
|<br>![result02_filterFC_01]|
|<br>![result02_filterFC_02]|
|<br>![result02_fdFiltering_01]|
|<br>![result02_spectrumFDF_01]|
|<br>![result02_spectrumFDF_02]|
|<br>![result02_spectrumFDF_03]|


---
[en]: README.md
[ru]: README-ru.md

[main_en]: ../README.md
[main_ru]: ../README-ru.md

[Task01]: Task01.m
[Task02]: Task02.m

[source02_01]: resources/Img3_01_1.jpg

[result01_mixS_01]: results/lab04_opt01_task01_mixSignals_01.png
[result01_mixS_02]: results/lab04_opt01_task01_mixSignals_02.png
[result01_mixS_03]: results/lab04_opt01_task01_mixSignals_03.png

[result01_spectrumMixS_01]: results/lab04_opt01_task01_spectrumMixSignals_01.png
[result01_spectrumMixS_02]: results/lab04_opt01_task01_spectrumMixSignals_02.png
[result01_spectrumMixS_03]: results/lab04_opt01_task01_spectrumMixSignals_03.png

[result01_filterImpulseChar]: results/lab04_opt01_task01_filterImpulseChar_01.png
[result01_filterFrequencyChar]: results/lab04_opt01_task01_filterFrequencyChar_01.png

[result01_timeDomainFiltering_01]: results/lab04_opt01_task01_timeDomainFiltering_01.png
[result01_timeDomainFiltering_02]: results/lab04_opt01_task01_timeDomainFiltering_02.png

[result01_frequencyDomainFiltering_01]: results/lab04_opt01_task01_frequencyDomainFiltering_01.png
[result01_frequencyDomainFiltering_02]: results/lab04_opt01_task01_frequencyDomainFiltering_02.png

[result01_spectrumTimeDomainFiltering_01]: results/lab04_opt01_task01_spectrumTimeDomainFiltering_01.png
[result01_spectrumTimeDomainFiltering_02]: results/lab04_opt01_task01_spectrumTimeDomainFiltering_02.png

[result01_spectrumFrequencyDomainFiltering_01]: results/lab04_opt01_task01_spectrumFrequencyDomainFiltering_01.png
[result01_spectrumFrequencyDomainFiltering_02]: results/lab04_opt01_task01_spectrumFrequencyDomainFiltering_02.png


[result02_noisyAS_01]: results/lab04_opt01_task02_noisyAudioSignal_01.png
[result02_noisyAS_02]: results/lab04_opt01_task02_noisyAudioSignal_02.png
[result02_noisyAS_03]: results/lab04_opt01_task02_noisyAudioSignal_03.png

[result02_spectrumNAS_01]: results/lab04_opt01_task02_spectrumNoisyAudioSignal_01.png
[result02_spectrumNAS_02]: results/lab04_opt01_task02_spectrumNoisyAudioSignal_02.png
[result02_spectrumNAS_03]: results/lab04_opt01_task02_spectrumNoisyAudioSignal_03.png

[result02_filterIC_01]: results/lab04_opt01_task02_filterImpulseChar_01.png
[result02_filterIC_02]: results/lab04_opt01_task02_filterImpulseChar_02.png

[result02_filterFC_01]: results/lab04_opt01_task02_filterFrequencyChar_01.png
[result02_filterFC_02]: results/lab04_opt01_task02_filterFrequencyChar_02.png

[result02_fdFiltering_01]: results/lab04_opt01_task02_frequencyDomainFiltering_01.png

[result02_spectrumFDF_01]: results/lab04_opt01_task02_spectrumFrequencyDoimainFiltering_01.png
[result02_spectrumFDF_02]: results/lab04_opt01_task02_spectrumFrequencyDoimainFiltering_02.png
[result02_spectrumFDF_03]: results/lab04_opt01_task02_spectrumFrequencyDoimainFiltering_03.png
