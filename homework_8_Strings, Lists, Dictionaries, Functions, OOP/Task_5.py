nums = [2, 7, 11, 15]
target = 9



def two_sum(nums, target):
    passed = {}  # Словарь для хранения пройденных элементов и их индексов
    for i, num in enumerate(nums):
        complement = target - num
        if complement in passed:# Найдена пара, возвращаем индексы
            return [passed[complement], i]
        # Иначе добавляем текущее число и его индекс в словарь
        passed[num] = i
    # Если пара не найдена
    return []

print(two_sum(nums, target)) 


nums = [3, 2, 4]
target = 6

print(two_sum(nums, target)) 