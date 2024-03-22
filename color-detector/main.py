import numpy as np
import cv2
from PIL import Image

# Function to calculate lower and upper HSV limits for a given BGR color
def get_color_limits(user_color):
    color_np = np.uint8([[user_color]])  # Convert user color to numpy array
    hsv_color = cv2.cvtColor(color_np, cv2.COLOR_BGR2HSV)

    hue_value = hsv_color[0][0][0]  # Extract hue value

    # Handle red hue wrap-around
    if hue_value >= 165:  # Upper limit for divided red hue
        lower_limit = np.array([hue_value - 10, 100, 100], dtype=np.uint8)
        upper_limit = np.array([180, 255, 255], dtype=np.uint8)
    elif hue_value <= 15:  # Lower limit for divided red hue
        lower_limit = np.array([0, 100, 100], dtype=np.uint8)
        upper_limit = np.array([hue_value + 10, 255, 255], dtype=np.uint8)
    else:
        lower_limit = np.array([hue_value - 10, 100, 100], dtype=np.uint8)
        upper_limit = np.array([hue_value + 10, 255, 255], dtype=np.uint8)

    return lower_limit, upper_limit

# Function to get user-defined BGR color
def get_color():
    blue = int(input("Enter Blue (0-255): "))
    green = int(input("Enter Green (0-255): "))
    red = int(input("Enter Red (0-255): "))
    return [blue, green, red]

# Get user-defined color
user_color = get_color()

# Capture video from webcam
cap = cv2.VideoCapture(0)

# Main loop for video processing
while True:
    # Read a frame from the webcam
    frame_tuple = cap.read()
    ret = frame_tuple[0]
    frame = frame_tuple[1]

    # Convert frame to HSV color space
    hsv_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    # Get lower and upper HSV limits for user-defined color
    low, up = get_color_limits(user_color)

    # Create a mask to identify pixels within the specified color range
    mask = cv2.inRange(hsv_frame, low, up)

    # Convert mask to PIL Image
    mask_img = Image.fromarray(mask)

    # Find bounding box of the detected region
    bbox = mask_img.getbbox()

    # If bounding box exists, draw a rectangle around the detected region on the frame
    if bbox is not None:
        x1, y1, x2, y2 = bbox
        frame = cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 5)

    # Display the frame with the rectangle
    cv2.imshow('frame', frame)

    # If 'q' is pressed, exit the loop
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release webcam feed and close OpenCV windows
cap.release()
cv2.destroyAllWindows()
