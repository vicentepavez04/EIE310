w= 0 : (pi/2000) : pi;
nl = 0 : 40;
xl = 2 * cos(0.1*pi * nl) + 3 * sin(0.2*pi * nl);
[Xl] = dtft(xl, nl, w);
n2 = 0 : 200;
x2 = 2 * cos(0.1*pi * n2) + 3 * sin(0.2*pi * n2);
[X2] = dtft(x2,n2,w);
subplot 221; plot (nl,xl); xlabel('n'); grid
subplot 222; plot (w/pi, abs(Xl)); xlabel('w/pi [rad/m]'); grid
subplot 223; plot (n2,x2); xlabel('n'); grid
subplot 224; plot (w/pi, abs(X2)); xlabel('w/pi [rad/m]'); grid