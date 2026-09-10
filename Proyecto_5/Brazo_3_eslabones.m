close all;
clear;
clc;

l1 = input('Ingresa la longitud del eslabon 1: ');
l2 = input('Ingresa la longitud del eslabon 2: ');
l3 = input('Ingresa la longitud del eslabon 3: ');

% Angulos iniciales [grados]
theta1 = input('Ingresa el angulo inicial del eslabon 1: ');
theta2 = input('Ingresa el angulo inicial del eslabon 2: ');
theta3 = input('Ingresa el angulo inicial del eslabon 3: ');

% Angulos finales [grados]
theta1_final = input('Ingresa el angulo final del eslabon 1: ');
theta2_final = input('Ingresa el angulo final del eslabon 2: ');
theta3_final = input('Ingresa el angulo final del eslabon 3: ');

% Convertir de grados a radianes
theta1 = deg2rad(theta1);
theta2 = deg2rad(theta2);

theta3 = deg2rad(theta3);

theta1_final = deg2rad(theta1_final);
theta2_final = deg2rad(theta2_final);
theta3_final = deg2rad(theta3_final);

% Movimientos de cada eslabon
movimiento1 = theta1_final - theta1;
movimiento2 = theta2_final - theta2;
movimiento3 = theta3_final - theta3;

% Movimiento de 45 grados
movimiento = pi/4;


% ==========================================
% MOVIMIENTO DEL ESLABON 1
% ==========================================

for i = 0:0.05:movimiento

    clf;

    t1 = theta1 + i;
    t2 = theta2;
    t3 = theta3;

    % Posicion del eslabon 1
    x1 = l1*cos(t1);
    y1 = l1*sin(t1);

    % Posicion del eslabon 2
    x2 = x1 + l2*cos(t1+t2);
    y2 = y1 + l2*sin(t1+t2);

    % Posicion del eslabon 3
    x3 = x2 + l3*cos(t1+t2+t3);
    y3 = y2 + l3*sin(t1+t2+t3);

    % Ejes
    line([-5 5],[0 0],[0 0], ...
        "Color",'red','LineWidth',2);

    line([0 0],[-5 5],[0 0], ...
        "Color",'green','LineWidth',2);

    hold on;

    % Eslabones
    line([0 x1],[0 y1], ...
        "Color",'blue','LineWidth',4);

    line([x1 x2],[y1 y2], ...
        "Color",'blue','LineWidth',4);

    line([x2 x3],[y2 y3], ...
        "Color",'blue','LineWidth',4);

    % Articulaciones
    scatter([0 x1 x2 x3], ...
            [0 y1 y2 y3], ...
            100,'filled');

    axis equal;
    grid on;
    axis([-5 5 -5 5]);

    title('Movimiento del eslabon 1');

    pause(0.1);

end

% Guardar posicion del eslabon 1
theta1 = theta1 + movimiento;


% ==========================================
% MOVIMIENTO DEL ESLABON 2
% ==========================================

for i = 0:0.05:movimiento

    clf;

    t1 = theta1;
    t2 = theta2 + i;
    t3 = theta3;

    % Posicion del eslabon 1
    x1 = l1*cos(t1);
    y1 = l1*sin(t1);

    % Posicion del eslabon 2
    x2 = x1 + l2*cos(t1+t2);
    y2 = y1 + l2*sin(t1+t2);

    % Posicion del eslabon 3
    x3 = x2 + l3*cos(t1+t2+t3);
    y3 = y2 + l3*sin(t1+t2+t3);

    % Ejes
    line([-5 5],[0 0],[0 0], ...
        "Color",'red','LineWidth',2);

    line([0 0],[-5 5],[0 0], ...
        "Color",'green','LineWidth',2);

    hold on;

    % Eslabones
    line([0 x1],[0 y1], ...
        "Color",'blue','LineWidth',4);

    line([x1 x2],[y1 y2], ...
        "Color",'blue','LineWidth',4);

    line([x2 x3],[y2 y3], ...
        "Color",'blue','LineWidth',4);

    % Articulaciones
    scatter([0 x1 x2 x3], ...
            [0 y1 y2 y3], ...
            100,'filled');

    axis equal;
    grid on;
    axis([-5 5 -5 5]);

    title('Movimiento del eslabon 2');

    pause(0.05);

end

% Guardar posicion del eslabon 2
theta2 = theta2 + movimiento;


% ==========================================
% MOVIMIENTO DEL ESLABON 3
% ==========================================

for i = 0:0.05:movimiento

    clf;

    t1 = theta1;
    t2 = theta2;
    t3 = theta3 + i;

    % Posicion del eslabon 1
    x1 = l1*cos(t1);
    y1 = l1*sin(t1);

    % Posicion del eslabon 2
    x2 = x1 + l2*cos(t1+t2);
    y2 = y1 + l2*sin(t1+t2);

    % Posicion del eslabon 3
    x3 = x2 + l3*cos(t1+t2+t3);
    y3 = y2 + l3*sin(t1+t2+t3);

    % Ejes
    line([-5 5],[0 0],[0 0], ...
        "Color",'red','LineWidth',2);

    line([0 0],[-5 5],[0 0], ...
        "Color",'green','LineWidth',2);

    hold on;

    % Eslabones
    line([0 x1],[0 y1], ...
        "Color",'blue','LineWidth',4);

    line([x1 x2],[y1 y2], ...
        "Color",'blue','LineWidth',4);

    line([x2 x3],[y2 y3], ...
        "Color",'blue','LineWidth',4);

    % Articulaciones
    scatter([0 x1 x2 x3], ...
            [0 y1 y2 y3], ...
            100,'filled');

    axis equal;
    grid on;
    axis([-5 5 -5 5]);

    title('Movimiento del eslabon 3');

    pause(0.05);

end

% Guardar posicion final
theta3 = theta3 + movimiento;


% ==========================================
% POSICION FINAL
% ==========================================

clf;

x1 = l1*cos(theta1);
y1 = l1*sin(theta1);

x2 = x1 + l2*cos(theta1+theta2);
y2 = y1 + l2*sin(theta1+theta2);

x3 = x2 + l3*cos(theta1+theta2+theta3);
y3 = y2 + l3*sin(theta1+theta2+theta3);

% Ejes
line([-5 5],[0 0],[0 0], ...
    "Color",'red','LineWidth',2);

line([0 0],[-5 5],[0 0], ...
    "Color",'green','LineWidth',2);

hold on;

% Eslabones
line([0 x1],[0 y1], ...
    "Color",'blue','LineWidth',4);

line([x1 x2],[y1 y2], ...
    "Color",'blue','LineWidth',4);

line([x2 x3],[y2 y3], ...
    "Color",'blue','LineWidth',4);

% Articulaciones
scatter([0 x1 x2 x3], ...
        [0 y1 y2 y3], ...
        100,'filled');

axis equal;
grid on;
axis([-5 5 -5 5]);

title('Posicion final del brazo robotico');