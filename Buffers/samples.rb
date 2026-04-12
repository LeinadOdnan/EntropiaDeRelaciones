baseAddress = "D:/ARTISTA/Composición de canciones/COMPOSICIONES/Entropia de relaciones/composicion-sonicpi/EntropiaDeRelaciones/EntropiaDeRelaciones/externalSamples/"
Samples = [baseAddress + "NinaUrqu.wav", baseAddress + "Qintiy.wav", baseAddress + "Qarquy.wav", baseAddress + "Tuytuy.wav", baseAddress + "Qunqay.wav", baseAddress + "Tikray.wav", baseAddress + "Huchayuq.wav", baseAddress + "Millay.wav", baseAddress + "Qatiy.wav", baseAddress + "Rawi.wav", baseAddress + "Tikray.wav"]

live_loop :samples do
  sync :intro
  fx_sample do
    playSample 2, Samples[0], 15, 8, 11.25
    playSample 2, Samples[1], 12, 9, 11.25
    playSample 1, Samples[2], 18, 11, 15
    playSample 2, Samples[3], 9, 9, 11.25
  end

  sync :puente_1
  fx_sample do
    playSample 3, Samples[4], 12, 9, 12
  end

  sync :puente_2
  fx_sample do
    playSample 6, Samples[5], 15, 9, 12
  end

  sync :puente_3
  fx_sample do
    playSample 6, Samples[6], 15, 11, 12
  end

end