function [start, finish] = getMove()
    start=ginput(1);
    start(1)= floor(start(1)/2) + 1;
    start(2)= floor(start(2)/2) + 1;
%     start
    
    finish=ginput(1);
    finish(1)= floor(finish(1)/2) + 1;
    finish(2)= floor(finish(2)/2) + 1;
%     finish
end