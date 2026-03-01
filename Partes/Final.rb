use_bpm 120
#sync :final
live_loop :lead_loop do
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

live_loop :pad_loop do
    use_synth :hollow
    use_synth_defaults amp: 1
    with_fx :lpf, cutoff: 75 do
        with_fx :reverb, room: 0.9, mix: 0.5 do
            with_fx :wobble, phase: 18, mix: 0.3 do
                sleep 4
                play chord(:c3, :major), attack: 6, decay: 8, sustain: 1.6, release: 16
                sleep 59  
            end
        end
    end
  end
