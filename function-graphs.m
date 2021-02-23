% Detta är en arbetsmall för att plotta funktioner i MATLAB / Octave
% med koordinataxlarna skär varandra i origo istället för en
% ram runt grafen.

x_min = -4.5; x_max = 4.5; x_grid_step = 1;
y_min = -1.2; y_max = 1.2; y_grid_step = 0.5;

% Definiera x-värdena
x = x_min:0.1:x_max;

% Definiera funktionen som ska plottas
y = sin(x);

% Själva diagrammet
figure('Name', 'Funktionsgraf', 'NumberTitle', 'off');
axis([-5 5 -1.3 1.3]); % Kan ev. använda x_min och x_max
set(gca, 'XColor', 'None'); % Ramen tas bort
set(gca, 'YColor', 'None'); 
grid on
hold on;

% Plotta koordinataxlarna
plot(linspace(x_min, x_max), linspace(0,0), 'k-');
plot(linspace(0,0), linspace(y_min, y_max), 'k-');

% Placera ut axelnamnen
text(4.6, -0.15, '$x$', 'Interpreter', 'latex', 'FontSize', 14)
text(-0.6, 1.2, '$y$', 'Interpreter', 'latex', 'FontSize', 14)

% Axelpilar ("annotation arrows")
% Annotations sätts med relativa koordinater, origo längst ned
% till vänster, [1 1] längst upp till höger
x_ann = [0.8 0.905]; y_ann = [0.5175 0.5175]; % x-axel
x_ann_1 = [0.518 0.518]; y_ann_1 = [0.8 0.925]; % y-axel
annotation('textarrow',x_ann,y_ann,'String','')
annotation('textarrow',x_ann_1,y_ann_1,'String','')

% Sätt ut x--värdena på axeln
for i = -4:x_grid_step:4
   text(i, -0.2, num2str(i), 'HorizontalAlignment', 'center',...
                             'VerticalAlignment', 'bottom', 'FontName',...
                             'Times', 'FontSize', 14);
end

% Sätt ut y-värdena på axeln
for i = -1:y_grid_step:1
   text(-0.45, i, num2str(i), 'HorizontalAlignment', 'center',...
                             'VerticalAlignment', 'middle', 'FontName',...
                             'Times', 'FontSize', 14);
end

% Sätt ut "tickmarks" på x-axeln
for i = -4:4
    plot([i, i], [0, -0.025], 'LineWidth', 0.5, 'Color', 'black')
end

% Sätt ut "tickmarks" på y-axeln
for i = -1:0.5:1
    plot([0, -0.1], [i, i], 'LineWidth', 0.5, 'Color', 'black')
end

% Grafen plottas
plot(x, y, 'LineWidth', 1.5, 'Color', 'black');

% Nedan kan MinorGrid ställas in om man önskar
%ax = gca;
%ax.XMinorGrid = 'on'
%ax.YMinorGrid = 'on'

% ax.XAxis.MinorTick = 'on';
%ax.XAxis.MinorTickValues = -5:0.25:5;
%ax.YAxis.MinorTickValues = -1.5:0.25:1.5;
