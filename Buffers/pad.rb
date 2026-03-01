live_loop :pad do
    use_synth :hollow
    
    sync :intro
    use_synth_defaults attack: 2, sustain: 3, release: 4, amp: 2, cutoff: 70
    with_fx :reverb, room: 0.9, mix: 0.6 do
      11.times do
        play chord(:e3, :minor)
        sleep 7.5
      end
    end
    
    sync :verso_1
    use_synth_defaults amp: 2, attack: 2, release: 6
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        8.times do
          play chord(:e3, :minor), sustain: 6
          sleep 8
        end
      end
    end
    
    sync :puente_1
    use_synth_defaults amp: 3, attack: 4, release: 12
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        2.times do
          play chord(:a3, :minor), sustain: 12
          sleep 18
        end
      end
    end
    
    sync :verso_2
    use_synth_defaults amp: 0.8, attack: 1.2, release: 4
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        5.times do
          play chord(:a3, :minor), sustain: 4
          sleep 18
        end
      end
    end
    
    sync :puente_3
    use_synth_defaults amp: 0.8, attack: 2, release: 6
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        2.times do
          sleep 6
          play chord(:g3, :minor), sustain: 6
          sleep 21
        end
        play chord(:g3, :minor), sustain: 6
        sleep 18
      end
    end
    
    sync :verso_4
    use_synth_defaults amp: 0.8, attack: 2, release: 6
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        play chord(:g3, :minor), sustain: 6
        sleep 27
        play chord(:g3, :minor), sustain: 6
        sleep 18
      end
    end
    
    sync :puente_4
    use_synth_defaults amp: 3, attack: 1, release: 3
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        2.times do
          play chord(:d3, :minor), sustain: 3
          sleep 18
        end
      end
    end
    
    sync :verso_5
    use_synth_defaults amp: 1, attack: 2, release: 12
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 18, mix: 0.3 do
        2.times do
          play chord(:e3, :minor), sustain: 12
          sleep 27
        end
        sleep 18
        sleep 36
      end
    end
    
    sync :verso7
    use_synth :hollow
  use_synth_defaults amp: 1
  with_fx :lpf, cutoff: 75 do
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 18, mix: 0.3 do
        4.times do
          sleep 8
          play chord(:c3, :major) attack: 3, decay: 4, sustain: 0.8, release: 8
          sleep 24   # acompaña todo el ciclo sin delatar el tempo
        end
        sleep 8
        play chord(:c3, :major) attack: 1, decay: 1.3, sustain: 0.3, release: 2.6
        sleep 8
      end
    end
  end
    
  stop
end
  