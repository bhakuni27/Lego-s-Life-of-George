function result = findColours(img)
    % This function is used to return an array of strings of 
    % categorical colors

    % Convert image to LAB color space
    labImage = rgb2lab(img);
    
    % Crop the image to the center region without the circles
    croppedImage = labImage(75:405, 75:405, :);
    
    % Initialize the result array
    result = string(zeros(4, 4));
    
    % Define the coordinates of the regions of interest
    coordinates = [10, 100, 200, 260];
    
    % Iterate over the coordinates
    for i = 1:length(coordinates)
        y = coordinates(i);
        for j = 1:length(coordinates)
            x = coordinates(j);
            % Extract a single patch of the cropped image
            patch = croppedImage(20+y:25+y, 20+x:25+x, :);
            % Calculate the mean LAB values of the region
            [L, A, B] = meanLAB(patch);
            % Classify the region based on its LAB values
            label = classifyColour(L, A, B);
            % Store the result in the output array
            result(i, j) = label;
        end
    end
end

function [avgL, avgA, avgB] = meanLAB(patch)
    % Calculates and returns the average L*, a*, and b* values from an 
    % input image
    
    avgL = mean(patch(:,:,1), 'all');
    avgA = mean(patch(:,:,2), 'all');
    avgB = mean(patch(:,:,3), 'all');
end

function colorLabel = classifyColour(L, A, B)
    % Accepts mean LAB values and returns color label
    if L > 74
        if A < -36
            colorLabel = "G";  % Green
        elseif B > 35
            colorLabel = "Y";  % Yellow
        else
            colorLabel = "W";  % White
        end
    elseif L < 74 && B < -15
        colorLabel = "B";  % Blue
    elseif abs(A) < 3 && abs(B) < 3
        colorLabel = "W";  % White
    else
        colorLabel = "R";  % Red
    end
end
