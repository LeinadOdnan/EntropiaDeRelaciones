use_bpm 120

#sync :verso_6
live_loop :lead_loop do
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
end

live_loop :percucion_loop do
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
end

live_loop :bajo_loop do
  use_synth :tb303
  use_synth_defaults amp: 4.5, release: 0.4
  with_fx :lpf, cutoff: 60 do
    25.times do
      play :e2; sleep 0.5
      play :g2; sleep 0.5
      play :a2; sleep 0.5
      play :g2; sleep 0.5
    end
  end
end
