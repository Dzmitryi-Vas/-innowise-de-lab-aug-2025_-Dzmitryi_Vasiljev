
# Task 4_1


scores = [75, 88, -10, 95, 100, -25, 89]
total_score = 0

for score in scores:

    if score < 0:
        continue   #пропускаем отрицательные значения
    total_score += score
    print(f"Добавлен балл {score}")

    if score == 0: #заканчиваем подсчет если дошли до значения ноль
        break
else:
        print ('Все данные обработаны')
print (f"Итоговая сумма баллов: {total_score}")


# Task 4_2


scores = [75, 88, 95, 0, 100] # код тот же, просто задан другой список
total_score = 0

for score in scores:

    if score < 0:
        continue
    total_score += score
    print(f"Добавлен балл {score}")

    if score == 0:
        break
else:
        print ('Все данные обработаны')
print (f"Итоговая сумма баллов: {total_score}")

