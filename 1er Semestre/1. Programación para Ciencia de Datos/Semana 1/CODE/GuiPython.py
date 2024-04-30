#----------------------
#----- Funcion --------
#----------------------
def function():
    print("a\'")

#----------------------
#----- Strings "" -----
#----------------------
'''
print(type(function()))
print(function()) #Para que salte
print(r'C:\some\name') #Para que no salte 
'''

#----------------------
#Strings con varias lineas
#----------------------
'''print(
"""def funcion()
    exectute
""")'''

#----------------------
#Strings con varias lineas
#----------------------
print('Put several strings within parentheses '
        'to have them joined together.')

#----------------------
#Comentar varias lineas
#----------------------
'''
print('Put several strings within parentheses '
        'to have them joined together.')
    
            '''

#------------------------
#Get Character Positions  
#------------------------
def funcionGetPosition(character, pos):
    return character[pos]
#print('funcionGetPosition', funcionGetPosition('Andre', 0))


#------------------------------------------------------------------
#-------------------------- WHILE----------------------------------
#------------------------------------------------------------------

def bucle(cant):
    i = 0
    while i <=cant:
        i+=1
        print(cant)

##bucle(10)

#------------------------------------------------------------------
#-------------------------- FOR ----------------------------------
#------------------------------------------------------------------

#------------------------
#Range ------------------ 
#------------------------

def forfunction():
    for x in range(5,9):
        print(x) 
#forfunction()


#------------------------------------------------------------------
#-------------------------- CADENAS Y LISTAS ----------------------------------
#------------------------------------------------------------------
cadena = 'programacion'
#print(cadena[0:4])

lista = [1,[3,4],3,4]
#print(lista[0:2])

#----Elementos posicion pares ---------
def ele_pos_pares(lista):
    a=0
    i=len(lista)-1
    while a<i:
        if a%2==0:
            print(lista[a])
        a+=1
#ele_pos_pares([1,2,3,4,5,6,7,8])

#------------------------------------------------------------------
#-------------------------- Funciones----------------------------------
#------------------------------------------------------------------


def rectangulo(b,a):
    fila=''
    for x in range(a):
        for y in range(b):
            fila=fila+'*'
        print(fila)
        fila=''

#rectangulo(4,4) 

#----Funciones con N argumentos ---------
def muchos_arg(*arg, sep='/'):
    #print(arg, end=' ')
    return sep.join(arg)

#muchos_arg('A','B','C')

#------------------------------------------------------------------
#-------------------------- CLASES ----------------------------
#------------------------------------------------------------------
class fraccion:
    def __init__(self, arriba, abajo):
        self.num = arriba
        self.dem = abajo
    
    def mostrar(Self):
        print(Self.num,'/',Self.dem)
    
    def dividir(self):
        pass

#f = fraccion(3,4)
#f.mostrar()

class punto:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def mostrar(Self):
        print(Self.x,',',Self.y)
    
def main():
    esq =punto(4,3)
    esq.mostrar()

class rectangulo:
    def __init__(self, witdh, high, punto):
        self.witdh = witdh
        self.high = high
        self.punto = punto
    
    def mostrar(Self):
        print(Self.witdh,',',Self.high, ',', Self.punto.x, ',', Self.punto.y)

    def punto_centro(self, punto_n):
        a= self.punto.x + self.witdh/2
        b= self.punto.y + self.high/2
        punto_n.x = a
        punto_n.y = b
        return punto_n
    
    def esquinas(self, punto_2, punto_3, punto_4):
        punto_2.x= self.punto.x
        punto_2.y= self.punto.y + self.high
        punto_3.x= self.punto.x + self.witdh
        punto_3.y= self.punto.y + self.high
        punto_4.x= self.punto.x + self.witdh
        punto_4.y= self.punto.y 
        
        
        
        
def main():
    esq =rectangulo(4,4,punto(5,6))
    punto2= punto
    punto3= punto
    punto4= punto
    #print((esq.punto_centro(punto)).x, (esq.punto_centro(punto)).y )
    esq.esquinas(punto2, punto3, punto4)
    print(esq.punto.x,',', esq.punto.y ,' ',
          punto2.x,',', punto2.y ,' ',
          punto3.x,',', punto3.y ,' ', 
          punto4.x,',', punto4.y ,' ' )
#main()

#------------------------------------------------------------------
#-------------------------- MATCH ---------------------------------
#------------------------------------------------------------------

def cases(estado):
    '''
    match estado: #Se necesita version Python 3.10 o mayor
        case 123:
            print(estado, 123)
        case 234:
            print(estado, 234)
        case _:
            print('nada')
    '''

#------------------------------------------------------------------
#----ValueError ---------------------------------------------------
def cases(estado):
        raise ValueError(estado)

cases('Error')


#------------------------------------------------------------------
#----FUNCIONES QUE RECIBEN VARIOS ARGUMENTOS INDEFINIDOS, Y AGUMENTO ---------------------------------------------------