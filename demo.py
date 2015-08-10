#!/usr/bin/env python
# you have to make sure that get_frame_image_from_movie is accessible
# easiest way to achieve this is making the script in the same directory
# as get_frame_image_from_movie.py
import get_frame_image_from_movie
get_frame_image_from_movie.get_frame_image_from_movie(
    'demo/SampleVideo_1080x720_2mb.mkv', # name of the movie file
    2, # starting frame or time (in sec), all 0-indexed.
    'demo', # filename (without extension) of saved mat and txt.
    save_dir='demo', # dir to save the files.
    frame_number=10, # number of frames to extract.
    frame_start_flag=False) # whether second argument denotes second (if False) or frame (if True)