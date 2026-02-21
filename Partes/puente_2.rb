use_bpm 120
#sync :puente_2
live_loop :lead_loop do
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
end

live_loop :percucion_loop do
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    4.times do
      sample :bd_haus, amp: 1.2
      sleep 9
      
      sample :elec_snare, amp: 1 if spread(2,4).tick
      sleep 3
      
      sample :drum_cymbal_closed, amp: 2, rate: 1.5 if spread(3,8).look
      sleep 6
    end
  end
end

live_loop :bajo_loop do
  use_synth :tb303
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
end
