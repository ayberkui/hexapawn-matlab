clear all
clc
close all

boardSize = 3;
[green, red, moveShift] = BoardPrep();
hf = figure;
plot(1,1);
ha = gca;
drawBoard(ha,green,red,boardSize);
move = 1;
for i=1:100
    greenMoves = mod(move+moveShift,2);
    State = getBoardState(green,red,greenMoves)
    [start, finish] = getMove();
    if finish(1)<= boardSize && finish(2)<=boardSize && finish(1)>=1 && finish(2)>=1
        [green, red, isValid] = validateMove(green,red,start,finish,greenMoves);
        if isValid
            move = move+1;
        end
    else
        disp('invalid move')
    end
    
    drawBoard(ha,green,red,boardSize)
    
end
