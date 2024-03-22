# Optical Character Recognition (OCR) Script Documentation

This script performs Optical Character Recognition (OCR) on an image using the EasyOCR library.
It detects text in the image, overlays bounding boxes and text labels on the image, saves the extracted text to a text file, and displays both the original image and the image with text detection.
Runs on CPU.

## Dependencies

- `matplotlib`: Required for plotting images.
- `numpy`: Required for numerical operations.
- `cv2` (OpenCV): Required for image processing tasks.
- `easyocr`: Required for performing OCR.

## Usage

1. Ensure that all dependencies are installed. You can install them using `pip install <dependency>`.

2. Run the script in a Python environment.

3. When prompted, enter the path to the image file you want to analyze.

4. The script will then perform OCR on the image, overlay bounding boxes and text labels on the image, save the extracted text to a text file named "OCR.txt", and display both the original image and the image with text detection.

## Script Components

### 1. OCR Object Initialization

- The script initializes an OCR object using the EasyOCR library for performing text detection.

### 2. Image Input

- The user is prompted to enter the path to the image file to be analyzed.
- The script reads the image using OpenCV (`cv2.imread()`).

### 3. Text Detection

- Text detection is performed on the image using the OCR object (`read.readtext()`).
- Detected text, along with bounding boxes and confidence scores, are stored in the `result` variable.

### 4. Bounding Box Overlay

- The script overlays bounding boxes and text labels on the original image.
- Bounding boxes are drawn around detected text regions, and text labels are added to the corresponding regions.

### 5. Text Extraction and Saving

- Extracted text is saved to a text file named "OCR.txt".
- The script iterates through the detected text regions and writes each text label to the text file.

### 6. Image Display

- The script displays both the original image and the image with text detection using Matplotlib.
- The original image and the image with text detection are plotted side by side.

## Upgades lined up for this project

- Error handling mechanism.
- Adjustable threshold for confidence scores.
- Modularization of code for better readability and reusability.
