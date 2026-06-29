import os
from pathlib import Path
    

def install_model():
    APP_DATA_DIR = Path(os.getenv('APPDATA')) / "GUMBA"
    APP_DATA_DIR.mkdir(parents=True, exist_ok=True)