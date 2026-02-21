use_bpm 120

#sync :verso_2
live_loop :lead_loop do
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
end

live_loop :percucion_loop do
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
end

live_loop :bajo_loop do
  use_synth :tb303
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
end

live_loop :pad_loop do
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
end
