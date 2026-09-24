close all
clear
clc

%% ==========================================
% SELECCIONAR METODO
% ==========================================

figMetodo = figure('Name','Metodo de calculo', ...
                   'NumberTitle','off', ...
                   'Position',[500 400 350 180], ...
                   'MenuBar','none');

uicontrol(figMetodo, ...
          'Style','text', ...
          'Position',[50 120 250 30], ...
          'String','Selecciona el metodo de calculo:', ...
          'FontSize',11);

checkMetodo = uicontrol(figMetodo, ...
                        'Style','checkbox', ...
                        'Position',[70 80 220 30], ...
                        'String','Usar matrices de transformacion', ...
                        'FontSize',10);

uicontrol(figMetodo, ...
          'Style','pushbutton', ...
          'Position',[125 30 100 35], ...
          'String','Continuar', ...
          'Callback','uiresume(gcbf)');

uiwait(figMetodo);

% Guardar seleccion
usarMatrices = get(checkMetodo,'Value');

close(figMetodo);


%% ==========================================
% INGRESAR LONGITUDES
% ==========================================

L1 = input('Ingresa la longitud del primer eslabon: ');
L2 = input('Ingresa la longitud del segundo eslabon: ');
L3 = input('Ingresa la longitud del tercer eslabon: ');


%% ==========================================
% INGRESAR ANGULOS
% ==========================================

theta1 = input('Ingresa el giro de la base (theta1): ');
theta2 = input('Ingresa el angulo del primer eslabon (theta2): ');
theta3 = input('Ingresa el angulo del segundo eslabon (theta3): ');
theta4 = input('Ingresa el angulo del tercer eslabon (theta4): ');


%% ==========================================
% CONVERTIR A RADIANES
% ==========================================

t1 = deg2rad(theta1);
t2 = deg2rad(theta2);
t3 = deg2rad(theta3);
t4 = deg2rad(theta4);


%% ==========================================
% PUNTO DE ORIGEN
% ==========================================

P0 = [0 0 0];


%% ==========================================
% CALCULO DE POSICIONES
% ==========================================

if usarMatrices == 0

    %% ======================================
    % SOLUCION GEOMETRICA
    % ======================================

    % Primer eslabon
    P1 = [L1*cos(t2)*cos(t1), ...
          L1*cos(t2)*sin(t1), ...
          L1*sin(t2)];

    % Segundo eslabon
    P2 = [P1(1) + L2*cos(t2+t3)*cos(t1), ...
          P1(2) + L2*cos(t2+t3)*sin(t1), ...
          P1(3) + L2*sin(t2+t3)];

    % Tercer eslabon
    P3 = [P2(1) + L3*cos(t2+t3+t4)*cos(t1), ...
          P2(2) + L3*cos(t2+t3+t4)*sin(t1), ...
          P2(3) + L3*sin(t2+t3+t4)];

    metodo = 'Solucion geometrica';


else

    %% ======================================
    % MATRICES DE TRANSFORMACION
    % ======================================

    % Matriz de rotacion alrededor de Z
    Rz = [cos(t1) -sin(t1) 0 0;
          sin(t1)  cos(t1) 0 0;
          0        0       1 0;
          0        0       0 1];

    % Matriz de rotacion alrededor de Y
    Ry2 = [cos(t2)  0 sin(t2) 0;
           0        1 0       0;
          -sin(t2)  0 cos(t2) 0;
           0        0 0       1];

    Ry3 = [cos(t3)  0 sin(t3) 0;
           0        1 0       0;
          -sin(t3)  0 cos(t3) 0;
           0        0 0       1];

    Ry4 = [cos(t4)  0 sin(t4) 0;
           0        1 0       0;
          -sin(t4)  0 cos(t4) 0;
           0        0 0       1];


    % Matrices de traslacion
    Tx1 = [1 0 0 L1;
           0 1 0 0;
           0 0 1 0;
           0 0 0 1];

    Tx2 = [1 0 0 L2;
           0 1 0 0;
           0 0 1 0;
           0 0 0 1];

    Tx3 = [1 0 0 L3;
           0 1 0 0;
           0 0 1 0;
           0 0 0 1];


    %% ======================================
    % MATRICES HOMOGENEAS
    % ======================================

    % Transformacion hasta P1
    T01 = Rz * Ry2 * Tx1;

    % Transformacion hasta P2
    T02 = T01 * Ry3 * Tx2;

    % Transformacion hasta P3
    T03 = T02 * Ry4 * Tx3;


    %% ======================================
    % EXTRAER POSICIONES
    % ======================================

    P1 = T01(1:3,4)';
    P2 = T02(1:3,4)';
    P3 = T03(1:3,4)';

    metodo = 'Matrices de transformacion';

end


%% ==========================================
% MOSTRAR RESULTADOS
% ==========================================

disp(' ');
disp('==========================================');
disp(['Metodo utilizado: ', metodo]);
disp('==========================================');

disp('P0 = ');
disp(P0);

disp('P1 = ');
disp(P1);

disp('P2 = ');
disp(P2);

disp('P3 = ');
disp(P3);


%% ==========================================
% DIBUJAR BRAZO
% ==========================================

figure
hold on
grid on
axis equal


% Primer eslabon
plot3([P0(1) P1(1)], ...
      [P0(2) P1(2)], ...
      [P0(3) P1(3)], ...
      'LineWidth',5)


% Segundo eslabon
plot3([P1(1) P2(1)], ...
      [P1(2) P2(2)], ...
      [P1(3) P2(3)], ...
      'LineWidth',5)


% Tercer eslabon
plot3([P2(1) P3(1)], ...
      [P2(2) P3(2)], ...
      [P2(3) P3(3)], ...
      'LineWidth',5)


%% ==========================================
% ARTICULACIONES
% ==========================================

plot3(P0(1),P0(2),P0(3), ...
      'ko','MarkerSize',12,'MarkerFaceColor','k')

plot3(P1(1),P1(2),P1(3), ...
      'ko','MarkerSize',10,'MarkerFaceColor','k')

plot3(P2(1),P2(2),P2(3), ...
      'ko','MarkerSize',10,'MarkerFaceColor','k')

plot3(P3(1),P3(2),P3(3), ...
      'ko','MarkerSize',10,'MarkerFaceColor','k')


%% ==========================================
% EJES DE REFERENCIA
% ==========================================

plot3([0 3],[0 0],[0 0],'--')
plot3([0 0],[0 3],[0 0],'--')
plot3([0 0],[0 0],[0 3],'--')


%% ==========================================
% CONFIGURACION DE LA GRAFICA
% ==========================================

xlabel('X')
ylabel('Y')
zlabel('Z')

title(['Brazo 3D | ',metodo, ...
       ' | Base = ',num2str(theta1), ...
       '° | Eslabon 1 = ',num2str(theta2), ...
       '° | Eslabon 2 = ',num2str(theta3), ...
       '° | Eslabon 3 = ',num2str(theta4),'°'])

xlim([-10 10])
ylim([-10 10])
zlim([-10 10])

view(3)
