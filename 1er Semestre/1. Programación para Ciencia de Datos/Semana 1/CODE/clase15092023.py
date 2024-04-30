#------------------------------------------------------------------
#-------------------------- CLASE VIERNES -------------------------
#------------------------------------------------------------------


#---Ejercicio 1-----
def busca_lista_anidada_en_lista(list1, list2):
    array_general=[]
    array_item=[]
    for x in range(len(list2)):
        for y in  range(len(list2[x])):
            for z in  range(len(list1)):    
                if list2[x][y] == list1[z]:
                    array_item.append(list2[x][y])
                    break   
        
        array_general.append(array_item)
        array_item=[]

    print(array_general)
'''
busca_lista_anidada_en_lista([16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0],
                             [[12,18,23,25,45],[7,11,19,24,28],[1,5,8,15,16]]
                             )
'''

#---Ejercicio 2-----
def cadenas_longitud_menor_n(lista, n):
    array_general=[]
    array_item=[]
    for x in range(len(lista)):
        for y in  range(len(lista[x])):   
            if len(lista[x][y])<n: 
                array_item.append(y)       
        array_general.append(array_item)
        array_item=[]

    print(array_general)

'''
cadenas_longitud_menor_n([['Mercurio', 'Venus', 'Tierra'], ['Marte','Jupiter','Saturno'],
                             ['Urano','Neptuno']], 6)
'''

#-------------------------------------------------------------------------------------
#-------------------------- PROGRAMACION ORIENTADA A OBJETOS -------------------------
#-------------------------------------------------------------------------------------

class fraccion:
    def __init__(self, arriba, abajo):
        self.num= arriba
        self.den= abajo

    def mostrar(Self):
        print(Self.num, '/', Self.den)

def main():
    valor = fraccion(4,5)
    valor.mostrar()

#main()

#-------------------------------------------------------------------------------------
#-------------------------- COPIAR FUERA DE MEMORIA...................................
#.copy()

#-------------------------------------------------------------------------------------
#-------------------------- SOBRECARGA DE OPERADORERS---------------------------------


class punto:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return '({0},{1})'.format(self.x, self.y)
    
    def __add__(self, other):
        return punto(self.x + other.x, self.y + other.y)
    
    ##def __reduce__(self, other):
    ##    return punto(self.x - other.x, self.y - other.y) 
    
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y  
def main():
    p1 = punto(1,4)
    p2 = punto(4,5)
    p3 = p1 + p2
    ##p4 = p1 - p2
    print(p3)

#main()

#-------------------------------------------------------------------------------------
#-------------------------- HERENCIA -------------------------------------------------
class Vehiculo():
    def __init__(self, color, ruedas):
        self.color =  color
        self.ruedas = ruedas
    
    def __str__(self):
        return 'Color {0},{1} ruedas'.format(self.color, self.ruedas)
    
class Coche(Vehiculo):
    def __init__(self, color, ruedas, velocidad, cilindrada):
        Vehiculo.__init__(self, color, ruedas)
        self.velocidad = velocidad
        self.cilindrada = cilindrada


#-------------------------------------------------------------------------------------
#-------------------------- EJERCICIO ------------------------------------------------

class reloj:
    def __init__(self, hora, minuto, segundo):
        self.hora = hora
        self.minuto = minuto
        self.segundo = segundo
    
    def __str__(self):
        return 'HORA:({0} h: {1} m: {2} s)'.format(self.hora, self.minuto, self.segundo)
    
    def __add__(self, other):
        hora1 =0
        segundo1=0
        minuto1=0
        segundo1 = self.segundo + other.segundo
        if segundo1 >= 60:
            segundo1 = segundo1 - 60
            minuto1 +=1
        minuto1 = minuto1 + self.minuto + other.minuto
        if minuto1 >= 60:
            minuto1 = minuto1 - 60 
            hora1+=1   
        hora1 = hora1 + self.hora + other.hora
        return reloj(hora1, minuto1, segundo1)
    
    def convertirSegundos(self):
        suma = self.hora*36000
        suma = suma + self.minuto*60
        suma = suma * self.segundo
        print('Total Segundos:', suma)

def main():
    reloj1 = reloj(4, 36, 53)
    reloj2 = reloj(6, 32, 16)
    relojsuma= reloj1 + reloj2
    print(relojsuma)
    relojsuma.convertirSegundos()
    
main()