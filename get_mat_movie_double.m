function get_mat_movie_double(mov_cropped, output_name, xstart, ystart, flipy, shift_left_right)
% GET_MAT_MOVIE_DOUBLE ... 
%  % x is horizontal, y is vertical.
%   ... 
% 
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    input1 - Description
%    input2 - Description
%    input3 - Description
%
% Outputs:
%    output1 - Description
%    output2 - Description
%
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
%

%% AUTHOR    : Yimeng Zhang
%% Computer Science Department, Carnegie Mellon University
%% EMAIL     : zym1010@gmail.com 

%% $DATE     : 10-Jan-2014 13:22:33 $ 
%% $Revision : 1.00 $ 
%% DEVELOPED : 8.1.0.604 (R2013a) 
%% FILENAME  : get_mat_movie_double.m 

%% MODIFICATIONS:
%% $26-Sep-2002 14:44:35 $
%% blablabla
%% ---
%% $25-Feb-2002 07:29:17 $ 
%% blablabla

if nargin < 6
    shift_left_right = 90;
end

if nargin < 5
    flipy = true;
end

movie_size = 400; % changed later

mov1 = cell(size(mov_cropped,1),1);
mov2 = cell(size(mov_cropped,1),1);

[height, width] = size(mov_cropped{1});

fprintf('h %d, w %d for %s\n', height, width, output_name);

if flipy
    ystart = height - movie_size - ystart; % approximately so, don't care +1 or -1.
end

range1 = [ystart,xstart,ystart + movie_size-1,xstart + movie_size - 1];
range2 = [ystart,xstart + shift_left_right, ystart + movie_size-1,xstart + movie_size - 1 + shift_left_right];

fprintf('for left (%d,%d), (%d,%d)\n',range1(1),range1(2),range1(3),range1(4));
fprintf('for right (%d,%d), (%d,%d) \n',range2(1),range2(2),range2(3),range2(4));

for i = 1:length(mov1)
    frame = mov_cropped{i};
    mov1{i} = frame(range1(1):range1(3),range1(2):range1(4));
    mov2{i} = frame(range2(1):range2(3),range2(2):range2(4));
end
fprintf('showing left image...\n');
show_movie(mov1);
fprintf('showing right image...\n');
show_movie(mov2);

mov = mov1;
save(['mat' filesep output_name '0.mat'], 'mov');
mov = mov2;
save(['mat' filesep output_name '1.mat'], 'mov');



end








% Created with NEWFCN.m by Frank González-Morphy 
% Contact...: frank.gonzalez-morphy@mathworks.de  
% ===== EOF ====== [get_mat_movie_double.m] ======  
