use_bpm 120
#sync :puente_3
live_loop :lead_loop do
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
end

live_loop :percucion_loop do
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    8.times do
      sample :bd_haus, amp: 3
      18.times do
        sample :elec_snare, amp: 0.6
        sleep 0.5
      end
    end
  end
end

live_loop :bajo_loop do
  use_synth :tb303
  use_synth_defaults amp: 7, release: 0.4
  with_fx :lpf, cutoff: 60 do
    8.times do
      play :g2; sleep 2.5
      play :d2; sleep 3
      play :e2; sleep 3.5
    end
  end
end

live_loop :pad_loop do
  use_synth :hollow
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
end
