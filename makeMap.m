function out = makeMap()
map = [[1, 0, 0, 0], ...
       [0, 0, 1, 1], ...
       [0, 1, 0, 0]];

curFig = gcf;
figure(curFig.Number + 1);
ax = gca;

[r, c] = size(map);
ax.XLim(c * 1);
ax.YLim(r * 1);

xStates = 1 : c;
yStates = 1 : r;

numStates = xStates * yStates;

hold on
for i = xStates
    plot([i, i], [0, r]);
end

return 0;

end