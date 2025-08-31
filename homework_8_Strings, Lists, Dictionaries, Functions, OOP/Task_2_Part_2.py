# Дан повторяющийся код расчёта цены с НДС:
# prices = [1000, 3499, 250]
# nds = 0.20
# print(prices[0] + prices[0] * nds)
# print(prices[1] + prices[1] * nds)
# print(prices[2] + prices[2] * nds)
#
# Задание:
# 1) Вынесите расчёт в функцию add_vat().
# 2) Примените её ко всем элементам списка в цикле и распечатайте итоговые цены, используйте цикл.


prices = [1000, 3499, 250]
nds = 0.20

def add_vat(price, nds):
    total_price = float(price) + float(price) * float(nds) #прописываем формулу расчета итоговой цены с ндс
    return float(total_price)


prices_nds =[add_vat(i,nds) for i in prices] # проходим циклом по списку
print (prices_nds) # выводим результат
