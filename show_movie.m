function [  ] = show_movie( mov )
%SHOW_MOVIE Summary of this function goes here
for i = 1:length(mov)
imshow(mov{i});
title(int2str(i));
pause;
end

end

