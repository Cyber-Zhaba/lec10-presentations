# Презентация по 10-ой лекции курса "Основы информатики"

| Сборка (ветка dev) | Сборка (ветка master) | Последняя версия |
|:------------------:|:---------------------:|:----------------:|
| [![Build Presentation PDF](https://github.com/Cyber-Zhaba/lec10-presentations/actions/workflows/build.yml/badge.svg?branch=dev)](https://github.com/Cyber-Zhaba/lec10-presentations/actions/workflows/build.yml) | [![Build Presentation PDF](https://github.com/Cyber-Zhaba/lec10-presentations/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/Cyber-Zhaba/lec10-presentations/actions/workflows/build.yml) | [![Latest Release](https://img.shields.io/github/v/release/Cyber-Zhaba/lec10-presentations?label=Последняя%20версия)](https://github.com/Cyber-Zhaba/lec10-presentations/releases/latest) |

## Скачать последнюю презентацию
Последний релиз презентации доступен по ссылке:
- [presentation.pdf](https://github.com/Cyber-Zhaba/lec10-presentations/releases/latest/download/presentation.pdf)

## Сборка локально
Чтобы собрать презентацию самостоятельно, вы можете использовать Nix для воспроизводимой настройки или установить зависимости вручную.

### 1. Nix

```bash
git clone https://github.com/Cyber-Zhaba/lec10-presentations.git
cd lec10-presentations
nix build .#default
```

Презентация будет доступна по пути `./result/presentation.pdf`.

### 2. Ручная установка зависимостей

#### Зависимости
- Пакеты TeX Live: scheme-basic, collection-latexrecommended, collection-latexextra, xetex, collection-langcyrillic, collection-langeuropean, collection-fontsrecommended, collection-fontsextra, fontspec
- Шрифты: Fira Code, Fira Mono, Fira Sans, DejaVu Fonts
- Python 3.12 с Pygments для подсветки синтаксиса
- Bash и Fontconfig для настройки среды

#### Команда сборки
```bash
xelatex -shell-escape -interaction=nonstopmode presentation.tex
```
