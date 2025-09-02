# Создайте функцию без параметров show_current_time() — печатает текущие дату и время (используйте модуль datetime).


from datetime import datetime

def show_current_time():
    formatted_datetime = datetime.now()
    print("Текущие дата и время:", formatted_datetime)
   
show_current_time()