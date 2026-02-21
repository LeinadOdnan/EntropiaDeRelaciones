use_bpm 120

#sync :verso_4
live_loop :lead_loop do
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
end

live_loop :percucion_loop do
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
end

live_loop :bajo_loop do
  use_synth :tb303
  use_synth_defaults amp: 1.5, release: 0.4
  with_fx :lpf, cutoff: 60 do
    play :g2; sleep 9
    play :e2; sleep 9
    play :d2; sleep 9
    play :g2; sleep 9
    play :e2; sleep 9
  end
end

live_loop :pad_loop do
  use_synth :hollow
  use_synth_defaults amp: 0.8, attack: 2, release: 6
  with_fx :reverb, room: 0.9, mix: 0.5 do
    with_fx :wobble, phase: 16, mix: 0.3 do
      play chord(:g3, :minor), sustain: 6
      sleep 27
      play chord(:g3, :minor), sustain: 6
      sleep 18
    end
  end
end
