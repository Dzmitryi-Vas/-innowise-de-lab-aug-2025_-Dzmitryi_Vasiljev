# Дано: email = " USER@DOMAIN.COM "
# 1. Очистить и отформатировать до вида: "user@domain.com"
# 2. Разделить на имя пользователя и домен
# 3. Используя f-строку, создать: "Username: user, Domain: domain.com"

email = " USER@DOMAIN.COM "
email = email.strip() # убираем пробелы в начале и конце строки
email = email.lower() # приводим все к нижнему регистру
print (email) # проверяем


email = email.split('@') # Разбиваем строку по символу '@'
user_name = email[0]  # Первая часть - имя пользователя
domain = email[1]    # Вторая часть - домен
print (f"Username: {user_name}, Domain:{domain}")
