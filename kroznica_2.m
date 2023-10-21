function kroznica_2()
    st = 10000;
    r = 1;
    
    [ocenjenoPi, napaka] = area_pi(st, r);
    fprintf('Ocenjeno π: %f\nNapaka: %f\n', ocenjenoPi, napaka);
    
    risi_kroznico_in_tocke(st, r);
end

function [ocenjenoPi, napaka] = area_pi(st, r)
    xy = 2 * rand(2, st) - 1;
    razdalja = sum(xy.^2);
    znotrajKroga = sum(razdalja <= r^2);
    
    ocenjenoPi = 4 * znotrajKroga / st;
    napaka = abs(ocenjenoPi - pi);
end

function risi_kroznico_in_tocke(st, r)
    xy = 2 * rand(2, st) - 1;
    razdalja = sum(xy.^2);
    
    tockeZnotraj = razdalja <= r^2;
    tockeZunaj = razdalja > r^2;
    
    scatter(xy(1, tockeZnotraj), xy(2, tockeZnotraj), 50, 'b', 'filled');
    hold on;
    scatter(xy(1, tockeZunaj), xy(2, tockeZunaj), 50, 'r', 'x');
    
    theta = linspace(0, pi/2, 1000);
    x = r * cos(theta);
    y = r * sin(theta);
    plot(x, y, 'g', 'LineWidth', 2);
    
    axis equal;
    title('Naključno generirane točke na krožnici z lokom');
    xlabel('X-os');
    ylabel('Y-os');
    legend('Znotraj krožnice', 'Zunaj krožnice', 'Krožnica');
end

