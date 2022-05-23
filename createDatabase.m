function BoardDB = createDatabase(BoardSize)
if nargin<1
    BoardSize = 3;
end
BoardDB = struct('Size',BoardSize);

State = defaultStartState(BoardSize);

BoardDB.Positions(1) = struct('Label',State);
BoardDB.Positions(1).AvailableMoves = getAvailableMoves(State,BoardSize);
BoardDB.Positions(1).WinDrawLose = zeros( size(BoardDB.Positions(1).AvailableMoves,1) , 3 );
BoardDB.Positions(1).nMoves = size(BoardDB.Positions(1).AvailableMoves,1);

BoardDB = recursivePopulateBoardDB(BoardDB,State);
end