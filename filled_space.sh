#!/bin/bash 

# Определение наибольшего потребления дискового пространства
# для определённых папок

# Список директорий для проверки
CHECK_DIRECTORIES="/var/log /tmp /fake"

# Определяем формат даты для имени файла отчёта
DATE=$(date '+%Y%m%d')

# Перенаправляем вывод в файл отчёта
exec > filled_space_$DATE.rpt 

# Заголовок
echo "Крупнейшие потребители дискового пространства"
echo "для директорий $CHECK_DIRECTORIES"

for DIR_CHECK in $CHECK_DIRECTORIES
do
  # Подзаголовок
  echo
  echo "Директория $DIR_CHECK"
  
  if [ -e $DIR_CHECK ]
  then
    
    # Определяем занятое пространство
    du -h $DIR_CHECK 2> /dev/null |
    
    # Сортируем вывод
    sort -rh
    
  else
    echo "Директория $DIR_CHECK не существует"
  fi
done
