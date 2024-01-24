import tkinter as tk
from tkinter import messagebox
import requests
import zipfile
import os
import sys
import shutil


def fetch_latest_version_info():
    version_info_url = "https://raw.githubusercontent.com/Mocoloco461/TestAutoUpdate/main/version.txt"
    try:
        response = requests.get(version_info_url)
        latest_version = response.text.strip()
        return latest_version
    except Exception as e:
        messagebox.showerror("Update Check Failed", f"Could not check for updates: {e}")
        return None


def download_update(latest_version):
    download_url = f"https://github.com/Mocoloco461/TestAutoUpdate/raw/main/{latest_version}.zip"
    try:
        response = requests.get(download_url)
        update_file_path = f"{latest_version}.zip"
        with open(update_file_path, "wb") as f:
            f.write(response.content)
        return update_file_path
    except Exception as e:
        messagebox.showerror("Download Failed", f"Failed to download the update: {e}")
        return None


def apply_update(update_file_path):
    try:
        with zipfile.ZipFile(update_file_path, 'r') as zip_ref:
            zip_ref.extractall("update")
        # Here you would copy files from the "update" folder to your application directory
        # For simplicity, I'm just printing the path
        print(f"Update extracted to update/ folder. Implement moving logic based on your application structure.")
        # Optionally, cleanup update files after applying
        shutil.rmtree("update")  # Remove extracted files
        os.remove(update_file_path)  # Remove the update zip file
        restart_application()
    except Exception as e:
        messagebox.showerror("Update Failed", f"Could not apply the update: {e}")


def restart_application():
    os.execl(sys.executable, '"{}"'.format(sys.executable), *sys.argv)


def check_for_updates():
    local_version = "0.0.0"  # Default to a base version if not found
    try:
        with open("version.txt", "r") as f:
            local_version = f.read().strip()
    except FileNotFoundError:
        # Handle the case where the version file doesn't exist
        pass

    latest_version = fetch_latest_version_info()
    if latest_version and latest_version > local_version:
        messagebox.showinfo("Update Available", "A new update is available. Downloading now...")
        update_file_path = download_update(latest_version)
        if update_file_path:
            apply_update(update_file_path)


def show_message():
    messagebox.showinfo("Message", "Hello World")


if __name__ == "__main__":
    check_for_updates()

    root = tk.Tk()
    root.title("Hello World App")
    root.geometry("300x150")
    button = tk.Button(root, text="Click Me", command=show_message)
    button.pack(pady=20)
    root.mainloop()
