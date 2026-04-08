live_loop :samples do
    with_fx :reverb, room: 0.5, mix: 0.3 do
        with_fx :distortion, distort: 0.3 do
          sample "D:/Almacenamiento del disco C/Descargas/NinaUrqu.wav", rate: 0.7, amp: 15, cutoff: 70, attack: 0.05, release: 8
          sleep 15
        end
    end
end