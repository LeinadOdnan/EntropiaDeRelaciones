baseAddress = "D:/ARTISTA/Composición de canciones/COMPOSICIONES/Entropia de relaciones/composicion-sonicpi/EntropiaDeRelaciones/EntropiaDeRelaciones/externalSamples/"
Samples = [baseAddress + "NinaUrqu.wav", baseAddress + "Qintiy.wav", baseAddress + "Qarquy.wav", baseAddress + "Tuytuy.wav", baseAddress + "Qunqay.wav", baseAddress + "Tikray.wav", baseAddress + "Huchayuq.wav", baseAddress + "Millay.wav", baseAddress + "Qatiy.wav", baseAddress + "Rawi.wav", baseAddress + "Tikray.wav"]

live_loop :samples do
  sync :intro
  fx_sample do
    playSample 1, Samples[0], 15, 16, 22.5
    playSample 1, Samples[1], 12, 18, 22.5
    playSample 1, Samples[2], 18, 12, 15
    playSample 1, Samples[3], 9, 18, 22.5
  end
  
  sync :puente_1
  fx_sample do
    playSample 2, Samples[4], 12, 18, 18
  end
  
  sync :puente_2
  fx_sample do
    playSample 4, Samples[5], 15, 18, 18
  end
  
  sync :puente_3
  fx_sample do
    playSample 3, Samples[6], 15, 22, 24
  end
  
  sync :puente_4
  fx_sample do
    playSample 2, Samples[7], 9, 16, 18
  end
  
  sync :puente_5
  fx_sample do
    playSample 3, Samples[8], 15, 18, 20
  end
  
  sync :puente_6
  fx_sample do
    playSample 2, Samples[9], 12, 22, 34
  end
  
  sync :final
  fx_sample do
    playSample 1, Samples[10], 9, 18, 30
  end
  
end