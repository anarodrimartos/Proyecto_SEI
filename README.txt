Contador decimal en VHDL con divisor de reloj y depuración ILA (Vivado)

Este proyecto implementa un sistema contador decimal (0–9) en VHDL, utilizando un divisor de reloj para generar una frecuencia lenta a partir de un reloj principal de 125 MHz.
El diseño está preparado para ser depurado en Vivado mediante el uso de ILA (Integrated Logic Analyzer), marcando señales internas con la directiva mark_debug.

Descripción general:

El sistema realiza las siguientes funciones: Divide el reloj principal de 125 MHz para generar un reloj lento (~2 Hz), luego implementa un contador decimal que cuenta de 0 a 9 en dondepermite resetear y habilitar/detener el conteo mediante señales externas. Muestra el valor del contador en LEDs y permite observar señales internas en tiempo real usando ILA.

Estructura del proyecto:

-Frequency_top.vhd: Módulo encargado de la división de reloj. Genera una señal de reloj lenta (clk_out) a partir del reloj de entrada. Incluye un genérico para ajustar el divisor del reloj y está pensado para obtener aproximadamente 2 Hz desde 125 MHz.

-Counter_10b.vhd: Contador decimal de 4 bits que cuenta de 0 a 9 y reinicia automáticamente al llegar al máximo.

-Counter_top.vhd: Modulo top del sistema. Integra el divisor de reloj y el contador. Envia la señal de salida a los LEDs.

EL código tiene ya marcado las señales internas con mark_debug para poder visualizarlas con ILA en Vivado.

Uso de ILA en Vivado: El proyecto está preparado para depuración mediante Integrated Logic Analyzer (ILA). Las señales internas relevantes están marcadas con mark_debug. Tras la síntesis e implementación, se puede insertar un core ILA. Permite observar: Reloj dividido, Reset, Enable, Valor del contador. Esto facilita la verificación del funcionamiento del sistema directamente en la FPGA.

Notas adicionales: El diseño asume un reloj de entrada de 125 MHz ya que se utilizó una placa PYNQ.

Para simulaciones, se recomienda reducir el valor del divisor del reloj para acelerar el conteo.
