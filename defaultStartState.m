function State = defaultStartState(boardSize)
NG = boardSize;
NR = NG;
State = blanks(NG*2+NR*2+3); % Each pawn two characters+ 2 separators+ 1 move flag
GreenPawns = cell(1,NG);
for iPawn = 1:NG
    GreenPawns{iPawn} = [char(iPawn+'A'-1), '1'];
end
GreenPawns = sort(GreenPawns);
State(1:2*NG+1) = [GreenPawns{1:end},'-'];

RedPawns = cell(1,NR);
for iPawn = 1:NR
    RedPawns{iPawn} = [char(iPawn+'A'-1), num2str(boardSize)];
end
RedPawns = sort(RedPawns);
State(2*NG+2:2*NG+2+2*NR) = [RedPawns{1:end},'-'];
State(end) = 'G';
end