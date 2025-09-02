# ● Создайте функцию calculate_average_score(), которая будет вычислять средний балл.
# ● Функция должна принимать список оценок scores как обязательный аргумент.
# ● Добавьте опциональный булевый параметр ignore_lowest со значением по умолчанию False.
# ● Если ignore_lowest равен True, функция должна отбросить наименьшую оценку перед вычислением среднего. Если в списке всего одна оценка, отбрасывать её не нужно.
# ● Используя цикл, пройдитесь по списку student_data. 2 раза, первый раз учитывая все оценки, а второй раз отбросив худшие оценки


student_data = [
    {'name': 'Алексей', 'scores': [85, 92, 78, 95]},
    {'name': 'Марина', 'scores': [65, 70, 58, 82]},
    {'name': 'Светлана', 'scores': [98, 95, 100]}
]

def calculate_average_score(scores, ignore_lowest = False):  # создаем функцию и передаем в нее scores и дефолтное значение ignore_lowest = False
    if ignore_lowest and len(scores) > 0: # прописываем ограничение если больше одного значения
        average_score = (sum(scores) - min(scores)) / (len(scores) - 1) # высчитываем средний балл за вычетом наименьшего
        print(f"Средний балл без худшего: {average_score} ")
        return average_score
    else:
        average_score = sum(scores) / len(scores)
        print (f"Средний балл: {average_score}")
        return average_score


for ignore_lowest in (True, False):
    for student in student_data:
        calculate_average_score(student['scores'], ignore_lowest)



   