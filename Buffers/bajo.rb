live_loop :bajo do
    use_synth :tb303

    sync :section_changed
    case get(:section)
    
    when :verso_1
    use_synth_defaults amp: 3, release: 0.4
    with_fx :lpf, cutoff: 60 do
      16.times do
        play :e2; sleep 1.5
        play :g2; sleep 1.5
        play :a2; sleep 1
      end
    end
    
    when :puente_1
    use_synth_defaults amp:7, release: 0.4
    with_fx :lpf, cutoff: 60 do
      4.times do
        play :a2; sleep 2.5
        play :g2; sleep 3.5
        play :e2; sleep 3
      end
    end
    
    when :verso_2
    use_synth_defaults amp: 1.5, release: 0.4
    with_fx :lpf, cutoff: 60 do
      2.times do
        play :a2; sleep 9
        play :g2; sleep 9
        play :e2; sleep 9
      end
      play :a2; sleep 9
      play :g2; sleep 9
    end
    
    when :puente_2
    use_synth_defaults amp: 3, release: 0.4
    with_fx :lpf, cutoff: 60 do
      2.times do
        play :e2; sleep 9
        play :g2; sleep 9
        play :a2; sleep 9
      end
      play :e2; sleep 9
      play :g2; sleep 9
    end
    
    when :verso_3
    use_synth_defaults amp: 3, release: 0.4
    with_fx :lpf, cutoff: 60 do
      4.times do
        play :a2; sleep 2.5
        play :g2; sleep 2.5
        play :e2; sleep 4
      end
    end
    
    when :puente_3
    use_synth_defaults amp: 7, release: 0.4
    with_fx :lpf, cutoff: 60 do
      8.times do
        play :g2; sleep 2.5
        play :d2; sleep 3
        play :e2; sleep 3.5
      end
    end
    
    when :verso_4
    use_synth_defaults amp: 1.5, release: 0.4
    with_fx :lpf, cutoff: 60 do
      play :g2; sleep 9
      play :e2; sleep 9
      play :d2; sleep 9
      play :g2; sleep 9
      play :e2; sleep 9
    end
    
    when :puente_4
    use_synth_defaults amp: 3, release: 0.4
    with_fx :lpf, cutoff: 60 do
      2.times do
        play :d2; sleep 4.5
        play :e2; sleep 4.5
        play :g2; sleep 4.5
        play :a2; sleep 4.5
      end
    end
    
    when :verso_5
    use_synth_defaults amp: 2, release: 0.4
    with_fx :lpf, cutoff: 60 do
      play :e2; sleep 9
      play :g2; sleep 9
      play :a2; sleep 9
      play :b2; sleep 9
      play :e2; sleep 9
      play :g2; sleep 9
      4.times do
        play :e2; sleep 1.5
        play :g2; sleep 1.5
        play :a2; sleep 1.5
        play :b2; sleep 4.5
      end
    end
    
    when :puente_5
    use_synth_defaults amp: 2, release: 0.4
    with_fx :lpf, cutoff: 60 do
      8.times do
        play :e2; sleep 1
        play :g2; sleep 1
        play :a2; sleep 1
        play :g2; sleep 0.5
        play :a2; sleep 0.5
        play :b2; sleep 3.5
      end
    end
    
    when :verso_6
    use_synth_defaults amp: 4.5, release: 0.4
    with_fx :lpf, cutoff: 60 do
      25.times do
        play :e2; sleep 0.5
        play :g2; sleep 0.5
        play :a2; sleep 0.5
        play :g2; sleep 0.5
      end
    end
    
    ##| when :puente_6
    ##| sleep 68
    
    ##| when :verso7
    ##| sleep 144
    
    ##| when :final
    ##| stop

    end
end
  