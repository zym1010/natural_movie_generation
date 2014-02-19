function mov_original = get_mat_movie_original(dir_name, prefix, start_idx, end_idx)
% GET_MAT_MOVIE_ORIGINAL ... 
%  
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

%% $DATE     : 09-Jan-2014 23:16:41 $ 
%% $Revision : 1.00 $ 
%% DEVELOPED : 8.1.0.604 (R2013a) 
%% FILENAME  : get_mat_movie_original.m 

%% MODIFICATIONS:
%% $26-Sep-2002 14:44:35 $
%% blablabla
%% ---
%% $25-Feb-2002 07:29:17 $ 
%% blablabla

assert(exist(['image' filesep dir_name],'dir')==7);


if nargin < 4
    end_idx = start_idx + 50-1;
end

mov_original = {};

for i = 1:end_idx-start_idx+1
    file_name = ['image' filesep dir_name filesep 'image_' prefix '_' ...
        int2str(i+start_idx-1) '.png' ];
    if(exist(file_name,'file')==2)
        frame = imread(file_name);
        mov_original{i} = rgb2gray(frame);
        disp(i);
    else
        break;
    end
end

mov_original = mov_original(:);

end








% Created with NEWFCN.m by Frank González-Morphy 
% Contact...: frank.gonzalez-morphy@mathworks.de  
% ===== EOF ====== [get_mat_movie_original.m] ======  
