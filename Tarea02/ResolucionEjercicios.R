# Tarea 02 - https://ciespinosa.github.io/ObjetosR/
# Subir la tarea 2. Subir el archivo tipo .R que contenga el codigo debidamente 
# referenciado y etiquetado. El código deberá tener una sección para generar un 
# reporte usando la función sink que contenga 
# las respuestas de las preguntas planteadas en el ejercicio.

# 1)  Genere un proyecto
# 2) Abra un script y llámele “resolución de ejercicios”.
# 3) Genere una estructura de índices del Script. Esta estructura debería 
# referenciar desde la pregunta 4 hasta el final de las preguntas de este 
# ejercicio.  
# 4) Genere los siguientes vectores:
# 4.1) Un vector con datos de edad de 20 estudiantes puede usar rnorm para 
# generar un vector de pesos con una media de 70kg. Incluya en el mismo 
# vector 20 datos más con una media de 56Kg. Usted defina la desviación.

# Vector pesos 
pesosMedia01 <- rnorm(20, 70, 10)
pesosMedia02 <- rnorm(20, 56, 10)
pesos <-c(pesosMedia01, pesosMedia01)
pesos

# 4.2) Repita el mismo ejercicio pero esta vez de altura. Para los primeros 20 
# estudiantes la altura debe tener una media de 167 cm y el segundo grupo con 
# una media de 150 cm
alturaMedia01 <- rnorm(20, 167, 10)
alturaMedia02 <- rnorm(20, 150, 10)
alturas <-c(alturaMedia01, alturaMedia01)
alturas

# 4.3) Un vector con el género de los estudiantes. Escoja aleatoreamente 40 
# datos de Masculino, Femenino. Use la función sample.
genero <- sample(c("Masculino", "Femenino"), 40, replace = TRUE)
genero

# 4.4) Genere un vector de edades en años de los estudiantes, use rnorm para 
# generar un vector con una media de 25, use la función round para redondear 
# a cero decimales.
edades <- rnorm(40, 25, 10)
edades <- round(edades, digits = 0)
edades

# 4.5) Un vector lógico que contenga que posisión los estudiantes 
# cumplen con ser mayores de 25
edades_mayores <- edades[edades>25]

# Responda:
# ¿Qué tipo de vectores hemos generado? 

typeof(pesos)
typeof(alturas)
typeof(genero)
typeof(edades)

# ¿Cuantos estudiantes mayores a 25 años hay en el aula?
length(edades_mayores)  

# Reporte
sink("respuesta01.txt")
cat("Los tipo de vectores generados son\n")
cat("Pesos, tipo:\t", typeof(pesos), "\n")
cat("Alturas, tipo:\t", typeof(alturas), "\n")
cat("Genero, tipo:\t", typeof(genero), "\n")
cat("Edades, tipo\t", typeof(edades), "\n")
cat("¿Cuantos estudiantes mayores a 25 años hay en el aula?", "\n")
cat(length(edades_mayores))  
sink()
# Fin Reporte
# 5. Genere una lista con el vector de edad y género. Vuelva a convertir en 
# vector. ¿El vector resultante es numérico o carácter? 
# Explique la razón del resultado.

lista_edad_genero <- list(edades, genero)
lista_edad_genero  
# tipo list
typeof(lista_edad_genero)

# pasa la lista a vector
vector_edad_genero <- unlist(lista_edad_genero)

# Reporte
sink("respuesta02.txt")
cat(typeof(vector_edad_genero))
cat("\n\nEl tipo del vector es character; los vectores deben estar 
# compuestos por un solo tipo de elementos, 
# si un vector tiene más de un tipo de elemento estos son coaccionados 
# al tipo más flexible. ")
sink()
# Fin Reporte
# RESPUESTA: El tipo del vector es character; los vectores deben estar 
# compuestos por un solo tipo de elementos, 
# si un vector tiene más de un tipo de elemento estos son coaccionados 
# al tipo más flexible. 

# 6. Genere 3 categorías de edad, entre 18 y 20, entre 20 y 25 y mayores de 25. 
# Nombre a cada categoría; jovenes, adultos y maduros. 
# Para poner el nombre use la función levels para asignar los nombres. 
# Modifique el orden de las categorías para que aparezca primero maduro, 
# luego adulto y finalmente joven.

edades_categorias <- cut(edades, breaks = c(18, 20, 25, max(edades)))
edades_categorias
levels(edades_categorias) <-c("jovenes", "adultos", "maduros")

# modificar categorias
edades_categorias_modificado <- factor(edades_categorias, 
                                        levels = c("maduros","adultos", 
                                                   "jovenes"))
edades_categorias_modificado

# 7.) Genere una matriz con los datos numéricos de los vectores antes 
# generados.

matriz01 <- matrix(c(pesos, alturas, edades), nrow=40, ncol=3)
# Agregar nombre a la columnas
colnames(matriz01) <- c("pesos", "alturas", "edades") 
matriz01

# 8) Genere una data frame con los vectores numéricos y caracteres.

data = data.frame(pesos, alturas, edades, genero)
colnames(data) <- c("Pesos", "Alturas", "Edades", "Genero") 
data

# 9) Convierta el data frame en una matriz y verifique que tipo de elementos 
# constituyen esta matriz. De que tipo son los datos de esta matriz.

data_to_matriz <- data.matrix(data, rownames.force = NA)
data_to_matriz

# Tipo de dato de la matriz es: Double
typeof(data_to_matriz)

# Reporte
sink("respuesta03.txt")
cat("¿De que tipo son los datos de esta matriz?\n")
cat(typeof(data_to_matriz))  
sink()
# Fin Reporte




