ard = arduino(); % connect the arduino (sensor acquisition and spectro triggering)
tab_e = etal_vid3(t,ard); % calibration of the sensor (ILD1320-25)
etal.tab_etal = tab_continu(tab_e); % correction of the calibration ( delete false values )
% Show the calibration graph
figure()
hold on
for i = 1 : length(etal.tab_etal)
    scatter(etal.tab_etal(1,i),etal.tab_etal(2,i))
end
xlabel('Hauteur de mesure, en mm')
ylabel('Tension mesuree')
hold off

while(1)
    valeur = lecture_capteur(ard)
    disp(valeur)
end