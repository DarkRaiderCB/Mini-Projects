import matplotlib.pyplot as plt
import numpy as np
import cv2
import easyocr as ocr


# OCR Object
read = ocr.Reader(['en'], gpu = False)

# read image
loc = input('Enter image path: ')
img = cv2.imread(loc)

# detect text in image
result = read.readtext(img)
print(result)

# determine confidence threshold
threshold = 0.5

# making bounding box, text, and checking confidence value
for idx, val in enumerate(result):
    print(val)
    boundBox = val[0]
    text = val[1]
    score = val[2]
    if score > threshold:
        cv2.rectangle(img, boundBox[0], boundBox[2], (200, 0, 0), 4)
        cv2.putText(img, text, boundBox[0], cv2.FONT_HERSHEY_TRIPLEX, 0.7, (0, 0, 200), 2)

# Saving extracted text to text file
filepath = "OCR.txt"
with open(filepath, "w") as textFile:
    for val in result:
        textFile.write(str(val[1]) + "\n")

# Display message on the output image
message = "Text file generated by name 'OCR.txt'"
cv2.putText(img, message, (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 2)

# plotting
# original image
fig, axes = plt.subplots(1, 2, figsize=(12, 6))
axes[0].imshow(cv2.cvtColor(cv2.imread(loc), cv2.COLOR_BGR2RGB))
axes[0].set_title('Original Image')
axes[0].axis('off')
# Output Image
axes[1].imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
axes[1].set_title('Image with Text Detection')
axes[1].axis('off')
# Display
plt.tight_layout()
plt.show()
