#Вариант 10

cd $HOME
printf "Введите имя подкатолога (начинается с точки) : "
read dir_name
printf "Введите имя файла (начинается с точки) : "
read file_name

if [ -z "$dir_name" ]; then
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

cd $dir_name
rm $file_name
cd
rmdir $dir_name
printf "Все удаленно \n"
