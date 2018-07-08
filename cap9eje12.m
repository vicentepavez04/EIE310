% Adquiere datos y define par�metros
load ups.txt; % lee muestras desde un archivo de texto
x = ups'; % convierte vector de columna a vector de fila
Nm = 5400; % n�mero de muestras
Fs = 6400; % frecuencia de muestreo [Hz]
Dt = 1 / Fs; % intervalo de muestreo [seg]  
% Gr�fico [a]: 5 ciclos (0.1 seg.) de la secuencia     
% para visualizar la distorsi�n en la forma de onda
n = [0 : 1 : Nm-1]; % �ndice de las muestras
t = n * Dt; % vector de tiempo
subplot 221; plot(t, x) % gr�fico
axis([0 0.1 -10 10]) % escalas
xlabel('t [seg]'); ylabel('Amp'); grid
title('[a] 5 ciclos de la onda original')
% Elimina posible componente continua y aplica ventana Hanning
% para reducir el contenido espurio en el espectro
x = x - mean(x); % elimina posible nivel medio
x = x .* hanning(Nm)'; % multiplica por ventana Hanning
x = x - mean(x); % elimina posible nivel medio post-ventana
% Aumenta el n�mero de muestras a la siguiente potencia de 2
% para aprovechar la eficiencia de la FFT, al mismo tiempo
% que aumenta la definici�n espectral
NC = 8192 - 5400; % n�mero de ceros a agregar
z = zeros(1, NC); % forma vector de ceros
x = [x z]; % concatena ceros a los datos
Nf = 8192; % n�mero de muestras para la FFT (2^13)
% Gr�fico [b]: secuencia de entrada a la FFT. Contiene 8192
% muestras @ 5400 m/s, es decir, un segmento de 1.28 seg.
n = [0 : 1 : Nf-1]; % �ndice de las muestras
t = n * Dt; % vector de tiempo
subplot 222; plot(t, x); % gr�fico
axis([0 1.4 -10 10]) % escalas
xlabel('t [seg]'); ylabel('Amp'); grid
title('[b] Secuencia ingresada a la FFT')
% Calcula la magnitud del espectro
X = fft(x); % FFT
M = (2/Nm) * abs(X(1:Nf/2)); % magnitud de frecuencias positivas
M = M / 0.5; % compensa atenuaci�n de la vent. Hanning
% Gr�fico [c]: magnitud del espectro
k = [0 : 1 : Nf/2-1]; % vector de frecuencias discretas positivas
f = k / (Nf * Dt); % vector de frecuencias [Hz]
subplot 223; semilogy(f, M(k+1)); % gr�fico
axis([0 2500 0.001 8]); % escalas
xlabel('f [Hz]'); ylabel('Mag'); grid
title('[c] Magnitud del espectro')
% Gr�fico [d]: espectro ampliado (zoom) en frecuencias bajas
subplot 224; semilogy(f, M(k+1)); % gr�fico
axis([0 260 0.001 8]); % escalas
xlabel('f [Hz]'); ylabel('Mag'); grid
title('[d] Ampliaci�n de gr�fico [c]') 