use_bpm 120

#sync :verso7
live_loop :lead_loop do
  use_synth :piano
  use_synth_defaults cutoff: 80, attack: 0.1, decay: 3, sustain: 0.6, release: 6, amp: 1.2
  with_fx :reverb, room: 0.85, mix: 0.35 do
    3.times do
      play :c5
      sleep 16
      play :b4
      sleep 16
      play :a4
      sleep 16
    end
  end
end

live_loop :pad_loop do
  use_synth :hollow
  use_synth_defaults attack: 3, decay: 4, sustain: 0.8, release: 8, amp: 1
  with_fx :lpf, cutoff: 75 do
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :wobble, phase: 18, mix: 0.3 do
        4.times do
          sleep 8
          play chord(:c3, :major)
          sleep 24   # acompaña todo el ciclo sin delatar el tempo
        end
        sleep 8
        play chord(:c3, :major)
        sleep 8
      end
    end
  end
end
