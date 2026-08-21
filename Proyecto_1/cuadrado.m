punto1 = [2,2,0,1]';
punto2 = [5,2,0,1]';
punto3 = [5,5,0,1]';
punto4 = [2,5,0,1]';

dy = 5;

for i = 0:0.5:dy

    clf

    % Ejes
    line([0 10],[0 0],"color","red","LineWidth",2);
    line([0 0],[0 10],"color","magenta","LineWidth",2);
    hold on

    % Mover los puntos hacia arriba
    p1 = Traslacion(0,i,punto1);
    p2 = Traslacion(0,i,punto2);
    p3 = Traslacion(0,i,punto3);
    p4 = Traslacion(0,i,punto4);

    % Dibujar cuadrado
    plot([p1(1) p2(1) p3(1) p4(1) p1(1)], ...
         [p1(2) p2(2) p3(2) p4(2) p1(2)], ...
         "b","LineWidth",2);

    axis([0 10 0 10])
    axis square

    pause(0.1)

end