% 
% close all
% xBounds = [0, 100];
% yBounds = [0, 10];
% 
% cols = 10;
% rows = 1;
% 
% % find the number of staes
% numStates = xBounds(end) / cols;
% 
% % get x coordinates
% points = xBounds(1) : numStates : xBounds(end);
% xcoords = zeros(numStates, 4, 4);
% ycoords = zeros(numStates, 4, 4);
% ind = 1;
% for count = 1: numStates
%     startPt = points(count);
%     endPt = points(count+1);
%     mid = (endPt - startPt)/2 + startPt;
%     
%     %lower triangle
%     xcoords(ind,1, 1) = startPt;
%     xcoords(ind,2,1) = mid;
%     xcoords(ind,3,1) = endPt;
%     xcoords(ind,4,1) = startPt;
%     
%     ycoords(ind,1,1) = 0;
%     ycoords(ind,2,1) = 5;
%     ycoords(ind,3,1) = 0;
%     ycoords(ind,4,1) = 0;
%     
%     %upper triangle
%     xcoords(ind, 1, 2) = startPt;
%     xcoords(ind, 2, 2) = mid;
%     xcoords(ind, 3, 2) = endPt;
%     xcoords(ind, 4, 2) = startPt;
%     
%     ycoords(ind, 1, 2) = 10;
%     ycoords(ind, 2, 2) = 5;
%     ycoords(ind, 3, 2) = 10;
%     ycoords(ind, 4, 2) = 10;
%     
%     %left triangle
%     
%     xcoords(ind, 1, 3) = startPt;
%     xcoords(ind, 2, 3) = mid;
%     xcoords(ind, 3, 3) = startPt;
%     xcoords(ind, 4, 3) = startPt;
%     
%     ycoords(ind, 1, 3) = 0;
%     ycoords(ind, 2, 3) = 5;
%     ycoords(ind, 3, 3) = 10;
%     ycoords(ind, 4, 3) = 0;
%     
%     % right triangle
%     xcoords(ind, 1, 4) = endPt;
%     xcoords(ind, 2, 4) = mid;
%     xcoords(ind, 3, 4) = endPt;
%     xcoords(ind, 4, 4) = endPt;
%     
%     ycoords(ind, 1, 4) = 0;
%     ycoords(ind, 2, 4) = 5;
%     ycoords(ind, 3, 4) = 10;
%     ycoords(ind, 4, 4) = 0;
%     
%     ind = ind + 1;
%     
% end
% 
% 
% % plot
% [numpts, ~,~] = size(xcoords);
% fh = figure(1);
% hold on
% for i = 1:numpts
%     a = fill(xcoords(i, :, 1), ycoords(i, :, 1), [1 0 0]);
%     b = fill(xcoords(i, :, 2), ycoords(i, :, 2), [0.75 0 0.25]);
%     c = fill(xcoords(i, :, 3), ycoords(i, :, 3), [0.25 0 0.75]);
%     d = fill(xcoords(i, :, 4), ycoords(i, :, 4), [0 0 1]);
% end

function makeGrid(map)
[r, c] = size(map);

xBounds = [0, r];
yBounds = [0, 10];

cols = 10;
rows = 1;

% find the number of staes
% numStates = xBounds(end) / col
wall = find(map == 1);
state = find(map == 0);
numStates = length(find(map == 0));

% get x coordinates
points = xBounds(1) : numStates : xBounds(end);
xcoords = zeros(numStates, 4, 4);
ycoords = zeros(numStates, 4, 4);
ind = 1;

for count = 1: numStates
%     startPt = state(count);
%     endPt = state(count+1);
%     mid = (endPt - startPt)/2 + startPt;
    x = floor((state(count)-1)/ r) + 1;
    y = r - mod(state(count), r) + 1;
%     if x == c
%         x = 1;
%     end
    if y == r +1
        y = 1;
    end
    
    startX = x - 1;
    endX = x;
    midX = (endX - startX)/2 + startX;
    
    startY = y - 1;
    endY = y;
    midY = (endY - startY)/2 + startY;
    
    
    %lower triangle
    xcoords(ind,1, 1) = startX;
    xcoords(ind,2,1) = midX;
    xcoords(ind,3,1) = endX;
    xcoords(ind,4,1) = startX;
    
    ycoords(ind,1,1) = startY;
    ycoords(ind,2,1) = endY;
    ycoords(ind,3,1) = startY;
    ycoords(ind,4,1) = startY;
    
    %upper triangle
    xcoords(ind, 1, 2) = startX;
    xcoords(ind, 2, 2) = midX;
    xcoords(ind, 3, 2) = endX;
    xcoords(ind, 4, 2) = startX;
    
    ycoords(ind, 1, 2) = endY;
    ycoords(ind, 2, 2) = midY;
    ycoords(ind, 3, 2) = endY;
    ycoords(ind, 4, 2) = endY;
    
    %left triangle
    
    xcoords(ind, 1, 3) = startX;
    xcoords(ind, 2, 3) = midX;
    xcoords(ind, 3, 3) = startX;
    xcoords(ind, 4, 3) = startX;
    
    ycoords(ind, 1, 3) = startY;
    ycoords(ind, 2, 3) = midY;
    ycoords(ind, 3, 3) = endY;
    ycoords(ind, 4, 3) = startY;
    
    % right triangle
    xcoords(ind, 1, 4) = endX;
    xcoords(ind, 2, 4) = midX;
    xcoords(ind, 3, 4) = endX;
    xcoords(ind, 4, 4) = endX;
    
    ycoords(ind, 1, 4) = startY;
    ycoords(ind, 2, 4) = midY;
    ycoords(ind, 3, 4) = endY;
    ycoords(ind, 4, 4) = startY;
    
    ind = ind + 1;
end

wallCoords = zeros(length(wall), 2);
for count = 1 : length(wall)
wallCoords(count, 1) = floor((wall(count)-1)/ r) + 1;
wallCoords(count, 2) = r - mod(wall(count), r) + 1;
if wallCoords(count, 2) == r + 1
    wallCoords(count, 2) = 1;
end

end


% plot gridworld
fh1 = figure(1);
axis equal
ax = gca;
ax.XLim = [0, c];
ax.YLim = [0, r];
ax.XTick = [];
ax.YTick = [];
ax.XColor = [1, 1, 1];
ax.YColor = [1, 1, 1];
hold on
for i = 1 : length(wall)
    rectangle('Position', [wallCoords(i, 1)-1, wallCoords(i, 2)-1, 1, 1], 'FaceColor', 'black');
end

% plot Q-values
% [numpts, ~,~] = size(xcoords);
fh2 = figure(2);
hold on
for i = 1:numStates
    a = fill(xcoords(i, :, 1), ycoords(i, :, 1), [1 0 0]);
    b = fill(xcoords(i, :, 2), ycoords(i, :, 2), [0.75 0 0.25]);
    e = fill(xcoords(i, :, 3), ycoords(i, :, 3), [0.25 0 0.75]);
    d = fill(xcoords(i, :, 4), ycoords(i, :, 4), [0 0 1]);
end

for i = 1:length(wall)
   rectangle('Position', [wallCoords(i, 1)-1, wallCoords(i, 2)-1, 1, 1], 'FaceColor', 'black');
end

axis equal
ax = gca;
ax.XLim = [0, c];
ax.YLim = [0, r];
ax.XTick = [];
ax.YTick = [];
ax.XColor = [1, 1, 1];
ax.YColor = [1, 1, 1];



% check out http://davinci-draw.com/ for drawing policy

end