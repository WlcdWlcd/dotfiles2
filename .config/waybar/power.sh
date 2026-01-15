#!/bin/bash

action=$1
total_time=15

# Функции
perform_action() {
    case $action in
        "shutdown") systemctl poweroff ;;
        "reboot") systemctl reboot ;;
        *) echo "Неизвестное действие: $action"; exit 1 ;;
    esac
}

cancel_action() {
    notify-send -t 2000 "Действие отменено" "Выключение/перезагрузка отменена"
    exit 0
}

# Создаем именованный канал для общения с диалогом
PIPE=$(mktemp -u)
mkfifo "$PIPE"
exec 3<>"$PIPE"

# Запускаем диалог
zenity --progress \
    --title="Подтверждение $action" \
    --text="До $action осталось: $total_time секунд" \
    --percentage=0 \
    --auto-close \
    --cancel-label="Отменить" \
    --extra-button="Пропустить" \
    --width=300 <&3 &

pid_zenity=$!

# Функция для очистки и выхода
cleanup() {
    exec 3>&-
    rm -f "$PIPE"
    kill $pid_zenity 2>/dev/null
    exit 0
}

trap cleanup EXIT

# Основной цикл отсчета
for ((i=total_time; i>=0; i--)); do
    # Проверяем, жив ли еще диалог
    if ! kill -0 $pid_zenity 2>/dev/null; then
        # Диалог закрыт, проверяем как
        wait $pid_zenity
        result=$?
        
        case $result in
            0) 
                # Прогресс завершен
                notify-send -t 1000 "Выполняется $action" "Компьютер $action через 3 секунды..."
                sleep 3
                perform_action 
                ;;
            1)
                # Нажата отмена
                cancel_action
                ;;
            *)
                # Другие коды (скорее всего кнопка "Пропустить")
                notify-send -t 1000 "Выполняется $action" "Компьютер $action через 3 секунды..."
                sleep 3
                perform_action
                ;;
        esac
    fi

    # Обновляем прогресс
    percentage=$((100 - (i * 100 / total_time)))
    echo "$percentage"
    echo "# До $action осталось: $i секунд"
    
    # Ждем секунду, но с возможностью прерывания
    for ((j=0; j<10; j++)); do
        sleep 0.1
        # Проверяем, не закрыли ли диалог
        if ! kill -0 $pid_zenity 2>/dev/null; then
            wait $pid_zenity
            result=$?
            
            case $result in
                0) 
                    notify-send -t 1000 "Выполняется $action" "Компьютер $action через 3 секунды..."
                    sleep 3
                    perform_action 
                    ;;
                1) cancel_action ;;
                *) 
                    notify-send -t 1000 "Выполняется $action" "Компьютер $action через 3 секунды..."
                    sleep 3
                    perform_action 
                    ;;
            esac
        fi
    done
done >&3

# Если дошли до конца таймера
notify-send -t 1000 "Выполняется $action" "Компьютер $action через 3 секунды..."
sleep 3
perform_action
