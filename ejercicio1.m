a=1 ; b=9 ; c=6 ; d=7 ; e=9 ; f=9 ; g=0 ; h=5;
t= 0 : 0.3 : 30; v=exp(-((b+a)/(2*c*(d+e)))*t) .*sin(t);
subplot 121; plot(t,v); title('PLOT');
xlabel('Tiempo[seg]'); ylabel('Volts'); grid;
subplot 122; stem(t,v); title('STEM');
xlabel('Tiempo [seg]'); ylabel('Volts'); grid;