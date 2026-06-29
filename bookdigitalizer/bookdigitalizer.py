import os

import cv2
import pytesseract
import ollama

from bookdigitalizer.promts import correct_ocr_text_prompt
class bookDigitalizer:

    image_path = './assets/book_test.jpg'


    # Adding tesseract to the system path for testing purposes, (this will be handled by a binary)
    def __init__(self):
        os.environ["PATH"] += os.pathsep + 'C:/Program Files/Tesseract-OCR'

    def extractImageFromPhoto(photo):
        pass

    def extractTextFromPhoto(self,photo):

        blocksize = 45
        constant = 10
        thresholded_photo = cv2.adaptiveThreshold(photo, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, blocksize, constant)
        self.debugShowPhoto(thresholded_photo)
        photo_text = pytesseract.image_to_string(thresholded_photo, lang='hun')
        print(photo_text)
        pass

    def parsePhoto(self):
        photo = cv2.imread(self.image_path, 0)
        self.extractTextFromPhoto(photo)
        
    def debugShowPhoto(self,photo):
        scale_percent = 50 
        width = int(photo.shape[1] * scale_percent / 100)
        height = int(photo.shape[0] * scale_percent / 100)
        dim = (width, height)
        resized_img = cv2.resize(photo, dim, interpolation=cv2.INTER_AREA)
        cv2.imshow('Photo', resized_img)
        cv2.waitKey(0)
   
class TextCorrectionModel:
    def __init__(self):
        pass

    def correctText(self,text):
        prompt = correct_ocr_text_prompt(text)
        response = ollama.chat(model='llama3', messages=[{'role': 'user', 'content': prompt}])
        clean_text = response['message']['content']
        print(clean_text)

bp = bookDigitalizer()

bp.parsePhoto()


