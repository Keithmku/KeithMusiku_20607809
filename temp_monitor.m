% this function is used to display the temperature values using LEDs that
% are controlled according to measured temperature

function temp_monitor(a)
LEDgreen='D10';
LEDyellow='D11';
LEDred='D12';
 % led setup pins
 configurePin(a,LEDgreen,'DigitalOutput');
 configurePin(a,LEDred,'DigitalOutput');
 configurePin(a,LEDyellow,'DigitalOutput');
 
 while true 
     f=readVoltage(a,'A0');
     temp=(f-0.5)/0.01;
     
     if temp>=18 && temp<=24 %to lighten the green LED
         writeDigitalPin(a,LEDgreen,1);
         writeDigitalPin(a,LEDyellow,0);
        writeDigitalPin(a,LEDred,0);
     elseif temp<18 % to blink yellowled at 0.5s intervals
         writeDigitalPin(a,LEDyellow,1);
         pause(0.25);
         writeDigitalPin(a,LEDyellow,0);
         pause(0.25);
     else 
         writeDigitalPin(a,LEDred,1);
         pause(0.125);
         writeDigitalPin(a,LEDred,0);
         pause(0.125);
     end
    figure;
    time=[];
    temperature=[];
    for t=1:100
        
        time=[time,t];
        temperature=[temperature,temp];
        
        plot(time,temperature,'r')
        xlabel('Time(s)')
        ylabel('Temperature(C)')
        xlim([1,100])
        ylim([5,35])
        drawnow;
        pause(1);
    end



     
 
       
     
 end
end



