ISR <- function(sueldo){
  # Lectura de valores 2017 para calcular ISR
  dfisr <- readRDS(file = 'isr.rds')
  
  # Asignar niveles de sueldo de acuerdo a tabla isr
  niveles <- cut(sueldo,
                 breaks = c(dfisr$limInf,Inf), 
                 labels = dfisr$nivel, 
                 right = FALSE)
  
  # Calculo de ISR ---------------------------
  (sueldo - dfisr[niveles,'limInf']) * dfisr[niveles,'percExcedente'] + dfisr[niveles,'cuotaFija']
}
