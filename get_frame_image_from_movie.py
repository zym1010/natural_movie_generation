from __future__ import print_function, absolute_import

import cv2
import numpy as np
import scipy.io as sio
import os.path


def get_frame_image_from_movie(input_file, time_start, filename_base, save_dir='.',
                               frame_number=50, frame_start_flag=False):
    if isinstance(input_file, unicode):
        # this is necessary since cv2.VideoCapture doesn't accept unicode.
        # seems that UTF-8 works with Ubuntu 14.04 and Mac OS X.
        input_file = input_file.encode('utf-8')

    # open video file.
    cap = cv2.VideoCapture(input_file)

    # get some meta.
    width = int(cap.get(cv2.cv.CV_CAP_PROP_FRAME_WIDTH))
    height = int(cap.get(cv2.cv.CV_CAP_PROP_FRAME_HEIGHT))
    frame_rate = cap.get(cv2.cv.CV_CAP_PROP_FPS)

    # get the frame index to start with.
    if not frame_start_flag:  # whether time_start denotes seconds or frames.
        frame_start = int(time_start * frame_rate)
    else:
        frame_start = int(time_start)

    # jump to start frame.
    cap.set(cv2.cv.CV_CAP_PROP_POS_FRAMES, frame_start)

    print('width {:d}, height {:d}, frame rate {:f}'.format(width, height, frame_rate))

    mat_list = np.zeros((frame_number,), dtype=np.object)

    for i in range(frame_number):
        ret, frame = cap.read()
        assert ret
        print('writing frame {:d}...'.format(i))
        numpy_mat = np.asarray(cv2.cvtColor(frame, cv2.COLOR_BGR2RGB))
        assert numpy_mat.dtype.type is np.uint8  # must be uint8 type.
        assert len(numpy_mat.shape) == 3 and numpy_mat.shape[2] == 3  # must be three channel thing
        mat_list[i] = numpy_mat

    cap.release()
    cv2.destroyAllWindows()

    # construct full file path
    filename = os.path.join(save_dir, filename_base)
    # write out meta.
    with open(filename + '.txt', 'w') as fout:
        fout.write('input_file: {:s}\n'.format(input_file))
        fout.write('width: {:d}\n'.format(width))
        fout.write('height: {:d}\n'.format(height))
        fout.write('frame_rate: {:f}\n'.format(frame_rate))
        fout.write('frame_start: {:d}\n'.format(frame_start))
        fout.write('frame_number: {:d}\n'.format(frame_number))
        fout.write('save_dir: {:s}\n'.format(save_dir))
        fout.write('filename_base: {:s}\n'.format(filename_base))

    # save mat.
    sio.savemat(filename + '.mat', {'frames': mat_list})