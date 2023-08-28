# Empanadas Giménez

<img src="img/empanadasGimenez.png" height="200" width="300">

## Planteo inicial

En "Empanadas Giménez", un modesto local de delivery de empanadas, tenemos dos empleados:

* Galván, el empleado de siempre, que cobra un sueldo fijo. El valor arranca en $ 150.000, y después puede cambiar mes a mes.
* Baigorria, el joven y explotado empleado de Giménez, que cobra en base a la cantidad de empanadas vendidas (actualmente $ 150 por empanada).

El dueño, el señor Giménez, es el encargado de pagarle el sueldo a los empleados, y de gestionar el dinero que se utiliza para esto. Asumimos que Giménez arranca con un fondo para sueldos de $ 3.000.000. Como los sueldos salen de este fondo, hay que descontar el importe correspondiente cuando Giménez le paga a un empleado.

Por ahora no vamos a tener en cuenta qué hace cada empleado al recibir el dinero, el único efecto que nos interesa del pago es que disminuye el fondo de Giménez.


<br>

## Qué hacen los empleados con lo que cobran

Se modifica el método pagarA(empleado) de Giménez de esta forma

```javascript
method pagarA(empleado) {
    dinero -= empleado.sueldo()
    empleado.cobrarSueldo()
}
```
- probar haciendo que Giménez le pague a Baigorria. Se rompe. ¿Por qué?
- ¿qué método o métodos hay que agregar, en qué objeto u objetos, para que Giménez le pueda pagar el sueldo a cualquiera de los dos empleados?
- agregar esos métodos con el siguiente criterio: Baigorria cuando cobra el sueldo lo suma a un acumulador de todo lo que cobró, agregarle la capacidad de entender el mensaje `totalCobrado()`. Galván no hace nada.


<br>

## Manejo fino de las finanzas de Galván

Modificar el comportamiento de Galván para que maneje sus gastos, el dinero que tiene, y su deuda. Cuando Galván gasta, se descuenta de su dinero, si no le alcanza aumenta la deuda. Cuando cobra un sueldo, Galván paga sus deudas. Si sobra algo, se suma al dinero que tiene. Agregar a Galván la capacidad de entender los mensajes: `gastar(cuanto)`, `totalDeuda()`, `totalDinero()`.

Tener en cuenta este escenario
1. Galván arranca con deuda en 0 y dinero en 0. Su sueldo (que aún no cobró) es de 150000.
2. Galván gasta 40000, `totalDeuda()` debe ser 40000, `totalDinero()` debe ser 0.
3. Galván gasta otros 80000, `totalDeuda()` pasa a 120000, `totalDinero()` sigue en 0.
4. Galván cobra, con los 150000 que recibe paga toda su deuda y le sobran 30000 pesos. Por lo tanto, `totalDeuda()` debe ser 0, y `totalDinero()` debe ser 30000.
5. Galván gasta 250000, cubre 30000 con el dinero que tiene, el resto es deuda. `totalDeuda()` queda en 220000, `totalDinero()` en 0.
6. Galván cobra, tiene que dedicar los 150000 a pagar deudas, y no le alcanza. Ahora, `totalDeuda()` pasa a 70000, y `totalDinero()` a 0.


<br>

# Conceptos vistos en el ejemplo

* Modelar objetos
* Polimorfismo entre Baigorria y Galván.
* Para pensar: ¿qué mensajes entiende cada uno? ¿qué efecto produce al utilizar ambos objetos en el REPL?

