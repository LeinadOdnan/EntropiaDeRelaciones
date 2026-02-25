live_loop :lead do

    define :subintro do
        notes = [:e3, :g3, :a3, :b3, :a3, :g3].shuffle
        rhythm = [1, 1, 1.5, 1, 1.5, 1.5]
        6.times do |i|
          play notes[i]
          sleep rhythm[i]
        end
    end

    sync :intro
    use_synth :prophet
    use_synth_defaults amp: 1.2
    3.times do
      co = line(70, 90, steps: 3).tick
      use_random_seed Time.now.to_i
      rel = rrand(1.5, 2.5)
      use_synth_defaults cutoff: co, release: rel
      subintro
    end
    
    3.times do
      with_fx :compressor, threshold: 0.1, slope_above: 0.1 do
        co = line(90, 40, steps: 3).tick
        use_random_seed Time.now.to_i
        rel = rrand(1.5, 2.5)
        use_synth_defaults cutoff: co, release: rel
        subintro
      end
    end
    
    2.times do
      with_fx :distortion, distort: 0.9 do
        co = line(40, 80, steps: 2).tick
        use_random_seed Time.now.to_i
        rel = rrand(1.5, 2.5)
        use_synth_defaults cutoff: co, release: rel
        subintro
      end
    end
    
    3.times do
      with_fx :reverb, mix: 0.9, room: 0.9 do
        co = line(80, 60, steps: 3).tick
        use_random_seed Time.now.to_i
        rel = rrand(1.5, 2.5)
        use_synth_defaults cutoff: co, release: rel
        subintro
      end
    end
    
    
    sync :verso_1
    use_synth :square
    with_fx :flanger, phase: 2, depth: 3, mix: 0.7 do
      32.times do
        play :e4; sleep 0.5
        play :e4; sleep 0.5
        play :g4; sleep 0.5
        play :a4; sleep 0.5 #dura 2 beats
      end
    end
    
    
    sync :puente_1
    use_synth :dsaw
    with_fx :echo, phase: 4.5, decay: 3, mix: 0.6 do
      8.times do
        co = [50, 70, 90, 70].ring.tick
        use_random_seed Time.now.to_i
        rel1 = rrand(1, 2)
        rel2 = rrand(0.5, 1.5)
        rel3 = rrand(1.5, 2.5)
        use_synth_defaults cutoff: co
        play :a3, release: rel1
        sleep 1.5
        play :g4, release: rel2
        sleep 1
        play :e4, release: rel3
        sleep 2 #duara 4.5 beats
      end
    end
    
    sync :verso_2
    use_synth :prophet
    use_synth_defaults amp: 0.8, sustain: 0, attack_level: 0.3
    with_fx :wobble, phase: 9, cutoff_min: 40, cutoff_max: 100, wave: 0, res: 0.6, mix: 0.6 do
      10.times do
        use_random_seed Time.now.to_i
        atck1 = rrand(0.75, 1.25)
        atck2 = rrand(1.25, 1.75)
        atck3 = rrand(1.75, 2.25)
        rel1 = rrand(3, 5)
        rel2 = rrand(5, 7)
        rel3 = rrand(7, 9)
        play :a4, attack: atck1, release: rel1
        sleep 2
        play :g4, attack: atck2,release: rel2
        sleep 3
        play :e4, attack: atck3,release: rel3
        sleep 4
      end
    end
    
    sync :puente_2
    use_synth :fm
    8.times do
      co = line(40, 100, steps: 8).tick(:co)
      ph = line(9, 3, steps: 8).tick(:ph)
      dep = line(0.15, 0.8, steps: 8).tick(:dep)
      dist = line(0.1, 0.9, steps: 8).tick(:dist)
      use_synth_defaults cutoff: co, amp: 1.2
      with_fx :distortion, distort: dist do
        with_fx :flanger, phase: ph, depth: dep, mix: 0.8 do
          play :e4, release: 3
          sleep 1.5
          play :g4, release: 3
          sleep 1.5
          play :a4, release: 9
          sleep 6
        end
      end
    end
    
    sync :verso_3
    use_synth :fm
    use_synth_defaults amp: 1.2
    with_fx :compressor, threshold: 0.5, slope_above: 0.5 do
      with_fx :distortion, distort: 0.8 do
        4.times do
          rel1 = rrand(2, 3)
          rel2 = rrand(3.5, 4.5)
          dec1 = rrand(1, 1.5)
          dec2 = rrand(1.75, 2.25)
          play :b4, release: rel1, decay: dec1
          sleep 2.5
          play :a4, release: rel1, decay: dec1
          sleep 2.5
          play :g4, release: rel2, decay: dec2
          sleep 4
        end
      end
    end
    
    sync :puente_3
    use_synth :fm
    8.times do
      co = line(100, 40, steps: 8).tick(:co)
      ph = line(3, 9, steps: 8).tick(:ph)
      dep = line(0.8, 0.15, steps: 8).tick(:dep)
      dist = line(0.9, 0.1, steps: 8).tick(:dist)
      
      att1 = line(0.75, 3, steps: 8).tick(:att1)
      dec1 = line(0.25, 1, steps: 8).tick(:dec1)
      rel1 = line(0.5, 2, steps: 8).tick(:rel1)
      att2 = line(1.5, 3.75, steps: 8).tick(:att2)
      dec2 = line(0.5, 1.25, steps: 8).tick(:dec2)
      rel2 = line(1, 2.5, steps: 8).tick(:rel2)
      att3 = line(2.25, 4.5, steps: 8).tick(:att3)
      dec3 = line(0.75, 1.5, steps: 8).tick(:dec3)
      rel3 = line(1.5, 3, steps: 8).tick(:rel3)
      use_synth_defaults cutoff: co, amp: 1
      with_fx :distortion, distort: dist do
        with_fx :flanger, phase: ph, depth: dep, mix: 0.8 do
          play :g3, attack: att1, decay: dec1, release: rel1
          sleep 2.5
          play :d4, attack: att2, decay: dec2, release: rel2
          sleep 3
          play :e4, attack: att3, decay: dec3, release: rel3
          sleep 3.5
        end
      end
    end
    
    sync :verso_4
    use_synth :prophet
    use_synth_defaults amp: 0.8, sustain: 0, attack_level: 0.3
    with_fx :wobble, phase: 9, cutoff_min: 40, cutoff_max: 100, wave: 0, res: 0.6, mix: 0.6 do
      5.times do
        use_random_seed Time.now.to_i
        atck1 = rrand(0.45, 0.7)
        atck2 = rrand(1, 1.25)
        rel1 = rrand(4.05, 8.55)
        rel2 = rrand(5.75, 7.75)
        play :g4, attack: atck1, release: rel1 #Añadir un pulse o un snare en este tiempo
        sleep 2.25
        play :e4, attack: atck1, release: rel1
        sleep 2.25
        play :d4, attack: atck2, release: rel2
        sleep 4.5
      end
    end
    
    sync :puente_4
    use_synth :dsaw
    with_fx :echo, phase: 4.5, decay: 3, mix: 0.6 do
      8.times do
        co = [50, 70, 90, 70].ring.tick
        use_synth_defaults cutoff: co, release: 1.25, amp: 1
        play :d4
        sleep 0.75
        play :e4
        sleep 0.75
        play :g4
        sleep 1.25
        play :a4
        sleep 1.75
      end
    end
    
    sync :verso_5
    use_synth :prophet
    12.times do
      amp = line(0.8, 1.2, steps: 12).tick(:amp)
      attlev = line(0.3, 1, steps: 12).tick(:attlev)
      sus = line(1, 0, steps: 12).tick(:sus)
      
      room = line(0.6, 0.1, steps: 12).tick(:room)
      damp = line(0.9, 0.1, steps: 12).tick(:damp)
      mix = line(0.6, 0, steps: 12).tick(:mix)
      
      atck = line(1, 0.01, steps: 12).tick(:atck)
      rel1 = line(4.5, 0.15, steps: 12).tick(:rel1)
      rel2 = line(7.5, 0.45, steps: 12).tick(:rel2)
      use_synth_defaults amp: amp, sustain: 0, attack_level: attlev, attack: atck, cutoff: 80
      with_fx :reverb, room: room, damp: damp, mix: mix do
        play :e4, release: rel1
        sleep 1.5
        play :g4, release: rel1
        sleep 1.5
        play :a4, release: rel1
        sleep 1.5
        play :b4, release: rel2
        sleep 4.5
      end
    end
    
    sync :puente_5
    use_synth :fm
    8.times do
      co = line(40, 100, steps: 8).tick(:co)
      ph = line(7.5, 0.5, steps: 8).tick(:ph)
      dep = line(0.15, 0.8, steps: 8).tick(:dep)
      dist = line(0.1, 0.7, steps: 8).tick(:dist)
      use_synth_defaults cutoff: co, amp: 1.2, release: 0.15
      with_fx :distortion, distort: dist do
        with_fx :flanger, phase: ph, depth: dep, mix: 0.8 do
          play :e4; sleep 1
          play :g4; sleep 1
          play :a4; sleep 1
          play :g4; sleep 0.5
          play :a4; sleep 0.5
          play :b4
          sleep 3.5
        end
      end
    end
    
    sync :verso_6
    use_synth :dsaw
    use_synth_defaults amp: 0.6, release: 0.3, attack: 0.01
    with_fx :hpf, cutoff: 90 do
      with_fx :distortion, distort: 0.8 do
        25.times do
          play :e4; sleep 0.5
          play :g4; sleep 0.5
          play :a4; sleep 0.5
          play :g4; sleep 0.5
        end
      end
    end
    
    sync :puente_6
    use_synth :dsaw
    4.times do
      co = line(100, 80, steps: 4).tick(:co)
      dist = line(0.8, 0.1, steps: 4).tick(:dist)
      
      att = line(0.01, 0.05, steps: 4).tick(:att)
      dec = line(0, 1.5, steps: 4).tick(:dec)
      rel = line(0.3, 3, steps: 4).tick(:rel)
      sl = line(0.5, 8, steps: 4).tick(:sl)
      use_synth_defaults amp: 1, attack: att, decay: dec, release: rel
      with_fx :hpf, cutoff: co do
        with_fx :distortion, distort: dist do
          play :a4
          sleep sl
          play :g4
          sleep sl
          play :e4
          sleep sl
          play :d4
          sleep sl
        end
      end
    end
    
    sync :verso7
    use_synth :piano
    use_synth_defaults cutoff: 80, attack: 0.1, decay: 3, sustain: 0.6, release: 6, amp: 1
    with_fx :reverb, room: 0.85, mix: 0.35 do
      3.times do
        play :c5
        sleep 16
        play :b4
        sleep 16
        play :a4
        sleep 16
      end
    end
    
    sync :final
    use_synth :piano
    sleep_times = [1, 2, 4, 8, 16, 32].ring
    cutoffs     = line(90, 50, steps: 6).ring
    amps        = line(1, 0.3, steps: 6).ring
    mixs        = line(0.5, 0.1, steps: 6).ring
    rooms       = line(0.9, 0.6, steps: 6).ring
    decays = [0.2, 0.8, 2.4, 3, 3, 3]
    
    notes = [:c5, :b4, :a4].ring
    
    6.times do
      st  = sleep_times.tick(:t)
      co  = cutoffs.tick(:c)
      am  = amps.tick(:a)
      mix = mixs.tick(:m)
      rm  = rooms.tick(:r)
      dec = decays.tick(:d)
      
      use_synth_defaults cutoff: co, attack: 0.2, decay: dec, sustain: 0.4, release: st * 0.6, amp: am
      with_fx :reverb, room: rm, mix: mix do
        play notes.tick(:n)
        sleep st
      end
    end
    
  end
  