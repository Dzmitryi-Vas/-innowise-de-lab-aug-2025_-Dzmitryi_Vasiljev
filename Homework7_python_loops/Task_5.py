print ('Введите высоту прямоугольника:')
heigth_user = int(input())
print ('Введите ширину прямоугольника:')
width_user = int(input())

for i in range(heigth_user): #проходил циклом "по высоте"
        print('*'*width_user) #вывести символ "*" умноженный (повторенный) на ширину