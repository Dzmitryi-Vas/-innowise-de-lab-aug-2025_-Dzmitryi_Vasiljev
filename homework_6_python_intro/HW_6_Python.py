# Task 1


print("Как тебя зовут?")
name = input("")
print(f"Привет, {name}! Приятно познакомиться")


# Task 2


print ('Введите длину прямоугольника:')
length = int(input(''))

print ('Введите ширину прямоугольника:')
width = int(input(''))

square = length * width
print (f"Площадь прямоугольника: {square}")



# Task 3

print('Введите температуру в градусах Цельсия:')
temp_C = float(input('')) # Приводим к числовому типу
temp_F = (temp_C * 9) / 5 + 32
print(f"{temp_C}°С это {temp_F}°F") #значок температуры введен с помощью "нажатая клавиша alt" + 0176"


       



# Task 4

print ('Я загадал число от 1 до 5. Попробуй угадать!')

import random
number_PC = random.randint(1, 5)
number_User = int(input (''))

if number_User < number_PC:
       print ('Слишком мало!')
elif number_User > number_PC:
       print ('Слишком много!')
else:
       print ('Ты угадал!')


# Task 5


while True:
    number = input("Введите целое число: ")
    try:
        number = int(number) # Попытка преобразовать в целое число
        if int(number) % 2 == 0:
            print(f"Число {number}-четное")
        elif int(number) != 0:
            print(f"Число {number}-нечетное")
        break # Выход из цикла, если преобразование успешно
    except ValueError:
        print("Ошибка: Введено не целое число. Пожалуйста, попробуйте снова.")


# Task 6

print ('Калькулятор, осуществляющий сложение, вычитание, умножение, деление')
number_1 = input("Введите первое число: ")
try:
    number_1 = float(number_1.replace(',', '.')) #Приводим к единому типу "точка или запятая"
    print(f"Вы ввели число: {number_1}")
except ValueError: # В случае если выражение выше выдает ошибку
    print("Введенные данные не являются числом или имеют некорректный формат.")

number_2 = input("Введите второе число: ")
try:
    number_2 = float(number_2.replace(',', '.'))
    print(f"Вы ввели число: {number_2}")
except ValueError:
    print("Введенные данные не являются числом или имеют некорректный формат.")

user_operator = input ('Введите оператор: ')# ниже "проходим" по каждому введенному оператору, т.е. подставляем формулы

if user_operator == '+':
  sum = number_1 + number_2
  print(f"Результат: {sum}")
elif user_operator == '-':
    difference = number_1 - number_2
    print(f"Результат: {difference}")
elif user_operator == '*':
    multiplication = number_1 * number_2
    print(f"Результат: {multiplication}")
elif user_operator == '/':
    division = number_1 / number_2
    print(f"Результат: {division}")
else:
     # Если преобразование не удалось, выводим сообщение об ошибке
    print("Ошибка: введен некорректный оператор")
