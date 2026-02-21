use_bpm 120
#sync :puente_5
live_loop :lead_loop do
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
end

live_loop :percucion_loop do
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
end

live_loop :bajo_loop do
  use_synth :tb303
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
end
