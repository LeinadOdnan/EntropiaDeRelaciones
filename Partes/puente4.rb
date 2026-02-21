
use_bpm 120
#sync :puente_4
live_loop :lead_loop do
  use_synth :dsaw
  with_fx :echo, phase: 4.5, decay: 3, mix: 0.6 do
    8.times do
      co = [50, 70, 90, 70].ring.tick
      use_synth_defaults cutoff: co, release: 1.25, amp: 1
      play :d4
      sleep 0.75
      play :e4
      sleep 0.75
      play :g4
      sleep 1.25
      play :a4
      sleep 1.75
    end
  end
end

live_loop :percucion_loop do
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    4.times do
      sample :bd_haus, amp: 0.8
      sleep 4.5
      
      sample :elec_snare, amp: 0.6 if spread(2,4).tick
      sleep 1.5
      
      sample :drum_cymbal_closed, amp: 1, rate: 1.5 if spread(3,8).look
      sleep 3
    end
  end
end

live_loop :bajo_loop do
  use_synth :tb303
  use_synth_defaults amp: 3, release: 0.4
  with_fx :lpf, cutoff: 60 do
    2.times do
      play :d2; sleep 4.5
      play :e2; sleep 4.5
      play :g2; sleep 4.5
      play :a2; sleep 4.5
    end
  end
end

live_loop :pad_loop do
  use_synth :hollow
  use_synth_defaults amp: 3, attack: 1, release: 3
  with_fx :reverb, room: 0.9, mix: 0.5 do
    with_fx :wobble, phase: 16, mix: 0.3 do
      2.times do
        play chord(:d3, :minor), sustain: 3
        sleep 18
      end
    end
  end
end

