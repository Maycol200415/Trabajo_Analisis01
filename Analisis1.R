equipoA <- c(2, 3, 1, 4, 2, 3, 2, 1, 3, 2)
equipoB <- c(3, 2, 1, 3, 2, 2, 4, 2, 3, 1)
t.test(equipoA, equipoB, method ="True")

antes <- c(7, 6, 5, 6, 7)
despues <- c(8, 7, 8, 8, 9)


# Prueba t pareada
t.test(antes, despues, paired =TRUE)