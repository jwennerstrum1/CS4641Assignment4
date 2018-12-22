function policyIteration()

alpha = 0.9;

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
valueArray = zeros(r,c);    % initialize all values to zero

rewardArray = zeros(r, c) + defaultVal;
if ~isempty(termStates)
    % set the terminal states to have terminal rewards
    rewardArray(termStates(:,1).*r - termStates(:,2) + 1) = termRewards;
end
if ~isempty(customStates)
    % set the custom states to have custom rewards
    rewardArray(customStates(:,1).*r - customStates(:,2) + 1) = customRewards;
end

%% Create policy array
% 1 - up
% 2 - right
% 3 - down
% 4 - left
% 5 - wall

policy = ones(r, c);
policy(wallNum) = 5;

%% value iteration
for i = 1 : numStates
   curState = states(i, :);
   
   % check above
   up = [curState(1) + 1, curState(2)];
   right = [curState(1), curState(2) + 1];
   down = [curState(1) - 1, curState(2)];
   left = [curState(1), curState(2) - 1];
   value = findValue(up, right, down, left);
   
    
end


%% policy extraction
    function val = findValue(up, right, down, left)        
        val = zeros(1, 4);
        
        curValue = valueArray(curState(1), curState(2));
        curPolicy = policy(curState(1), curState(2));
        neighbors1 = [up; right; down; left];
                
        for ii = 1 : 4
            try
                tempValue = rewardArray(neighbors1(ii, 1), neighbors(ii, 2)) + ...
                    alpha * valueArray(neighbors1(ii, 1), neighbors1(ii, 2));
                if tempValue > curValue
                    curValue = tempValue;
                    curPolicy = ii;                   
                end                
            end
        end
        
        rewardArray(curState(1), curState(2)) = curValue;
        policy(curState(1), curState(2)) = curPolicy;

    end

    function printPolicy(policy)
        for ii  = 1 : r
            for jj = 1 : c
                switch policy(ii, jj)
                    case 1
                        fprintf(' ^  ');
                    case 2
                        fprintf(' >  ');
                    case 3
                        fprintf(' \/ ');
                    case 4
                        fprintf(' <  ');
                    case 5
                        fprintf(' *  ');
                end
                fprintf('\n');
            end
        end        
    end

    function transition(action)
        
        
        
    end

end