start_pid=$1
end_pid=$2

if [ "$start_pid" -gt "$end_pid" ]; then # проверка корректности диапазона PID
    echo "Ошибка: начальный PID должен быть меньше или равен конечному PID."
fi

for pid in $(seq $start_pid $end_pid); do # перебор всех PID в заданном диапазоне
    # получение информации о процессе с помощью команды ps
    process_info=$(ps -p $pid -o comm=,state=,nlwp=,pid=,ppid=)

    if [ -n "$process_info" ]; then # существует ли процесс с данным PID
        # разделение информации на переменные
        read -r command state count pid ppid <<< "$process_info" # передает содержимое process_info в read

        output_file="process_${pid}.txt"
        echo "Название: $command" > "$output_file"
        echo "Состояние: $state" >> "$output_file"
        echo "Количество потоков: $count" >> "$output_file"
        echo "Номер процесса: $pid" >> "$output_file"
        echo "Идентификатор родительского процесса: $ppid" >> "$output_file"

        echo "Информация о процессе $pid записана в файл $output_file"
    fi
done
echo "Сценарий завершен."
