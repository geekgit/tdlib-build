# tdlib-build
Скрипты для сборки [TDLib](https://github.com/tdlib/td).

## Содержание
- [Системные требования](https://github.com/geekgit/tdlib-build/blob/master/README.md#%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%BD%D1%8B%D0%B5-%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
- [Сборка Linux-версии](https://github.com/geekgit/tdlib-build/blob/master/README.md#%D0%A1%D0%B1%D0%BE%D1%80%D0%BA%D0%B0-linux-%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8)
- [Сборка Windows-версии](https://github.com/geekgit/tdlib-build/blob/master/README.md#%D0%A1%D0%B1%D0%BE%D1%80%D0%BA%D0%B0-windows-%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8)

## Системные требования
Для сборки Linux-версии подходят Windows 10 Pro + Hyper-V и сам Linux.

Для сборки Windows-версии подходит только Windows, на Linux собрать нельзя.

## Сборка Linux-версии

Требуется Docker.

Клонируем текущий репозиторий через `git clone https://github.com/geekgit/tdlib-build`, затем заходим в директорию linux.

Для сборки Linux-версии под хостом с Windows выполняем:
```
.\build.ps1
```

Для сборки Linux-версии под хостом с Linux выполняем:
```
chmod +x build.sh

.\build.sh
```

В Windows билд будет в архиве tdlib.7z в папке `Мои Документы\tdlib_build_docker-share`, под Linux надо смотреть `~\tdlib_build_docker-share`

## Сборка Windows-версии
Требуется Visual Studio 2015 Community или Visual Studio 2017 Community.
И еще: 
* chocolatelyget
* git версии 2.16.2+
* cmake
* gperf
* vcpkg
* пакеты `openssl:x64-windows`, `openssl:x86-windows` `zlib:x64-windows`, `zlib:x86-windows` для vcpkg

Для установки зависимостей можно воспользоваться скриптами `0*.ps1` и `1*.ps1`

Сборка 32 бит версии производится через скрипты в папке `32bit`

Сборка 64 бит версии производится через скрипты в папке `64bit`

Сборка C# версии производится через скрипты в папке `csharp`


