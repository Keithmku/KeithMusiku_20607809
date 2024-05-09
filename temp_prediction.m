% this function predicts the expected temperature after 5minutes and alerts
% when the cabin temperature varies too much( in this case 4C/min)
function temp_prediction(a)

%initial variables
LEDred='D12';
LEDgreen='D10';
LEDyellow='D11';
 
% LED setup
configurePin(a,LEDyellow,'DigitalOutput');
configurePin(a,LEDgreen,'DigitalOutput');
configurePin(a,LEDred,'DigitalOutput');

prev_temp=0;
prev_time=now;

 while true
     r=readVoltage(a,'A0');
     temp=(r-0.5)/0.01; %temperature read from voltage of thermoresistor
     currentTime=now;
     elapsedTime=(currentTime-prev_time)*24*3600;% convert to seconds
     rate_of_change=(temp-prev_temp)/elapsedTime;
     %temperature prediction in 5 minutes
     predictTemp=temp+rate_of_change*300; 

     if rate_of_change>4
         writeDigitalPin(a,LEDred,1);
     elseif rate_of_change<-4
         writeDigitalPin(a,LEDyellow,1);
     else
         writeDigitalPin(a,LEDgreen,1);
     end

     % to print onto screen
      fprintf('Current Temperature: %.2f°C\n', temp);
      fprintf('Predicted Temperature in 5 minutes: %.2f°C\n', predictTemp);
      fprintf('Temperature Change Rate: %.2f°C/s\n\n', rate_of_change);

      prev_temp=temp;
      prev_time=currentTime;

      pause(1)

     
    
 end
end






