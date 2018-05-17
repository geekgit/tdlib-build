# tdlib-build
Скрипты для сборки tdlib.

## Содержание
- [Системные требования](#Системные-требования)
- [Сборка Linux-версии](#Сборка-Linux-версии)

## Системные требования
Для сборки Linux-версии подходят Windows 10 Pro + Hyper-V и сам Linux.

Для сборки Windows-версии подходит только Windows, на Linux собрать нельзя.

## Сборка Linux-версии

Требуется Docker.

Клонируем текущий репозиторий через git clone https://github.com/geekgit/tdlib-build, затем заходим в директорию linux.

Для сборки Linux-версии под хостом с Windows выполняем:
```
.\build.ps1.
```

Для сборки Linux-версии под хостом с Linux выполняем:
```
chmod +x build.sh

.\build.sh
```

В Windows билд будет в архиве `tdlib.7z` в папке `Мои Документы\tdlib_build_docker-share`, под Linux надо смотреть `~\tdlib_build_docker-share`
