# Практическая работа №1: lakehouse на Iceberg

ФИО: Закарян Эмма Гариковна. Вариант 1 (запрос Q3 TPC-H), масштаб sf1.

Стек: MinIO, PostgreSQL, Lakekeeper (Iceberg REST Catalog), Trino, Superset.
Данные делятся на слои bronze, silver и gold, формат Parquet со сжатием ZSTD.

Масштаб sf1 выбран потому, что в нём около 6 млн строк в самой большой таблице: этого достаточно, чтобы увидеть разницу между кодеками, а запросы при этом выполняются за доли секунды на ноутбуке.

## Как запустить

    docker compose up -d
    docker compose -f docker-compose.yml -f docker-compose.superset.yml up -d --build superset

После запуска нужно вручную создать бакет `lakehouse` в MinIO (http://localhost:9001) и warehouse `lakehouse` в Lakekeeper (http://localhost:8181/ui). Подробности и результаты замеров в файле [отчет.md](отчет.md).

## Структура

- `docker-compose.yml`, `docker-compose.superset.yml`, `Dockerfile.superset`: запуск сервисов
- `trino/catalog/`: настройки каталогов Trino
- `sql/`: скрипты слоёв, тест сжатия, schema evolution и time travel
- `images/`: скриншот Superset

Пароли в конфигах учебные.
