use_bpm 120

#sync :verso_5
live_loop :lead_loop do
  use_synth :prophet
  10.times do
    amp = line(0.8, 1.2, steps: 10).tick(:amp)
    attlev = line(0.3, 1, steps: 10).tick(:attlev)
    sus = line(1, 0, steps: 10).tick(:sus)
    
    room = line(0.6, 0.1, steps: 10).tick(:room)
    damp = line(0.9, 0.1, steps: 10).tick(:damp)
    mix = line(0.6, 0, steps: 10).tick(:mix)
    
    atck = line(1, 0.01, steps: 10).tick(:atck)
    rel1 = line(4.5, 0.15, steps: 10).tick(:rel1)
    rel2 = line(7.5, 0.45, steps: 10).tick(:rel2)
    
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
end

live_loop :percucion_loop do
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
end

live_loop :bajo_loop do
  use_synth :tb303
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
end

live_loop :pad_loop do
  use_synth :hollow
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
end
