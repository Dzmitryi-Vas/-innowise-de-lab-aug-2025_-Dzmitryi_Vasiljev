# Дано: words = ["hello", "world", "python", "code"]
# 1. Создать список длин слов, используя списковое включение
# 2. Создать список слов длиннее 4 символов
# 3. Создать словарь: {слово: длина} для всех слов

words = ["hello", "world", "python", "code"]
length_words = [len(i) for i in words]
print(length_words)

long_words = []
long_words = [i for i in words if len(i)> 4] # составляем список из слов длиннее 4 букв

print(long_words)

dictionary = {}

dictionary = dict(zip(words,length_words)) # используем ранее созданный список длинн слов, и с помощью метода zict() создаем словарь
print(dictionary)