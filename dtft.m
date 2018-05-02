function [X] = dtft(x, n, w)
% X = valores de la DTFT calculados en las frecuencias w
% x = secuencia en funci�n de n
% n = vector con �ndices de x
% w = vector con frecuencias deseadas
X = zeros(1, length(w)); % inicializaci�n
for k = 1 : length(w),
for i = 1 : length(n),
X(k) = X(k) + x(i) * exp(-j * w(k) * n(i));
end
end