# Task 2

print ('Введите число для обратного отсчета:')
interval = int(input())
for i in range(interval,0, -1): # Мы запускаем счетчик в обратном порядке (шаг -1), от нулевого значения
    print((i),'...')
print ('Go!')