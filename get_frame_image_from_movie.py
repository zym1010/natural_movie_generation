import cv2

def get_frame_image_from_movie(input_file, time_start, suffix, frame_number = 50):
    if isinstance(input_file,unicode):
        input_file = input_file.encode('utf-8')
        
    cap = cv2.VideoCapture(input_file)

    width = cap.get(cv2.cv.CV_CAP_PROP_FRAME_WIDTH)
    height = cap.get(cv2.cv.CV_CAP_PROP_FRAME_HEIGHT)
    frame_rate = cap.get(cv2.cv.CV_CAP_PROP_FPS)

    frame_start = int(time_start*frame_rate)

    cap.set(cv2.cv.CV_CAP_PROP_POS_FRAMES,frame_start)

    print 'width %d, height %d, frame rate %f' % (width, height, frame_rate)

    for i in xrange(frame_number):
        ret, frame = cap.read()
        print 'writing frame {:d}...'.format(i)
        cv2.imwrite('image/image_' + suffix + '_{:d}.png'.format(frame_start+i), frame)

        # gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    cap.release()
    cv2.destroyAllWindows()
