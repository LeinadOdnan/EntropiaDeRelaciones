#FUNCIONES
define :b do |beats| #para resolucion de 0.5 beats
  return beats * 2
end

#Compaces/ notas
define :subintro do
  notes = [:e3, :g3, :a3, :b3, :a3, :g3].shuffle
  rhythm = [1, 1, 1.5, 1, 1.5, 1.5]
  6.times do |i|
    play notes[i]
    sleep rhythm[i]
  end
end

#CLOCK (heart)
live_loop :clock do
  #use_bpm 120
  cue :tickClock
  sleep 0.5
end

#STRUCTURE
live_loop :estructura do
  sync :tickClock
  case tickClock
  
    sleep b(20) #Tiempo de espera para que corran los otros buffers

    cue :intro
    sleep b(82.5)   # duración real del intro
  
    cue :verso_1
    sleep b(64)
    
    cue :puente_1
    sleep b(36)
    
    cue :verso_2
    sleep b(90)
    
    cue :puente_2
    sleep b(72)
    
    cue :verso_3
    sleep b(36)
    
    cue :puente_3
    sleep b(72)
    
    cue :verso_4
    sleep b(45)
    
    cue :puente_4
    sleep b(36)
    
    cue :verso_5
    sleep b(108)
    
    cue :puente_5
    sleep b(60)
    
    cue :verso_6
    sleep b(50)
    
    cue :puente_6
    sleep b(68)
    
    cue :verso7
    sleep b(144)
    
    cue :final
    sleep b(63)
    
    stop
  end