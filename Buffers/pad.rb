live_loop :pad do
    use_synth :hollow

    sync :section_changed
    case get(:section)
    
    when :intro
    use_synth_defaults attack: 2, sustain: 3, release: 4, amp: 2, cutoff: 70
    with_fx :reverb, room: 0.9, mix: 0.6 do
      11.times do
        play chord(:e3, :minor)
        sleep 7.5
      end
    end
    
    when :verso_1
    use_synth_defaults amp: 2, attack: 2, release: 6
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        8.times do
          play chord(:e3, :minor), sustain: 6
          sleep 8
        end
      end
    end
    
    when :puente_1
    use_synth_defaults amp: 3, attack: 4, release: 12
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        2.times do
          play chord(:a3, :minor), sustain: 12
          sleep 18
        end
      end
    end
    
    when :verso_2
    use_synth_defaults amp: 0.8, attack: 1.2, release: 4
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        5.times do
          play chord(:a3, :minor), sustain: 4
          sleep 18
        end
      end
    end
    
    when :puente_3
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
    
    when :verso_4
    use_synth_defaults amp: 0.8, attack: 2, release: 6
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        play chord(:g3, :minor), sustain: 6
        sleep 27
        play chord(:g3, :minor), sustain: 6
        sleep 18
      end
    end
    
    when :puente_4
    use_synth_defaults amp: 3, attack: 1, release: 3
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 16, mix: 0.3 do
        2.times do
          play chord(:d3, :minor), sustain: 3
          sleep 18
        end
      end
    end
    
    when :verso_5
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
    
    
    ##| when :puente_6
    ##| sleep 68
    
    when :verso7
    use_synth_defaults attack: 3, decay: 4, sustain: 0.8, release: 8, amp: 1
    with_fx :lpf, cutoff: 75 do
      with_fx :reverb, room: 0.9, mix: 0.5 do
        with_fx :wobble, phase: 18, mix: 0.3 do
          4.times do
            sleep 8
            play chord(:c3, :major)
            sleep 24
          end
          sleep 8
          play chord(:c3, :major)
          sleep 8
        end
      end
    end
    
    stop

    end
end
  