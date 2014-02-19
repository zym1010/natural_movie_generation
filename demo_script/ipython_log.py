# IPython log file

get_ipython().magic(u'logstart ')
root_dir = pwd
root_dir = get_ipython().magic(u'pwd')
print root_dir
from get_frame_image_from_movie import *
get_frame_image_from_movie(root_dir + '/' + "BBC.Natural.World.Pack.Complete.x264.720p.Blu-Ray/BBC Natural World - Africa's Dragon Mountain (2010)/BBC Natural World - Africa's Dragon Mountain.mkv", 87, 'BBC_NW_ADM')
get_ipython().magic(u'logstop ')
