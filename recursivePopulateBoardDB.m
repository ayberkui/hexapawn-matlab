function newBoardDB = recursivePopulateBoardDB(BoardDB,State)
    
    %% Try to find  the position if exists
    posIndex = find(strcmp({BoardDB.Positions.Label}, State)==1);
    
    %% If not exists, create an entry
    if isempty(posIndex)
        
        BoardDB.Positions(end+1)= struct('Label', State, 'AvailableMoves', [], 'WinDrawLose', [], 'nMoves' , 0);
        posIndex = find(strcmp({BoardDB.Positions.Label}, State)==1);
        BoardDB.Positions(posIndex).AvailableMoves = getAvailableMoves(State,BoardDB.Size);
        BoardDB.Positions(posIndex).nMoves = size(BoardDB.Positions(posIndex).AvailableMoves,1);
        BoardDB.Positions(posIndex).WinDrawLose = zeros( BoardDB.Positions(posIndex).nMoves , 3 );
        disp(['Novel position reached : ', pad(State,4*BoardDB.Size+3,'left'), '. Appending to DB... PosIndex : ', num2str(posIndex)])
        
    end
    
    %% Setup board before trying moves
    nMoves = BoardDB.Positions(posIndex).nMoves;
    [green, red, ~] = BoardPrep(State);
    if State(end) == 'R'
        greenMoves = 0;
    else
        greenMoves = 1;
    end
    
    %% Try all moves and fill positions
    for movIndex = 1:nMoves
        start = BoardDB.Positions(posIndex).AvailableMoves(movIndex,1:2);
        finish = BoardDB.Positions(posIndex).AvailableMoves(movIndex,3:4);
        [newGreen, newRed, ~] = validateMove(green,red,start,finish,greenMoves);
        newState = getBoardState(newGreen,newRed,not(greenMoves)); % Next move other player's turn
        BoardDB = recursivePopulateBoardDB(BoardDB,newState);
    end
    
    %% Return filled DB
    newBoardDB = BoardDB;
end