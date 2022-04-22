function [green, red, isValid] = validateMove(green,red,start,finish,greenMoves)
    [nr, ~]=size(red);
    [ng, ~]=size(green);
    move = finish - start;
    isValid = false;
    for j=1:nr
        if start==red(j,:)
            if greenMoves
                disp('Green moves')
                return
            end
            if isequal(move,[0 -1])
                invalidMove = false;
                for i = 1:ng
                    if finish == green(i,:)
                        invalidMove = true;
%                         disp('invalid move')
                    end
                end
                for i = 1:nr
                    if finish == red(i,:)
                        invalidMove = true;
%                         disp('invalid move')
                    end
                end
                if ~invalidMove
                    red(j,:) = finish;
                    isValid = true;
                    return
                end
            elseif isequal(move,[1 -1]) | isequal(move,[-1 -1])
                invalidMove = true;
                for i=1:ng
                    if finish == green(i,:)
                        invalidMove = false;
                        green = [green(1:i-1,:);green(i+1:end,:)];
                        red(j,:) = finish;
                        isValid = true;
                        return
                    end
                end
                if invalidMove == true
%                     disp('invalid move')
                end
            else
%                 disp('invalid move');
            end
            return
        end
    end
    for j=1:ng
        if start==green(j,:)
            if ~greenMoves
                disp('Red moves')
                return
            end
            if isequal(move,[0 1])
                invalidMove = false;
                for i = 1:nr
                    if finish == red(i,:)
                        invalidMove = true;
%                         disp('invalid move')
                    end
                end
                for i = 1:ng
                    if finish == green(i,:)
                        invalidMove = true;
%                         disp('invalid move')
                    end
                end
                if ~invalidMove
                    green(j,:) = finish;
                    isValid = true;
                    return
                end
            elseif isequal(move,[1 1]) || isequal(move,[-1 1])
                invalidMove = true;
                for i=1:nr
                    if finish == red(i,:)
                        invalidMove = false;
                        red = [red(1:i-1,:);red(i+1:end,:)];
                        green(j,:) = finish;
                        isValid = true;
                        return
                    end
                end
                if invalidMove == true
%                     disp('invalid move')
                end
            else
%                 disp('invalid move');
            end
            return
        end
    end
end