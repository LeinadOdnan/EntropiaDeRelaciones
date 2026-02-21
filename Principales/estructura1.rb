use_bpm 120

define :subintro do
  notes = [:e3, :g3, :a3, :b3, :a3, :g3].shuffle
  rhythm = [1, 1, 1.5, 1, 1.5, 1.5]
  6.times do |i|
    play notes[i]
    sleep rhythm[i]
  end
end


live_loop :lead do
  
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

live_loop :percusion do
  
  sync :verso_1
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    32.times do
      sample :bd_haus, amp: 1.6
      sleep 1
      
      sample :elec_snare, amp: 1.2 if spread(2,4).tick
      sleep 1
      
      sample :drum_cymbal_closed, amp: 2, rate: 1.5 if spread(3,8).look
    end
  end
  
  sync :puente_1
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    8.times do
      sample :bd_haus, amp: 2
      sleep 2.5
      
      sample :elec_snare, amp: 1.6 if spread(2,4).tick
      sleep 2
      
      sample :drum_cymbal_closed, amp: 3, rate: 1.8 if spread(3,8).look
    end
  end
  
  sync :verso_2
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    4.times do
      sample :bd_haus, amp: 0.8
      sleep 9
      
      sample :elec_snare, amp: 0.6 if spread(2,4).tick
      sleep 5
      
      sample :drum_cymbal_closed, amp: 1, rate: 1.5 if spread(3,8).look
      sleep 4
    end
  end
  
  sync :verso_3
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    8.times do
      sample :drum_cymbal_open, amp: 1.5
      9.times do
        sample :drum_cymbal_hard, amp: 1.5
        sleep 0.5
      end
    end
  end
  
  sync :verso_4
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    2.times do
      sample :bd_haus, amp: 0.8
      sleep 9
      
      sample :elec_snare, amp: 0.6 if spread(2,4).tick
      sleep 4.5
      
      sample :drum_cymbal_closed, amp: 1, rate: 1.5 if spread(3,8).look
      sleep 4.5
    end
    sample :bd_haus, amp: 0.8
    sleep 9
  end
  
  sync :puente_4
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    4.times do
      sample :bd_haus, amp: 0.8
      sleep 4.5
      
      sample :elec_snare, amp: 0.6 if spread(2,4).tick
      sleep 1.5
      
      sample :drum_cymbal_closed, amp: 1, rate: 1.5 if spread(3,8).look
      sleep 3
    end
  end
  
  sync :verso_5
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    3.times do
      sample :bd_haus, amp: 0.8
      sleep 9
      
      sample :elec_snare, amp: 0.6 if spread(2,4).tick
      sleep 4.5
      
      sample :drum_cymbal_closed, amp: 1, rate: 1.5 if spread(3,8).look
      sleep 4.5
    end
    4.times do
      sample :bd_haus, amp: 0.8
      sleep 1.5
      sample :bd_haus, amp: 0.8
      sleep 1.5
      sample :bd_haus, amp: 0.8
      sleep 1.5
      sample :elec_snare, amp: 0.8
      sleep 4.5
    end
  end
  
  sync :puente_5
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    8.times do
      sample :drum_cymbal_closed, amp: 1
      sample :bd_haus, amp: 0.4
      sample :elec_snare, amp: 0.4
      sleep 1
      2.times do
        sample :bd_haus
        sample :elec_snare
        sleep 1
      end
      2.times do
        sample :bd_haus
        sample :elec_snare
        sleep 0.5
      end
      sample :bd_haus
      sample :drum_cymbal_open, amp: 1
      sleep 3.5
    end
  end
  
  sync :verso_6
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    25.times do
      sample :drum_cymbal_closed, amp: 4
      4.times do
        sample :bd_haus, amp: 3
        sample :elec_snare, amp: 1.2
        sleep 0.5
      end
    end
  end
  
  ##| sync :puente_6
  ##| sleep 68
  
  ##| sync :verso7
  ##| sleep 144
  
  ##| sync :final
  ##| stop
end

live_loop :bajo do
  use_synth :tb303
  
  sync :verso_1
  use_synth_defaults amp: 3, release: 0.4
  with_fx :lpf, cutoff: 60 do
    16.times do
      play :e2; sleep 1.5
      play :g2; sleep 1.5
      play :a2; sleep 1
    end
  end
  
  sync :puente_1
  use_synth_defaults amp:7, release: 0.4
  with_fx :lpf, cutoff: 60 do
    4.times do
      play :a2; sleep 2.5
      play :g2; sleep 3.5
      play :e2; sleep 3
    end
  end
  
  sync :verso_2
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
  
  sync :puente_2
  sleep 72
  
  sync :verso_3
  use_synth_defaults amp: 3, release: 0.4
  with_fx :lpf, cutoff: 60 do
    4.times do
      play :a2; sleep 2.5
      play :g2; sleep 2.5
      play :e2; sleep 4
    end
  end
  
  ##| sync :puente_3
  ##| sleep 72
  
  sync :verso_4
  use_synth_defaults amp: 1.5, release: 0.4
  with_fx :lpf, cutoff: 60 do
    play :g2; sleep 9
    play :e2; sleep 9
    play :d2; sleep 9
    play :g2; sleep 9
    play :e2; sleep 9
  end
  
  sync :puente_4
  use_synth_defaults amp: 3, release: 0.4
  with_fx :lpf, cutoff: 60 do
    2.times do
      play :d2; sleep 4.5
      play :e2; sleep 4.5
      play :g2; sleep 4.5
      play :a2; sleep 4.5
    end
  end
  
  sync :verso_5
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
  
  sync :puente_5
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
  
  sync :verso_6
  use_synth_defaults amp: 4.5, release: 0.4
  with_fx :lpf, cutoff: 60 do
    25.times do
      play :e2; sleep 0.5
      play :g2; sleep 0.5
      play :a2; sleep 0.5
      play :g2; sleep 0.5
    end
  end
  
  ##| sync :puente_6
  ##| sleep 68
  
  ##| sync :verso7
  ##| sleep 144
  
  ##| sync :final
  ##| stop
end

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
  use_synth_defaults amp: 0.8, attack: 2, release: 6
  with_fx :reverb, room: 0.9, mix: 0.5 do
    with_fx :wobble, phase: 16, mix: 0.3 do
      2.times do
        play chord(:a3, :minor), sustain: 6
        sleep 27
      end
      play chord(:a3, :minor), sustain: 6
      sleep 18
    end
  end
  
  ##| sync :puente_2
  ##| play chord(:e3, :minor)
  ##| sleep 72
  
  ##| sync :puente_3
  ##| sleep 72
  
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
        play chord(:g3, :minor), sustain: 12
        sleep 27
      end
      sleep 36
    end
  end
  
  
  ##| sync :puente_6
  ##| sleep 68
  
  sync :verso7
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


live_loop :estructura do
  cue :intro
  sleep 82.5   # duración real del intro
  
  cue :verso_1
  sleep 64
  
  cue :puente_1
  sleep 36
  
  cue :verso_2
  sleep 90
  
  cue :puente_2
  sleep 72
  
  cue :verso_3
  sleep 36
  
  cue :puente_3
  sleep 72
  
  cue :verso_4
  sleep 45
  
  cue :puente_4
  sleep 36
  
  cue :verso_5
  sleep 108
  
  cue :puente_5
  sleep 60
  
  cue :verso_6
  sleep 50
  
  cue :puente_6
  sleep 68
  
  cue :verso7
  sleep 144
  
  cue :final
  sleep 63
  
  stop
end


