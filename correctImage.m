function correctedImage = correctImage(image)
    % Finds centroids of four circles in the image
    circlesCentroids = findCircles(image);
    
    % Define fixed points for transformation taking 'org_1.png' as reference
    fixedPoints = [26.1005   26.0050; 26.3870  445.6450;     
        445.7411   26.5075; 445.9658  445.0861];
    
    % Reorder the points to match in the corresponding images
    circlesCentroids = cell2mat(orderPoints(circlesCentroids, fixedPoints));
    
    % Perform affine transformation with the given points
    myTransform = fitgeotrans(circlesCentroids, fixedPoints, 'affine');   
    transformedImg = imwarp(image, myTransform);
    
    % Crop image and convert to LAB color space for output
    cropSize = [480 480];
    cropWindow = centerCropWindow2d(size(transformedImg), cropSize);
    correctedImage = imcrop(transformedImg, cropWindow);
end

function orderedPoints = orderPoints(movingPoints, fixedPoints)
    % Order points based on their euclidean proximity
    
    % Initialize output array with one point at a fixed position
    orderedPoints = {[4, 2]};
    
    % Create a copy of movingPoints
    tempPoints = movingPoints;
    
    % Loop over each point in movingPoints
    for i = 1:length(movingPoints)
        minDistance = Inf;
        minDistanceIndex = 0;
        
        % Select the current point from fixedPoints
        currentFixedPoint = fixedPoints(i, :);
        
        % Loop over each point in fixedPoints to find the closest one
        for j = 1:length(fixedPoints)
            % Get the current point from fixedPoints
            p2 = fixedPoints(j, :);
            
            % Calculate the Euclidean distance between the two points
            X = [currentFixedPoint; p2];
            currentDistance = pdist(X, 'euclidean');
            
            % Update the minimum distance and index if the current
            % distance is smaller
            if currentDistance < minDistance
                minDistance = currentDistance;
                minDistanceIndex = j;
            end        
        end
        
        % Remove the fixed point from fixedPoints by replacing it with 
        % a point at infinity to avoid selecting it again
        fixedPoints(minDistanceIndex, :) = [Inf -Inf];
        
        % Add the corresponding point from movingPointsCopy to orderedPoints
        orderedPoints{i, 1} = tempPoints(minDistanceIndex, 1);
        orderedPoints{i, 2} = tempPoints(minDistanceIndex, 2);
    end    
end
