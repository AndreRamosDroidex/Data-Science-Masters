#------------------------------------------------------------------
#-------------------------- PRACTICA 01 ---------------------------
#------------------------------------------------------------------

#---------------------------------------------------------------
#-1--Cree la función IMPRIMIR(matriz) , la cual imprima la matriz

def IMPRIMIR(matriz):
    for x in range(len(matriz)):
        for y in range(len(matriz[x])):
           print(matriz[x][y], end=' ')
        print('')   

'''       
IMPRIMIR([[6, 7, 8, 9, 10, 11, 12, 13], [2, 1, 7, 11, 8, 17, 17, 8], [6, 9, 3, 2, 19, 2, 11, 3], [14, 17, 0, 6,
15, 8, 12, 16], [16, 5, 4, 2, 14, 11, 19, 8], [12, 13, 3, 8, 16, 12, 10, 14], [8, 3, 15, 0, 19, 13, 1, 17],
[16, 1, 17, 16, 15, 18, 0, 12]])
'''

#---------------------------------------------------------------
#-2--Cree la función CRECIENTE(matriz)

def CRECIENTE(matriz):
    fils=len(matriz)
    cols=len(matriz[0])
    isi=0 #------contador para cant de consecutivos contados por fila
    ino=0 #------contador para cant de filas que sus posiciones pares no cumplan 
    cant_consec=0 

    #------calcular consecutivos---
    if cols%2 ==0:
       cant_consec= cols/2
    else: cant_consec =int(cols/2)+1
    #--------------------

    for x in range(fils):
        for y in range(cols):
            if y%2==0:
               if y+2<cols:
                if not (matriz[x][y] < matriz[x][y+2]):
                    isi=0
                    ino+=1 
                    break #------Apenas no cumpla el consecutivo siguiente linea
                else: 
                   isi+=1
               
        if isi+1 == cant_consec: #------Apenas haya una fila conn todo consecutivos correctos retornar 1
           print('SI') 
           return 1
         
    if ino == fils: #------si no se enontro consecutivos en alguna fila retornar 0 
        print('NO') 
        return 0
'''       
CRECIENTE( [[1,2,3,4,5], [1,2,3,4,5], [1,1,1,1,1]] )      
CRECIENTE( [[1,1,1,1,1], [5,2,3,4,5], [1,1,1,1,1]] )    
'''

#---------------------------------------------------------------
#-3--Cree la función CANT_VECES(matriz)
def CANT_VECES(matriz):
    fils=len(matriz)
    cols=len(matriz[0])
    array_valores=[] #------guardo los valores no repetido y usarlo recursivamente
    val_contar = 0  #------el valore que se guardara en array_valores=[]
    contador = 0
    repetido  = False  #------ verfificar si es repetido el valor  

    arr_llave=[]
    arr_valore =[]
    print('Listar cant de veces que parece:')  
    for x in range(fils):
        for y in range(cols):
            val_contar = matriz[x][y]
            if len(array_valores) == 0:
                array_valores.append(val_contar)
            
            for ll in range(len(array_valores)):
                if (array_valores[ll] == val_contar) or (array_valores[ll] == val_contar and  len(array_valores) == 1) :
                    repetido = (array_valores[ll] == val_contar) or (array_valores[ll] == val_contar and  len(array_valores) == 1)
                esle: repetido = False

                if array_valores[ll] == val_contar and  len(array_valores) == 1 :
                    repetido = False
                esle: repetido = True

            if not repetido:     
                for x1 in range(fils):
                    for y1 in range(cols):
                        if val_contar == matriz[x1][y1]:
                            contador+=1  
                arr_llave.append(val_contar)
                arr_valore.append(contador)      
                contador=0 
                array_valores.append(val_contar)   
                        
            repetido=False  

    for arr in range(len(arr_llave)):
        print(arr_llave[arr], ' ', 'aparece', ' ', arr_valore[arr], ' ', 'veces' )    
    
    return arr_llave
'''               
CANT_VECES( [[2, 2, 1, 3, 2], 
             [3, 4, 2, 2, 1], 
             [1, 3, 4, 3, 4],
             [2, 3, 2, 4, 2],
             [1, 2, 3, 4, 1]] )

'''


#--------------------------------------------------------------------
#-4-- Cree la función LISTAR(matriz)
#--------------------------------------------------------------------
#---NOTA: USO LA FUNCION ANTERIOR 'CANT_VECES' PARA OBTENER LA LISTA-
#--------------------------------------------------------------------

def LISTAR(matriz):
    array_valores= CANT_VECES(matriz) #USO LA FUNCION ANTERIOR PARA OBTENER LA LISTA
    print('Listar valores de M:')
    for arr in range(len(array_valores)):
        print(array_valores[arr], end=' ')      

'''           
LISTAR( [[2, 2, 1, 3, 2], 
        [3, 4, 2, 2, 1], 
        [1, 3, 4, 3, 4],
        [2, 3, 2, 4, 2],
        [1, 2, 3, 4, 1]] )
'''   

#---------------------------------------------------------------
#-5-- Indicar la suma de los valores de la matriz
def Suma(matriz):
    fils=len(matriz)
    cols=len(matriz[0])
    suma=0
    for x in range(fils):
        for y in range(cols):
            if 6 < x+y < 13:
                suma = suma + matriz[x][y] 
    print('SUMA: ', suma)

'''             
Suma( [[2, 2, 1, 3, 2], 
        [3, 4, 2, 2, 1], 
        [1, 3, 4, 3, 4],
        [2, 3, 2, 4, 2],
        [1, 2, 3, 4, 1]] )
'''    
