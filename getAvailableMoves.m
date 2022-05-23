function Moves = getAvailableMoves(State,boardSize)

%% Convert state to locations
[green, red, ~] = BoardPrep(State);

%% Check for wins
if max(green(:,2)) == boardSize
    Moves = [];
    return
end
if min(red(:,2))==1
    Moves = [];
    return
end


%% Who Moves
if State(end) == 'R'
    greenMoves = 0;
else
    greenMoves = 1;
end

%% Find Moves
Moves = [];             % each row [startFile, startRank, finishFile, finishRank]
NG = size(green,1);
NR = size(red,1);
if greenMoves
    if NG == 0
        return
    end
    for i=1:NG
        start = green(i,:);
        finish = start;
        finish(2) = finish(2)+1;
        for j =-1:1
            finish(1)=start(1)+j;
            [~,~,isValid]=validateMove(green,red, start, finish, greenMoves);
            if isValid
                Moves = [Moves; start, finish];
            end
        end
    end
else
    if NR == 0
        return
    end
    for i=1:NR
        start = red(i,:);
        finish = start;
        finish(2) = finish(2)-1;
        for j =-1:1
            finish(1)=start(1)+j;
            [~,~,isValid]=validateMove(green,red, start, finish, greenMoves);
            if isValid
                Moves = [Moves; start, finish];
            end
        end
    end
end

end