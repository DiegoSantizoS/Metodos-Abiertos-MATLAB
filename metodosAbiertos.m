clc; clear; close all;

% Definición de la función y sus derivadas
f = @(x) exp(-x) - x;  % Función dada
g = @(x) exp(-x);      % Función para punto fijo (g(x) = e^(-x))
df = @(x) -exp(-x) - 1; % Derivada para Newton-Raphson

% Parámetros
tol = 1e-6;
x0 = 0;
max_iter = 100;

%% Método de Punto Fijo
fprintf('Método de Punto Fijo\n');
x = x0;
iter = 0;

while true
    x_new = g(x); 
    iter = iter + 1;
    fprintf('Iteración %d: x = %.6f\n', iter, x_new);
    
    if abs(x_new - x) < tol || iter >= max_iter
        break;
    end
    x = x_new;
end

fprintf('Raíz encontrada con Punto Fijo: x = %.6f en %d iteraciones\n\n', x, iter);

%% Método de Newton-Raphson
fprintf('Método de Newton-Raphson\n');
x = x0;
iter = 0;

while true
    x_new = x - f(x)/df(x); 
    iter = iter + 1;
    fprintf('Iteración %d: x = %.6f\n', iter, x_new);
    
    if abs(x_new - x) < tol || iter >= max_iter
        break;
    end
    x = x_new;
end

fprintf('Raíz encontrada con Newton-Raphson: x = %.6f en %d iteraciones\n', x, iter);
