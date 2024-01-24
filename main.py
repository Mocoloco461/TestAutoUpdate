import tkinter as tk
from tkinter import messagebox

def show_message():
    messagebox.showinfo("Message", "Hello World")

# Create the main window
root = tk.Tk()
root.title("Hello World App")

# Set the geometry (size)
root.geometry("300x150")

# Add a button
button = tk.Button(root, text="Click Me", command=show_message)
button.pack(pady=20)

# Start the GUI event loop
root.mainloop()
