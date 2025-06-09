library (nnet)

datos= data.frame(
  estudio= c(2, 7, 1, 0, 5, 3, 4, 5, 7),
  sueno= c (10, 7, 15, 3, 5, 2, 8, 7, 7),
  aprueba= c (0, 1, 0, 0, 1, 1, 1, 0, 0)
)

View(datos)

### Escalar los datos/normalizar(solo los predictores)
datos$estudio = scale(datos$estudio)
datos$sueno = scale(datos$sueno)
### como solo estudio y sueno son variables predictoras se aplica con ellos

### Creamos el modelo
## size es el numero de variables
## maxit es el numero de iteraciones o repeticiones que queremos que tenga
## linout es falso por que son numeros binarios(0 y 1)
## decay es un valor regulador en este caso por que es una data pequeña es 0.01

modelo = nnet (aprueba ~ estudio + sueno, data = datos,
               size = 3,
               maxit = 500,
               decay = 0.01,
               linout = FALSE)
print(modelo)

### Hacer predicciones
predicciones = predict(modelo, datos, type = "raw")
print(predicciones)

### Comparar con los valores reales
tabla = table(Predicho = predicciones, Real = datos$aprueba)
print(tabla)
print(modelo)

### Medir precisión (a más iteraciones más data y más presición)
Precision = sum(diag(tabla)) / sum(tabla)
cat("Precisiónn del modelo:", round(Precision * 100, 2), "%\n")