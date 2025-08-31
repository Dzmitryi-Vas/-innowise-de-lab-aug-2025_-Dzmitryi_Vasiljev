title = "Python Programming"

print(f"Длина строки: {len (title)}")   # Определяем длину строки
print(f"Седьмой символ: {title[7]}") # Определяем седьмой символ
print(f"Последние три символа: {title[-3:]}") # Находим последние три символа ("двоеточие" в конце -значит все индексы после указанного)

substring = "gram" # Проверяемый текст

if substring in title:
    print(f"Строка '{title}' содержит подстроку '{substring}'")
else:
    print(f"Строка '{title}' не содержит подстроку '{substring}'")


