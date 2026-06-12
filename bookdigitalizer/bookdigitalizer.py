import os

from PIL import Image
import cv2
import pytesseract

class bookDigitalizer:

    image_path = './assets/book_test.jpg'


    # Adding tesseract to the system path for testing purposes, (this will be handled by a binary)
    def __init__(self):
        os.environ["PATH"] += os.pathsep + 'C:/Program Files/Tesseract-OCR'

    def extractImageFromPhoto(photo):
        pass

    def extractTextFromPhoto(photo):

        blocksize = 45
        
        constant = 10
        thresholded_photo = cv2.adaptiveThreshold(photo, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, blocksize, constant)

        cv2.imshow('Thresholded Photo', thresholded_photo)
        
        photo_text = pytesseract.image_to_string(thresholded_photo, lang='hun')
        print(photo_text)
        cv2.waitKey(0)
        pass

    def parsePhoto(self):
        photo = cv2.imread(self.image_path, 0)
        self.extractTextFromPhoto(photo)
        


bp = bookDigitalizer()

bp.parsePhoto()