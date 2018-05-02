w = 0 : (pi/200) : pi;
X = exp(j*w) + 2 + 3*exp(-j*w) + 4*exp(-j*2*w) + 5*exp(-j*3*w);
subplot 331; plot(w/pi, abs(X)); grid
xlabel('w/pi [rad/m]'); title('Magnitud')
subplot 332; plot(w/pi, angle(X)/pi); grid
xlabel('w/pi [rad/m]'); title('Angulo/pi [rad]')