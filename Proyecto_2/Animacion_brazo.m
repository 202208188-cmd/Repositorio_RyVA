close all
clear
clf

%%% Longitud de los brazos
l1 = 0.5;
l2 = 0.3;

%%% Punto fijo
joint_1 = [0 0]';

%%% PRIMER MOVIMIENTO
% Primer brazo
for theta1 = pi/4:0.05:pi/2

    % El segundo brazo alineado al primero
    theta2 = 0;

    % Coordenadas del primer brazo
    l1x = l1*cos(theta1);
    l1y = l1*sin(theta1);

    joint_2 = [l1x l1y];

    % Coordenadas del segundo brazo
    l2x = l2*cos(theta1 + theta2);
    l2y = l2*sin(theta1 + theta2);

    % Punto final
    EFx = l1x + l2x;
    EFy = l1y + l2y;

    % Limpia posición
    cla
 
    %%% Ejes principales
    line([0 2], [0 0], [0 0], "Color", "red", "LineWidth", 3);

    line([0 0], [0 2], [0 0], "Color", "green", "LineWidth", 3);

    hold on


    %%% Dibujar articulaciones
    scatter(joint_1(1), joint_1(2), 100, "filled", "MarkerFaceColor", "blue");

    scatter(joint_2(1), joint_2(2), 100, "filled", "MarkerFaceColor", "blue");

    scatter(EFx, EFy, 100, "filled", "MarkerFaceColor", "blue");


    %%% Dibujar primer brazo
    line([joint_1(1) joint_2(1)], [joint_1(2) joint_2(2)], [0 0], "Color", "black", "LineWidth", 2);


    %%% Dibujar segundo brazo
    line([joint_2(1) EFx], [joint_2(2) EFy], [0 0], "Color", "black", "LineWidth", 2);


    %%% Configuración de gráfica
    grid on
    axis equal
    xlim([-0.5 1.5])
    ylim([0 1])

    drawnow
    pause(0.03)

end


%%% SEGUNDO MOVIMIENTO
% El primer brazo en 90°
theta1 = pi/2;

% Segundo brazo
for theta2 = 0:0.05:pi/4

    % Coordenadas del primer brazo
    l1x = l1*cos(theta1);
    l1y = l1*sin(theta1);

    joint_2 = [l1x l1y];

    % Segundo brazo
    l2x = l2*cos(theta1 + theta2);
    l2y = l2*sin(theta1 + theta2);

    % Punto final
    EFx = l1x + l2x;
    EFy = l1y + l2y;


    %%% Limpia posición
    cla

    %%% Ejes principales
    line([0 2], [0 0], [0 0], "Color", "red", "LineWidth", 3);

    line([0 0], [0 2], [0 0], "Color", "green", "LineWidth", 3);

    hold on


    %%% Dibujar articulaciones
    scatter(joint_1(1), joint_1(2), 100, "filled", "MarkerFaceColor", "blue");

    scatter(joint_2(1), joint_2(2), 100, "filled", "MarkerFaceColor", "blue");

    scatter(EFx, EFy, 100, "filled", "MarkerFaceColor", "blue");


    %%% Dibujar primer brazo
    line([joint_1(1) joint_2(1)], [joint_1(2) joint_2(2)], [0 0], "Color", "black", "LineWidth", 2);


    %%% Dibujar segundo brazo
    line([joint_2(1) EFx], [joint_2(2) EFy], [0 0], "Color", "black", "LineWidth", 2);


    %%% Configuración de gráfica
    grid on
    axis equal
    xlim([-0.5 1.5])
    ylim([0 1])

    drawnow
    pause(0.03)

end