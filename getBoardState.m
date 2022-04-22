function State = getBoardState(green, red, greenMoves)
% State = getBoardState(green, red, greenMoves)
%
% Generate the string tag that describes the current board state.
% 
% - State is the descriptor string (e.g. 'A1B1C1-A3B3C3-G' is the default
% starting position)
%
% - green and red are 2D arrays where each row represents a pawn organized as
% [PawnFile, PawnRank] in numerical representation.
% - greenMoves is a boolean flag determining move order.
if ~exist('green')
    disp('Creating default starting posion')
    green = [1,1;2,1;3,1];
    red = [1,3;2,3;3,3];
    greenMoves = true;
end

NG = size(green,1);
NR = size(red,1);
State = blanks(NG*2+NR*2+3); % Each pawn two characters+ 2 separators+ 1 move flag

GreenPawns = cell(1,NG);
for iPawn = 1:NG
    GreenPawns{iPawn} = [char(green(iPawn,1)+'A'-1), char(green(iPawn,2)+'1'-1)];
end
GreenPawns = sort(GreenPawns);
State(1:2*NG+1) = [GreenPawns{1:end},'-'];

RedPawns = cell(1,NR);
for iPawn = 1:NR
    RedPawns{iPawn} = [char(red(iPawn,1)+'A'-1), char(red(iPawn,2)+'1'-1)];
end
RedPawns = sort(RedPawns);
State(2*NG+2:2*NG+2+2*NR) = [RedPawns{1:end},'-'];
if greenMoves
    State(end) = 'G';
else
    State(end) =  'R';
end