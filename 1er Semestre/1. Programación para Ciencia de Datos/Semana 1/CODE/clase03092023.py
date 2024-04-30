import random 
#------------------------------------------------------------------
#-------------------------- Ejercicios ----------------------------
#------------------------------------------------------------------
##funcio que recibe cadena de numero entero, y devuelva una cadena con el numero y separaciones del miles.

def cad_ent(cadena):
    nueva_cadena=''
    x=0
    while x < len(cadena):                 
        if (len(cadena)-x)%3 ==0:
            if x + 2 == len(cadena)-1:
                nueva_cadena= nueva_cadena+cadena[x:x+3]
                x=x+3
                #print(nueva_cadena)
            else:
                nueva_cadena= nueva_cadena+cadena[x:x+3]+'.'
                x=x+3
        else:
            nueva_cadena= nueva_cadena + cadena[x:(len(cadena)-x)%3]+'.'
            x=x + (len(cadena)-x)%3
    return nueva_cadena
       
#print(cad_ent('2113234567890'))

##funcio que recibe cadena de numero entero, y devuelva una cadena con el numero y separaciones del miles.
def generar_matriz(fil, col):
    matriz_nueva=[]
    matriz_fila=[]    
    for x in range(fil):
        for y in range(col):
            matriz_fila.append(random.randint(0, 20) )
        matriz_nueva.append(matriz_fila) 
        matriz_fila=[]
    return matriz_nueva

def matrices_transp(fila,colu):
    matriz_origen = generar_matriz(fila, colu)
    matriz_nueva = [[0 for x in range(fila)] for y in range(colu)]
    
    for x in range(len(matriz_origen)):
        for y in range(len(matriz_origen[x])):
           matriz_nueva[y][x]= matriz_origen[x][y]
           
    return matriz_nueva
    
#print(matrices_transp(4, 3))

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

f = fraccion(3,4)
f.mostrar()
