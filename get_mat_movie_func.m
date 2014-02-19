function get_mat_movie_func( prefix, xstart, ystart, start_idx )
%GET_MAT_MOIVE_FUNC Summary of this function goes here
%   Detailed explanation goes here

dir_name = '';

[prefix_list, prefix_list_num] = get_mat_prefix_list;

prefixnum = find(strcmp(prefix_list,prefix));
assert(isscalar(prefixnum));

prefixnum = prefix_list_num(prefixnum);

mov_original = get_mat_movie_original(dir_name, prefix, start_idx);
output_name = ['natural_' int2str(prefixnum) int2str(start_idx)];
get_mat_movie_double(mov_original, output_name, xstart, ystart);



end

