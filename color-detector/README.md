# Color Detection and Object Tracking with OpenCV

This script demonstrates basic color detection and object tracking using OpenCV. It allows users to specify a color in the BGR (Blue, Green, Red) format and detects objects of that color in real-time using a webcam feed.

## Dependencies

- **OpenCV**: Required for capturing video from the webcam, processing frames, and drawing rectangles.
- **NumPy**: Used for numerical operations and array manipulation, particularly in color conversion.
- **PIL (Python Imaging Library)**: Used for converting the mask array to a PIL Image and finding the bounding box of the detected region.

## Basic Implementation

The script performs the following steps:

1. **User Input**: Prompt the user to input the BGR values for the color they want to track.

2. **Video Capture**: Capture video frames from the webcam using OpenCV's `VideoCapture` function.

3. **Color Conversion**: Convert each frame from BGR to HSV (Hue, Saturation, Value) color space. HSV color space is preferred for color-based detection tasks due to its ability to separate color information effectively.

4. **Color Detection**: Determine the lower and upper HSV limits for the specified color using a provided function `get_color_limits`. Then, create a mask to identify pixels within the specified color range.

5. **Object Tracking**: Find the bounding box of the detected region using the `getbbox` function from PIL (Python Imaging Library) and draw a rectangle around it on the original frame using OpenCV's `rectangle` function.

6. **Display**: Display the processed frame with the rectangle showing the detected region.

7. **Loop**: Continue this process in a loop until the user presses 'q' to quit the application.

8. **Cleanup**: Release the webcam feed and close all OpenCV windows.

## Accuracy and Future Upgrades

This implementation is a basic demonstration of color detection and object tracking. Its accuracy may vary depending on lighting conditions, camera quality, and color variations.

Future upgrades could include:

- Implementing improved color detection mechanisms.
- Adaptive thresholding techniques for accurate detection in varying lighting conditions.
- User interface improvements for easier interaction and customization.

This script serves as a starting point for more advanced color-based computer vision applications.
