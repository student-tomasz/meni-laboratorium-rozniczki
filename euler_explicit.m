function [y, t] = euler_explicit(f, y0, t0, h, N)
    % y0 i t0 - to warunki poczatkowe,
    % h - to dlugosc kroku (ogolnie: [t(N) - t(1)/N])
    % N - to liczba krokow
    y = zeros(N+1,1);
    t = zeros(N+1,1);
    
    y(1) = y0;
    t(1) = t0;
    n = 1;
    while n < N+1
        y(n+1) = y(n) + h * f(t(n), y(n));
        t(n+1) = t(n) + h;
        n = n + 1;
    end
    
    y = y(2:N+1);
    t = t(2:N+1);
end

