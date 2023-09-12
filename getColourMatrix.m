function colors = getColourMatrix(filename)
    % Reads an image from a file, applies correction if possible, and 
    % returns the color matrix

    % Read image data from file
    img = imread(filename);
    
    % Display the original image
    figure;
    subplot(1, 2, 1)
    imshow(img)
    title("Original Image")

    % Check if image can be transformed
    if (canBeTransformed(img))  
        % Correct the image
        correctedImg = correctImage(img);
        
        % Display the corrected image
        subplot(1, 2, 2)
        imshow(correctedImg)
        title("Corrected Image")

        % Get colors from corrected image
        colors = findColours(correctedImg);
    else
        % Get colors from original image
        colors = findColours(img);
    end
end