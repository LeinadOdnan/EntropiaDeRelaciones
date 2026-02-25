live_loop :estructura do
    use_bpm 120
    sleep 6

    set :section, :intro
    sleep 82.5   # duración real del intro
    
    set :section, :verso_1
    sleep 64
    
    set :section, :puente_1
    sleep 36
    
    set :section, :verso_2
    sleep 90
    
    set :section, :puente_2
    sleep 72
    
    set :section, :verso_3
    sleep 36
    
    set :section, :puente_3
    sleep 72
    
    set :section, :verso_4
    sleep 45
    
    set :section, :puente_4
    sleep 36
    
    set :section, :verso_5
    sleep 108
    
    set :section, :puente_5
    sleep 60
    
    set :section, :verso_6
    sleep 50
    
    set :section, :puente_6
    sleep 68
    
    set :section, :verso7
    sleep 144
    
    set :section, :final
    sleep 63
    
    stop
  end