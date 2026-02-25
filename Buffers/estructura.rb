live_loop :estructura do
    use_bpm 120
    sleep 20

    set :section, :intro
    cue :section_changed
    sleep 82.5   # duración real del intro
    
    set :section, :verso_1
    cue :section_changed
    sleep 64
    
    set :section, :puente_1
    cue :section_changed
    sleep 36
    
    set :section, :verso_2
    cue :section_changed
    sleep 90
    
    set :section, :puente_2
    cue :section_changed
    sleep 72
    
    set :section, :verso_3
    cue :section_changed
    sleep 36
    
    set :section, :puente_3
    cue :section_changed
    sleep 72
    
    set :section, :verso_4
    cue :section_changed
    sleep 45
    
    set :section, :puente_4
    cue :section_changed
    sleep 36
    
    set :section, :verso_5
    cue :section_changed
    sleep 108
    
    set :section, :puente_5
    cue :section_changed
    sleep 60
    
    set :section, :verso_6
    cue :section_changed
    sleep 50
    
    set :section, :puente_6
    cue :section_changed
    sleep 68
    
    set :section, :verso7
    cue :section_changed
    sleep 144
    
    set :section, :final
    cue :section_changed
    sleep 63
    
    stop
  end