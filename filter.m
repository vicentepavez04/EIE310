Vo(1)=0;
for n = 2 : 100,
Vo= 0.1 * Vi(n) + 0.9 * Vo(n-1);
end
