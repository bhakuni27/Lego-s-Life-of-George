# Lego-s-Life-of-George
This project mimics the game Lego's Life of George, in which a player must recall and reassemble Lego blocks from an image that is displayed on the screen for a brief period of time. MATLAB was used to create a program that would correct a set of images with various flaws, such as noise, rotation, and projections, and then return an array that accurately represented the 16-square coloured blocks as strings.

## Strategy
To retrieve an array representing the colour pattern of a colour pattern image from a hard disc. Initially, the image will be loaded into the program. Then, the image will be checked for any transformations needed. If the image is projected or rotated, it will be corrected to ensure proper alignment. Next, the colour matrix will be found by locating the position of each square using a segmentation technique, such as thresholding, and then extracting the colour value from each square. This process will be robust to noise and changes in lighting conditions by using appropriate filtering and normalization techniques. Finally, the colour values will be returned as an array of strings representing each square in the image.

### Case 1
<img width="197" alt="image" src="https://github.com/bhakuni27/Lego-s-Life-of-George/assets/45992837/7f370b6e-639b-4b38-8464-9ec52b829f39">
<img height="130" width="410" alt="image" src="https://github.com/bhakuni27/Lego-s-Life-of-George/assets/45992837/fec5b462-6662-4f34-88b8-3e3ed376da5e">

### Case 2
<img width="594" alt="image" src="https://github.com/bhakuni27/Lego-s-Life-of-George/assets/45992837/43e13a9c-6a57-4e1f-9a95-5a5448d3aff3">
<img height="130" width="410" alt="image" src="https://github.com/bhakuni27/Lego-s-Life-of-George/assets/45992837/4010a88d-5ea8-4980-abf9-c0f622e084be">  


> **NOTE:** Requires Statics and Machine Learning toolkit of MATLAB.
