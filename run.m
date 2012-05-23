clear;
clc;

y0 = 1;
t0 = 0;
tN = 1.25;

%e = @(t)(exp(-15*t));
%f = @(t,y)(-15*y);
e = @(t)(2*exp(-t)+t-1);
f = @(t,y)(-y+t);

h = [0.2, 0.1, 0.01];

for i = 1:length(h)
    N = floor((tN - t0) / h(i));
    y = zeros(N,1);
    t = zeros(N,1);

    y(1) = y0;
    t(1) = t0;
    t(N) = tN;
    
    figure(i);
    hold on;

    [y(2:N), t(2:N)] = euler_explicit(f, y(1), t(1), h(i), N-1);
    plot(t, y, 'g-');
    %[y(2:N), t(2:N)] = euler_implicit(f, y(1), t(1), h(i), N-1);
    %plot(t, y, 'b-');
    [y(2:N), t(2:N)] = euler_middle(f, y(1), t(1), h(i), N-1);
    plot(t, y, 'k-');
    
    plot(t, e(t), 'r-');

    legend('Explicit', 'Middle', 'Exact');
    %legend('Explicit', 'Implicit', 'Middle', 'Exact');
    hold off;
end

title('Rozwiazanie rownania: dy/dt = y, dla h = 0.05, warunku poczatkowego y(0) = 1');