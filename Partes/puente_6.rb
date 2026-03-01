use_bpm 120
#sync :puente_6
live_loop :lead_loop do
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
end

live_loop :percucion_loop do
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      4.times do
        slp = line(0.5, 8, steps: 4).tick(:slp)
        sample :drum_cymbal_closed, amp: 3
        4.times do
          sample :bd_haus, amp: 3
          sample :elec_snare, amp: 1.5
          sleep slp
        end
      end
    end
  end
  
live_loop :bajo_loop do
    use_synth :tb303
    use_synth_defaults amp: 4, release: 0.4
    with_fx :lpf, cutoff: 60 do
      4.times do
        slb = line(0.5, 8, steps: 4).tick(:slb)
        play :a2; sleep slb
        play :g2; sleep slb
        play :e2; sleep slb
        play :d2; sleep slb
      end
    end
end
