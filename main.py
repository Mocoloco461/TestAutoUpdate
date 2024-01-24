import requests

# Current version of your project
__version__ = '1.0.0'

def get_latest_version(repo):
    """Fetches the latest version of the repository from GitHub."""
    url = f"https://api.github.com/repos/{repo}/releases/latest"
    response = requests.get(url)
    response.raise_for_status()
    return response.json()['tag_name']

def check_for_update():
    """Checks for the latest version and prompts the user to update if needed."""
    # The GitHub repository in the format 'username/repository'
    repo = 'Mocoloco461/TestAutoUpdate'

    try:
        latest_version = get_latest_version(repo)
        if latest_version > __version__:
            print(f"A new version of the project is available: {latest_version}")
            print("Please update to the latest version.")
            print(f"Visit https://github.com/{repo}/releases/latest to download it.")
        else:
            print("You are using the latest version of the project.")
    except requests.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")
    except Exception as err:
        print(f"An error occurred: {err}")

# The main program
if __name__ == '__main__':
    print("Hello World")
    check_for_update()
