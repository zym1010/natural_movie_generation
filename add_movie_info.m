function [ movie_info_list ] = add_movie_info( movie_info_list, start_idx,...
    xstart, ystart, prefix)
%ADD_MOVIE_INFO Summary of this function goes here
%   Detailed explanation goes here
movie_info_list{end+1}.start_idx = start_idx;
movie_info_list{end}.xstart = xstart;
movie_info_list{end}.ystart = ystart;
movie_info_list{end}.prefix = prefix;


end

