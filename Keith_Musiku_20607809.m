% Keith Musiku
% egykm8@nottingham.ac.uk
%% PRELIMINARY TASK-ARDUINO AND GIT INSTALLATION
clear 
a=arduino("COM3","Uno");
writeDigitalPin(a,'D11',1)
writeDigitalPin(a,'D11',0)
for i= 1:10
    writeDigitalPin(a,'D11',1)
    pause(0.5)
    writeDigitalPin(a,'D11',0)
    pause(0.5)
end
%% TASK ONE-READ TEMPERATURE DATA,PLOT,AND WRITE TO A LOG FILE




