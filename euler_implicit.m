function [y, t] = euler_implicit(f, y0, t0, h, N)
    y = zeros(N+1,1);
    t = zeros(N+1,1);
    
    y(1) = y0;
    t(1) = t0;
    n = 1;
    while n < N+1
        y(n+1) = y(n) + h * f(t(n), y(n));
        for i = 1:3
          y(n+1) = y(n) + h * f(t(n), y(n+1));
        end
        t(n+1) = t(n) + h;
        n = n + 1;
    end
    
    y = y(2:N+1);
    t = t(2:N+1);
end

