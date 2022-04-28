from tkinter import *
import matlab.engine
from PIL import Image, ImageTk

def engine_call():
    eng = matlab.engine.start_matlab()
    eng.hilbert1(nargout=0)
    img = Image.open("ECG.png")
    img = ImageTk.PhotoImage(img)
    panel = Label(window, image=img)
    panel.image = img
    panel.pack()

window = Tk()
window.title("Hilbert Transform of ECG Signal(Fs = 360Hz)")
window.geometry("1000x800")
window.configure(bg="sky blue")
  
#center this label
lbl1 = Label(window, text="ECG Signal Processing", bg="sky blue", fg="white", font="none 24 bold")
lbl1.config(anchor=CENTER)
lbl1.pack() 

btn = Button(
    window, 
    text ='Process Here', 
    command = engine_call,
    bg="white", fg="black", font="none 12 bold"
    ) 
btn.config(anchor=CENTER)
btn.pack()

window.mainloop()