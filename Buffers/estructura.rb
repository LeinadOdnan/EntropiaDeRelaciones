#Correr los instrumentos primero y a ultimo la estructura.

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
    sample externalSample, rate: 0.7, amp: ampVolume, cutoff: 70, attack: 0.05, release: releaseLength
    sleep interval
  end
end

#CLOCK (heart)
live_loop :clock do
  #use_bpm 120
  cue :tickClock
  sleep 0.5
end

#STRUCTURE
live_loop :estructura do

  sync :tickClock
  
  cue :intro
  sleep 82.5   # duración real del intro
  
  cue :verso_1
  sleep 64
  
  cue :puente_1
  sleep 36
  
  cue :verso_2
  sleep 90
  
  cue :puente_2
  sleep 72
  
  cue :verso_3
  sleep 36
  
  cue :puente_3
  sleep 72
  
  cue :verso_4
  sleep 45
  
  cue :puente_4
  sleep 36
  
  cue :verso_5
  sleep 108
  
  cue :puente_5
  sleep 60
  
  cue :verso_6
  sleep 50
  
  cue :puente_6
  sleep 68
  
  cue :verso7
  sleep 144
  
  cue :final
  sleep 63
  
  stop
end