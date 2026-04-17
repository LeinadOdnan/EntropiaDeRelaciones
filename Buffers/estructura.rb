#Correr los instrumentos primero y a ultimo la estructura.
#use_bpm 120
#Compaces/ notas
define :subintro do
  notes = [:e3, :g3, :a3, :b3, :a3, :g3].shuffle
  rhythm = [1, 1, 1.5, 1, 1.5, 1.5]
  6.times do |i|
    play notes[i]
    sleep rhythm[i]
  end
end

#Effects to samples
define :fx_sample do |&block|
  with_fx :reverb, room: 0.5, mix: 0.3 do
    with_fx :distortion, distort: 0.3 do
      block.call
    end
  end
end

#Play Samples
define :playSample do |numberOfTimes, externalSample, ampVolume, releaseLength, interval|
  numberOfTimes.times do
    sample externalSample, rate: 0.9, amp: ampVolume, cutoff: 100, attack: 0.05, release: releaseLength
    sleep interval
  end
end

#STRUCTURE
live_loop :estructura do
  
  cue :intro
  sync :intro_end #Sync with intruments
  
  cue :verso_1
  sync :verso_1_end
  
  cue :puente_1
  sync :puente_1_end
  
  cue :verso_2
  sync :verso_2_end
  
  cue :puente_2
  sync :puente_2_end
  
  cue :verso_3
  sync :verso_3_end
  
  cue :puente_3
  sync :puente_3_end
  
  cue :verso_4
  sync :verso_4_end
  
  cue :puente_4
  sync :puente_4_end
  
  cue :verso_5
  sync :verso_5_end
  
  cue :puente_5
  sync :puente_5_end
  
  cue :verso_6
  sync :verso_6_end
  
  cue :puente_6
  sync :puente_6_end
  
  cue :verso7
  sync :verso7_end
  
  cue :final
  sync :final_end
  
  stop
end