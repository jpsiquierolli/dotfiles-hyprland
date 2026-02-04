#!/usr/bin/env python3
import subprocess
import json
import shutil

# --- CONFIGURATION ---
# If your commands are different (e.g., 'twingate start'), change them here.
CHECK_CMD = ["twingate", "status"]
RESOURCES_CMD = ["twingate", "resources"]
# ---------------------

def get_twingate_status():
    """Checks if Twingate is running/connected."""
    if not shutil.which("twingate"):
        return False, "Twingate not found"
    
    try:
        # Run status command. Adjust logic if output differs.
        result = subprocess.run(CHECK_CMD, capture_output=True, text=True)
        output = result.stdout.lower()
        
        # Logic: If output contains 'online', 'connected', or 'started'
        if "online" in output or "connected" in output or "started" in output:
            return True, output
        return False, output
    except Exception as e:
        return False, str(e)

def get_resources():
    """Fetches the list of resources for the tooltip."""
    try:
        result = subprocess.run(RESOURCES_CMD, capture_output=True, text=True)
        if result.returncode == 0 and result.stdout.strip():
            return result.stdout.strip()
        else:
            return "No resources available (or not authenticated)"
    except:
        return "Error fetching resources"

def main():
    is_connected, status_text = get_twingate_status()
    
    if is_connected:
        alt_status = "connected"
        tooltip_text = f"Status: {status_text.strip()}\n\n{get_resources()}"
    else:
        alt_status = "disconnected"
        tooltip_text = "Twingate is disconnected."

    # Waybar expects this JSON structure
    data = {
        "text": alt_status,       # Can be used in format
        "alt": alt_status,        # Used to select the icon from format-icons
        "tooltip": tooltip_text,  # The hover text
        "class": alt_status       # CSS class (custom-twingate.connected)
    }

    print(json.dumps(data))

if __name__ == "__main__":
    main()
