
close all
xBounds = [0, 100];
yBounds = [0, 10];

cols = 10;
rows = 1;

% find the number of staes
numStates = xBounds(end) / cols;

% get x coordinates
points = xBounds(1) : numStates : xBounds(end);
xcoords = zeros(numStates, 4, 4);
ycoords = zeros(numStates, 4, 4);
ind = 1;
for count = 1: numStates
    startPt = points(count);
    endPt = points(count+1);
    mid = (endPt - startPt)/2 + startPt;
    
    %lower triangle
    xcoords(ind,1, 1) = startPt;
    xcoords(ind,2,1) = mid;
    xcoords(ind,3,1) = endPt;
    xcoords(ind,4,1) = startPt;
    
    ycoords(ind,1,1) = 0;
    ycoords(ind,2,1) = 5;
    ycoords(ind,3,1) = 0;
    ycoords(ind,4,1) = 0;
    
    %upper triangle
    xcoords(ind, 1, 2) = startPt;
    xcoords(ind, 2, 2) = mid;
    xcoords(ind, 3, 2) = endPt;
    xcoords(ind, 4, 2) = startPt;
    
    ycoords(ind, 1, 2) = 10;
    ycoords(ind, 2, 2) = 5;
    ycoords(ind, 3, 2) = 10;
    ycoords(ind, 4, 2) = 10;
    
    %left triangle
    
    xcoords(ind, 1, 3) = startPt;
    xcoords(ind, 2, 3) = mid;
    xcoords(ind, 3, 3) = startPt;
    xcoords(ind, 4, 3) = startPt;
    
    ycoords(ind, 1, 3) = 0;
    ycoords(ind, 2, 3) = 5;
    ycoords(ind, 3, 3) = 10;
    ycoords(ind, 4, 3) = 0;
    
    % right triangle
    xcoords(ind, 1, 4) = endPt;
    xcoords(ind, 2, 4) = mid;
    xcoords(ind, 3, 4) = endPt;
    xcoords(ind, 4, 4) = endPt;
    
    ycoords(ind, 1, 4) = 0;
    ycoords(ind, 2, 4) = 5;
    ycoords(ind, 3, 4) = 10;
    ycoords(ind, 4, 4) = 0;
    
    ind = ind + 1;
    
end


% plot
[numpts, ~,~] = size(xcoords);
fh = figure(1);
hold on
for i = 1:numpts
    a = fill(xcoords(i, :, 1), ycoords(i, :, 1), [1 0 0]);
    b = fill(xcoords(i, :, 2), ycoords(i, :, 2), [0.75 0 0.25]);
    c = fill(xcoords(i, :, 3), ycoords(i, :, 3), [0.25 0 0.75]);
    d = fill(xcoords(i, :, 4), ycoords(i, :, 4), [0 0 1]);
end