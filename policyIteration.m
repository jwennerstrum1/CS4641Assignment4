% function policyIteration(map, varargin)

%% set up map
map = [1, 0, 0, 0; ...
       0, 1, 0, 0; ...
       0, 0, 0, 0];
       
% varargin(1) - default value of each state
% defaultVal = varargin(1);
defaultVal = 0;

% varargin(2) - Jx2 array with x-y locations of terminating states
% termStates = varargin(2);
termStates = [4,3; 4,2; 4,1];

% varargin(3) - Jx1 array with rewards for terminating states
% termRewards = varargin(3);
termRewards = [5; -2; -2];

% varargin(2) - Nx2 array with x-y locations of custom reward states
% customStates = varargin(2);
customStates = [];

% varargin(3) - Nx2 array with rewards for custom rewards states
% customRewards = varargin(3);
customRewards = [];

[r, c] = size(map);

%% set up states and walls vectors
stateNum = find(map == 0);
numStates = length(stateNum);
wallNum = find(map == 1);
states(:, 1) = floor((stateNum - 1)./r) + 1;
states(:, 2) = r - mod(stateNum, r) + 1;
states(states == r + 1) = 1;
walls(:,1) = floor((wallNum - 1)./r) + 1;
walls(:,2) = r - mod(wallNum, r) + 1;
walls(walls == r + 1) = 1;

%% set up value array with term and custom states
valueArray = zeros(r, c) + defaultVal;
if ~isempty(termStates)
    valueArray(termStates(:,1).*r - termStates(:,2) + 1) = termRewards;
end
if ~isempty(customStates)
    valueArray(customStates(:,1).*r - customStates(:,2) + 1) = customRewards;
end

%% Create policy array
% 1 - up
% 2 - right
% 3 - down
% 4 - left
% 5 - wall

policy = ones(r, c);
policy(wallNum) = 5;

%% policy evaluation
for i = 1 : numStates
   curState = states(i, :);
   
    
end


%% policy extraction


% end