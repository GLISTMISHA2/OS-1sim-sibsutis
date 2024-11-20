#Вариант 10 лаб 5

cd $HOME
printf "Введите имя подкатолога (начинается с точки): "
read dir_name
printf "Введите имя файла (начинается с точки): "
read file_name

if [ -z "$dir_name" ]; then # -z проверяет является ли строка пустой
    dir_name=".dir"
fi

if [ -z "$file_name" ]; then
    file_name=".file"
fi


if [[ "$dir_name" != .* ]]; then
    dir_name=".$dir_name"
fi
if [[ "$file_name" != .* ]]; then
    file_name=".$file_name"
fi

mkdir $dir_name
touch $dir_name/$file_name
printf "Введите текст который будет введен в файл: "
cat > $dir_name/$file_name
printf "Оглавление подкатолога: " ; ls -l $dir_name
printf "Содержимое файла: " ; cat $dir_name/$file_name

chmod 244 $dir_name/$file_name

printf "Оглавление подкатолога: " ; ls -l $dir_name
printf "Содержимое файла: " ; cat $dir_name/$file_name


