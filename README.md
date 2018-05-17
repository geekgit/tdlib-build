# tdlib-build
Скрипты для сборки tdlib.

## Содержание
- [Системные требования](#Системные-требования)
- [Сборка Linux-версии](#Сборка-Linux-версии)
- [Сборка Windows-версии](#Сборка-Windows-версии)

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

## Сборка Windows-версии
Требуется `Visual Studio 2015 Community` или `Visual Studio 2017 Community`.
И еще: 
* `chocolatelyget`
* `git` версии `2.16.2+`
* `cmake`
* `gperf`
* `vcpkg`
* пакеты `openssl:x64-windows`, `penssl:x86-windows` `zlib:x64-windows`, `zlib:x86-windows` для `vcpkg`

Для установки зависимостей можно воспользоваться скриптами `0*.ps1` и `1*.ps1`

Сборка `TDLib` версии 1.0.0 производится через скрипт `87-build-main-v1.0.0.ps1`

Сборка `TDLib` версии 1.1.0 производится через скрипт `88-build-main-v1.1.0.ps1`

Сборка `TDLib` версии 1.1.1 производится через скрипт `89-build-main-v1.1.1.ps1`

Сборка `TDLib` версии 1.2.0 производится через скрипты `90-build-csharp-v1.2.0.ps1` и `91-build-main-v1.2.0.ps1`

Сборка `TDLib` версии git производится через скрипты `98-build-main-git.ps1` и `99-build-main-git.ps1` или `989-build-main-git-log.ps1` и `999-build-main-git-log.ps1`, если требуется файл с логом.
