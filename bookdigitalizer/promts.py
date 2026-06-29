def correct_ocr_text_prompt(text):
    return  f"""
Javítsd az alábbi magyar szöveg OCR (optikai karakterfelismerés) hibáit. 
A szöveg egy gombaleírás. Javítsd a elírásokat (pl. 05ak -> csak, lormbos -> lombos), 
távolítsd el az oldalszámokat és a margó zajt. 
Ne változtass a tartalmán, ne adj hozzá magyarázatot. 
Válaszod CSAK a javított, tiszta szöveg legyen.

Szöveg:
{text}
"""