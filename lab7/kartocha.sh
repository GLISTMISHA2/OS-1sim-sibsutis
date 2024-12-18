#!/bin/bash

# а) Вывести всю строку параметров, заключенную в двойные кавычки
echo "Вся строка параметров: \"$@\""

# б) Вывести значение первого параметра
echo "Первый параметр: $1"

# Обработка опций с помощью getopts
while getopts "f:t:" OPTION; do
    case "$OPTION" in
        f)
            echo "Обнаружена опция -f"
            ;;
        t)
            FILE="$OPTARG"
            echo "Обнаружена опция -t с параметром: $FILE"
            # г) Проверить, существует ли файл с именем $FILE
            if [ -f "$FILE" ]; then
                echo "Содержимое файла $FILE:"
                cat "$FILE"
            else
                echo "Файл $FILE не существует."
            fi
            ;;
        *)
            echo "Неизвестная опция"
            ;;
    esac
done

# в) Обработка опции -f
if [ "$1" = "-f" ]; then
    echo "Введите команду:"
    read COMMAND
    eval "$COMMAND"
fi
