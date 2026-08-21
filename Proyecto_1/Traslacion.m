function vector4d = Traslacion(dx, dy, vectorIn)

MatTrans = [1 0 0 dx;
            0 1 0 dy;
            0 0 1 0;
            0 0 0 1];

vector4d = MatTrans * vectorIn;

end







%function vector4d = Traslacion(dx, dy, vectorIn)

%MatTrans = [1 0 0 dx; 0 1 0 dy, 0 0 1 dz, 0 0 0 1];

%vector4d = MatTrans * vectorIn;

%end