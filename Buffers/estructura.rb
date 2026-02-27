#FUNCIONES
define :b do |beats| #para resolucion de 0.5 beats
  return beats * 2
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
  
  when b(20)
    cue :intro

    #sleep b(82.5)   # duración real del intro
  
  when b(20 + 82.5)
    cue :verso_1
    #sleep b(64)
    
    set :section, :puente_1
    cue :section_changed
    sleep b(36)
    
    set :section, :verso_2
    cue :section_changed
    sleep b(90)
    
    set :section, :puente_2
    cue :section_changed
    sleep b(72)
    
    set :section, :verso_3
    cue :section_changed
    sleep b(36)
    
    set :section, :puente_3
    cue :section_changed
    sleep b(72)
    
    set :section, :verso_4
    cue :section_changed
    sleep b(45)
    
    set :section, :puente_4
    cue :section_changed
    sleep b(36)
    
    set :section, :verso_5
    cue :section_changed
    sleep b(108)
    
    set :section, :puente_5
    cue :section_changed
    sleep b(60)
    
    set :section, :verso_6
    cue :section_changed
    sleep b(50)
    
    set :section, :puente_6
    cue :section_changed
    sleep b(68)
    
    set :section, :verso7
    cue :section_changed
    sleep b(144)
    
    set :section, :final
    cue :section_changed
    sleep b(63)
    
    stop
  end