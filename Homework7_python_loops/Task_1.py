# Task 1

shopping_list = ["milk", "bread", "eggs", "butter", "apples"]

print("Список покупок:")
for i, item in enumerate(shopping_list): # Для каждого счетчика цикла функция enumerate вовзвращает его значение, т.е. в нашем случае текст.
    print(i + 1,':', item)