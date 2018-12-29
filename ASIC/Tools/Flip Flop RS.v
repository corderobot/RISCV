//Universidad Galileo
//Rodrigo Cordero
//Kevin Hernandez

//Semi flip flop tipo RS, modificado y ajustado para este procesador.
//Este flip flop ayuda a crear registros iguales al de logisim (Clear para borrar el contenido y guarda todo lo que se le meta)
module flip_flop_RS(clk, enable, set, clear, dataQ);
  input clk, set, clear, enable;
  output dataQ;
  wire aux1, aux2, aux3, aux4, trueSignal, allowWrite, tsn, clearN; //tsn = true signal negado, clearN = clear negado
  
  not(tsn, trueSignal);
  not(clearN, clear);
  
  and(allowWrite, clk, enable);
  and(trueSignal, set, clearN);
  
  nand(aux1, allowWrite, trueSignal);
  nand(aux2, allowWrite, tsn);
  nand(aux3, aux1, aux4);
  nand(aux4, aux2, aux3);
  assign dataQ = aux3;
endmodule
