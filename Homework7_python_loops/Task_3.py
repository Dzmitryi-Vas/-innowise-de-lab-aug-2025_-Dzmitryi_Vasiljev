import random

secret_random = random.randint(1,10) #создаем импортированной функцией рандомное число
user_number = '' #задаем переменную, изначально пустую
while user_number != secret_random: #задаем условие
    print('Угадайте число от 1 до 10:')
    user_number = int(input()) #приводим к числовому типу
    if user_number != secret_random: #делаем "непрерывный цикл" если пользователь до сих пор не угадал число
        print ('Неверно. Попробуйте еще раз')
print ('Поздравляю! Вы угадали число!')



