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
#-------------------------- Ejercicios ----------------------------
#------------------------------------------------------------------

def function(a, b, c):
    if a>b and a>c:
        print(a)
    elif b>a and b>c:
        print(b)
    elif c>a and c>b:
        print(c)

#print(function(34,5,10))

#------------------------------------------------------------------
#-------------------------- WHILE----------------------------------
#------------------------------------------------------------------

def bucle(cant):
    i = 0
    while i <=cant:
        i+=1
        print(cant)

##bucle(10)

def bucle_mult(cant):
    i = 1
    while i <=cant:
        i*=2
        print(i)
        
#bucle_mult(10)

def cuadrados_entero():
    i = 1
    while i <=10:
        print(i**2)
        i+=1
        
#cuadrados_entero()

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

#------------------------
#multiplos de 2----------- 
#------------------------
def forfunction():
    for x in range(1,7):
        print(x*2)    
##forfunction()

#------------------------
#tabla dimensioens----------- 
#------------------------

def forfunctiondim():
    fila = ''
    for x in range(1,11):
        for y in range(1,7):
            fila = fila + str(x*y) + ' '
        print(fila)
        fila='' 

def forfunctiondim2():
    for x in range(1,11):
        for y in range(1,7):
            print(x*y,'\t')
        print('\n') 

#forfunctiondim2()

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


#--1--Elementos divisibles entre 2 ---------
def ele_div_2(lista):
    a=0
    i=len(lista)-1
    while a<i:
        if lista[a]%2==0:
            print(lista[a]) 
        a+=1
#ele_div_2([1,2,3,4,5,6,7,8])

#-------Elementos suma ---------
def ele_siu(lista):
    suma=0
    for x in lista:
        suma+=x
    return suma
#print(ele_siu([1,2,3,4,5,6,7,8]))

#----Elementos suma ---------
def ele_siu(lista):
    suma=0
    for x in lista:
        suma+=x
    return suma
#print(ele_siu([1,2,3,4,5,6,7,8]))

#----Elementos suma pos pares ---------
def ele_siu_pares(lista):
    suma=0
    for x in range(len(lista)):
        if x%2 == 0:
            suma+=lista[x]
    return suma
#print(ele_siu_pares([1,2,3,4,5,6,7,8]))

#----Elementos lista de listas ---------
def ele_siu_lista_lista(lista):
    lista1= lista[0]
    lista1= lista1[0]
    lista2= lista[0]
    lista2= lista2[1]
    print(lista1,',',lista2)
#ele_siu_lista_lista([[1,2,3,4,],[5,6,7,8],[9,10,11,12]])

def ele_siu_lista_lista(lista, pos_x, pos_y):
    print(lista[pos_x][pos_y])
#ele_siu_lista_lista([[1,2,3,4],[5,6,7,8],[9,10,11,12]], 1,2)

#--3--Elementos lista de listas ---------
def ele_siu_lista_lista_1(lista):
    for x in range(len(lista)):
        for y in range(len(lista[x])):
            if x == y:
                 print(lista[x][y])
#ele_siu_lista_lista_1([[1,2,3,4],[5,6,7,8],[9,10,11,12]])

#---4- dos primeros caracteres ---------
def ele_siu_caracteres(caracteres):
    #print(caracteres[0],caracteres[1])
    #print(caracteres[-3],caracteres[-2],caracteres[-1])
    for x in range(0,len(caracteres),2):
        print(caracteres[x])
#ele_siu_caracteres('Andre')

#---5-- dos primeros caracteres ---------
#---5-1 dos primeros caracteres ---------
def ele_siu_caracteres_two(lista1, lista2):
    nueva_lista =[]
    for x in range(len(lista1)):
        if x%2==0:
            nueva_lista=nueva_lista + [lista1[x]]
        if x%2==1:
            nueva_lista=nueva_lista + [lista2[x]]
    return nueva_lista
#print(ele_siu_caracteres_two([1,2,3,4],[5,6,7,8]))

#---5-1 dos primeros caracteres ---------
def ele_siu_caracteres_two(lista1, lista2):
    nueva_lista =[]
    for x in range(len(lista1)):
        if x%2==0:
            nueva_lista.append( lista1[x])
        if x%2==1:
            nueva_lista.append( lista2[x])
    return nueva_lista
#print(ele_siu_caracteres_two([1,2,3,4,5],[6,7,8,9,10]))


#---6-1 sumar dos matrices ---------
def sum_dos_matr(matriz1, matriz2):
    matriz_nueva=[]
    matriz_fila=[]

    for x in range(len(matriz1)):
        for y in range(len(matriz1[x])):
           matriz_fila.append(matriz1[x][y] + matriz2[x][y] )
        matriz_nueva.append(matriz_fila)  
    return matriz_nueva

#print(sum_dos_matr([[1,2,3,4,5],[6,7,8,9,10]], [[1,2,3,4,5],[6,7,8,9,10]]))

#---6-2 sumar dos matrices ---------
def sum_dos_matr(matriz1, matriz2):
    matriz_nueva=[]
    matriz_fila=[]

    for x in range(len(matriz1)):
        for y in range(len(matriz1[x])):
           matriz_fila.append(matriz1[x][y] + matriz2[x][y] )
        matriz_nueva.append(matriz_fila)  
    return matriz_nueva

#print(sum_dos_matr([[1,2,3,4,5],[6,7,8,9,10]], [[1,2,3,4,5],[6,7,8,9,10]]))


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

rectangulo(4,4) 

#------------------------------------------------------------------
#-------------------------- CADENAS Y LISTAS KEYS----------------------------------
#------------------------------------------------------------------
'''
def list_keys(list_key):
    for x,y in list_key.copy().items():
        print(x[y])

list_keys({'s':2,'c':3})


    tarea, multiplicar dos matrices
    tarea, ingresar numero o letra y buscar en texto:
    escribir un programa para saber si es palindromo
    '''