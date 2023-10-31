
     %1, %,3, %9, %7, %5, %fim
T = [0,0.3,0,0.3,0, 0
    1/3,0,0.45,0, 1/2, 0
    0,0.3,0,0, 0.3, 0
    1/3,0,0.45,0, 1/2, 0
    1/3,0.3,0,0.3, 0, 0
    0,0.1,0.1,0.1, 0, 0]


fprintf("3- b")

R = T

fprintf("3- c")

R = crawl(T, [1 [2 3] 4 5], 6)


 fprintf("3- f")

a = [0 ; 0 ; 1 ; 0 ; 0 ; 0];

t = 0.125;

p1 = T^1*a;
p2 = T^2*a;
p3 = T^3*a;
p4 = T^4*a;



R = t *p1(4)*p2(1)*p3(5)*p4(2)



 fprintf("3- g")

a = [0 ; 0 ; 0 ; 1 ; 0 ; 0];

t = a;
i = 1;
while t(4) ~= 0
t = T^i*a;

i = i+1;
end

R = i



 fprintf("3- d")
c = {};
 for i=1:10^6
     y = crawl(T, [1 [2 3] 4 5], 6)

     c = [c;y]

 end















function [state] = crawl(H, first, last)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     state = [first];
     % keep moving from state to state until state "last" is reached:
     while (1)
          state(end+1) = nextState(H, state(end));
          if ismember(state(end), last) % verifies if state(end) is absorving
              break;
          end
     end
end

% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
     % find the probabilities of reaching all states starting at the current one:
     probVector = H(:,currentState)';  % probVector is a row vector 
     n = length(probVector);  %n is the number of states
     % generate the next state randomly according to probabilities probVector:
     state = discrete_rnd(1:n, probVector);
end

% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector 
function state = discrete_rnd(states, probVector)
     U=rand();
     i = 1 + sum(U > cumsum(probVector));
     state= states(i);
end