from PIL import ImageGrab
import cv2
import numpy as np
import sys
import os

# Take screenshot (entire screen)
screenshot = ImageGrab.grab()
screenshot_np = np.array(screenshot)

# Convert to BGR (OpenCV uses BGR not RGB)
screenshot_cv = cv2.cvtColor(screenshot_np, cv2.COLOR_RGB2BGR)

# Optional: Crop only result area
# Example: y1:y2, x1:x2 = 700:1000, 400:800
cropped = screenshot_cv[95:861, 300:800]  # <-- Change to match your card area

# Load all card templates from "cards/" folder
card_dir = "cards"
found_any = False

# Show the cropped image in a window
# cv2.imshow("Cropped Screenshot", cropped)
# cv2.waitKey(0)  # Wait for any key press
# cv2.destroyAllWindows()

# Load target image
for filename in os.listdir(card_dir):
    if not filename.lower().endswith((".png", ".jpg", ".jpeg")):
        continue

    template_path = os.path.join(card_dir, filename)
    template = cv2.imread(template_path)

    if template is None:
        print(f"Failed to load: {filename}")
        continue

    # Match template
    result = cv2.matchTemplate(cropped, template, cv2.TM_CCOEFF_NORMED)
    _, max_val, _, _ = cv2.minMaxLoc(result)


    print(f"{filename}: {max_val:.2f}")
    if max_val >= 0.8:
        print(f"✅ Found {filename}")
        found_any = True
        break  # Stop at first match; remove if you want to check all

# Confidence threshold
if max_val >= 0.8:
    print("found")
    sys.exit(0)
else:
    print("not found")
    sys.exit(1)