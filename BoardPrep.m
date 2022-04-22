function [green, red, moveShift] = BoardPrep(State)
% [green, red] = BoardPrep(State)
%
% - green and red are 2D arrays where each row represents a pawn organized as
% [PawnFile, PawnRank] in numerical representation.
% - moveShift is a flag to keep track of move order and is used in mainHex
% 
% Where State is a string composed like
% GreenPawnLocations-RedPawnLocations-TurnOrder for example:
%
% A1B1C1-A3B3C3-G
%
% Is the default starting position

if nargin <1
    disp('Using default start.')
    State = 'A1B1C1-A3B3C3-G';
end
SeparatorIndexes = strfind(State,'-');
if length(SeparatorIndexes) ~= 2
    disp('Faulty state string')
    green = 0;
    red = 0;
    return
end

Sep1 = SeparatorIndexes(1);
Sep2 = SeparatorIndexes(2);

NG = (Sep1-1)/2;
NR = (Sep2-Sep1-1)/2;

green = zeros(NG,2);
red = zeros(NR,2);

for iPawn = 1:NG
    PawnFile = State(iPawn*2-1)-'A'+1;
    PawnRank = str2num(State(iPawn*2));
    green(iPawn,:) = [PawnFile,PawnRank];
end
for iPawn = 1:NR
    PawnFile = State(iPawn*2-1+Sep1)-'A'+1;
    PawnRank = str2num(State(iPawn*2+Sep1));
    red(iPawn,:) = [PawnFile,PawnRank];
end
if State(end) == 'R'
    moveShift = 1;
else
    moveShift = 0;
end



