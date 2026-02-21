use_bpm 120

#sync :verso_3
live_loop :lead_loop do
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
end

live_loop :percucion_loop do
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    4.times do
      sample :drum_cymbal_open, amp: 1.5
      18.times do
        sample :drum_cymbal_hard, amp: 1.5
        sleep 0.5
      end
    end
  end
end

live_loop :bajo_loop do
  use_synth :tb303
  use_synth_defaults amp: 3, release: 0.4
  with_fx :lpf, cutoff: 60 do
    4.times do
      play :a2; sleep 2.5
      play :g2; sleep 2.5
      play :e2; sleep 4
    end
  end
end
