live_loop :percusion do

    sync :verso_1
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      32.times do
        sample :bd_haus, amp: 1.6
        sleep 1
        
        sample :elec_snare, amp: 1.2 if spread(2,4).tick
        sleep 1
        
        sample :drum_cymbal_closed, amp: 2, rate: 1.5 if spread(3,8).look
      end
    end
    
    sync :puente_1
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      8.times do
        sample :bd_haus, amp: 2
        sleep 2.5
        
        sample :elec_snare, amp: 1.6 if spread(2,4).tick
        sleep 2
        
        sample :drum_cymbal_closed, amp: 3, rate: 1.8 if spread(3,8).look
      end
    end
    
    sync :verso_2
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      5.times do
        sample :bd_haus, amp: 0.8
        sleep 9
        
        sample :elec_snare, amp: 0.6 if spread(2,4).tick
        sleep 5
        
        sample :drum_cymbal_closed, amp: 1, rate: 1.5 if spread(3,8).look
        sleep 4
      end
    end
  
    sync :puente_2
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      4.times do
        sample :bd_haus, amp: 1.2
        sleep 9
        
        sample :elec_snare, amp: 1 if spread(2,4).tick
        sleep 3
        
        sample :drum_cymbal_closed, amp: 2, rate: 1.5 if spread(3,8).look
        sleep 6
      end
    end
    
    sync :verso_3
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      8.times do
        sample :drum_cymbal_open, amp: 1.5
        9.times do
          sample :drum_cymbal_hard, amp: 1.5
          sleep 0.5
        end
      end
    end
  
    sync :puente_3
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      8.times do
        sample :bd_haus, amp: 3
        18.times do
          sample :elec_snare, amp: 0.6
          sleep 0.5
        end
      end
    end
    
    sync :verso_4
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
    
    sync :puente_4
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
    
    sync :verso_5
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      4.times do
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
    
    sync :puente_5
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      8.times do
        sample :drum_cymbal_closed, amp: 1
        sample :bd_haus, amp: 0.4
        sample :elec_snare, amp: 0.4
        sleep 1
        2.times do
          sample :bd_haus
          sample :elec_snare
          sleep 1
        end
        2.times do
          sample :bd_haus
          sample :elec_snare
          sleep 0.5
        end
        sample :bd_haus
        sample :drum_cymbal_open, amp: 1
        sleep 3.5
      end
    end
    
    sync :verso_6
    with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
      25.times do
        sample :drum_cymbal_closed, amp: 4
        4.times do
          sample :bd_haus, amp: 3
          sample :elec_snare, amp: 1.2
          sleep 0.5
        end
      end
    end
    
    ##| sync :puente_6
    ##| sleep 68
    
    ##| sync :verso7
    ##| sleep 144
    
    ##| sync :final
    ##| stop

  end
end
  