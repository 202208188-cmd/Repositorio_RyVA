clear
close all

DibujaEjes(10);

[Ancho, Largo, Alto] = LeerDimensiones();
fprintf("[DEBUG] Ancho: %f | Largo: %f | Alto: %f  \n", Ancho, Largo, Alto);

PointMatrix = GetPointMatrix(Largo, Ancho, Alto, 0, 0, 0);

Color = input("Escribe el nombre del color entre comillas: ");
Color2 = input("Escribe el nombre del color2 entre comillas: ");

DibujaCaja(PointMatrix, Color);

eje = input("Indica el eje de rotación ('x', 'y' o 'z'): ", 's');
theta = input("Indica el angulo de rotación [rad]: ");

NewPoints = MoverCaja(eje, theta, PointMatrix,Color2);
%(theta, PointMatrix, Color2, eje)

DibujaCaja(NewPoints, Color2);
