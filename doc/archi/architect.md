# Реализация архитектуры

Провайдер данных - источник информации от датчиков или имитаторов, а также файлов. В приложении используется три типа данных - трехмерное облако точек с интенсивностями, углы ориентации(крен, тангаж, истинный курс), геопозиция (широта, долгота, высота).
Архитектура приложения должна позволять выбирать разные типы истоников данных, произвольный формат вывода и отображение текущего состояния. 
Приложение обладает тремя режимами, сигнализируемыми светофором.

 * Красный - не до конца настроены компоненты или появилась ошибка,
 * Желтый - устройства подключены и начался обмен с ними, но запись еще не идет.
 * Зеленый - устройства работают и идет запись в файл, отображается статистика.
 
[Перейти в интерактивную карту](level1.html)

## Уровень контекста

Это самая высокая гранулярность диаграммы. В нем мало деталей, но его главная цель — описать контекст, в котором находится приложение. Таким образом, он будет состоять из одного единого блока для всего приложения, и он будет окружен другими блоками, которые относятся к внешним системам и пользователям, с которыми приложение взаимодействует.

![](level1.png)

## Уровень контейнеров

На этом уровне детализации мы увидим контейнеры приложения, где контейнер — это любая независимая техническая часть приложения, например, мобильное приложение, API или база данных. Он также документирует основные используемые технологии и способ взаимодействия контейнеров.
![](level2.png)

## Уровень компонент

Диаграмма компонентов показывает нам компоненты внутри одного контейнера. В этом контексте каждый компонент является модулем приложения, не ограниченным доменными модулями (т. е. Биллинг, пользователи,…), но также включающим в себя чисто функциональные модули (т. е. Электронная почта, смс,…). Итак, эта диаграмма показывает нам основные шестеренки контейнера и отношения между этими шестернями.
![](level3.png)

## Уровень кода

Основная диаграмма классов:

![](core.png)

Связь главного окна приложения(паттерн Mediator):

![](main.png)

Обмен сообщениями при обработке данных:

![](providers.png)

**Ограничения архитектуры:**

1. Все провайдеры данных наследуются от IDataProvider и находятся в папке dataproviders
2. Все логгеры наследуются от ILogWriter и находятся в папке logwriters
3. Все виджеты независимы от моделей и обмениваются с провайдерами/логгерами через сигналы-слоты
4. Все сигнально-слотовые соединения между реализациями провайдеров/логгеров находятся в главном окне MainWindow
5. Для каждого устройства должен создаваться отдельный поток (QThread) и явно управляться.


### Ссылки

* [Plant uml](http://en.plantuml.com/)
* [C4 model](https://c4model.com/)
* [С4 Plant uml addon](https://github.com/RicardoNiepel/C4-PlantUML)
* [Markdown syntax](https://daringfireball.net/projects/markdown/)
* [Python markdown2](https://github.com/trentm/python-markdown2)