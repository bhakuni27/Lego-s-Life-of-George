function centroids = findCircles(img)
    % Locates four black circles in the image and returns their centroids

    % Convert the image to grayscale and apply Canny edge detection
    gray_img = rgb2gray(img);
    edge_img = edge(gray_img, 'Canny', [0.01, 0.9]);

    % Find connected components and their convex areas
    objects = bwconncomp(edge_img);
    CC = regionprops("table", edge_img, 'ConvexArea');

    % Find the four smallest convex areas
    min_four = mink(CC.ConvexArea, 4);

    % Select connected components with the four smallest convex areas
    idx = ismember(CC.ConvexArea, min_four); 
    pxlList = objects.PixelIdxList;
    % Deletes all false elements
    pxlList(~idx) = [];

    % Calculate the centroid of each connected component
    centroids = zeros(numel(pxlList), 2);
    for i = 1:numel(pxlList)
        [r, c] = ind2sub(size(img), pxlList{i});
        centroids(i, :) = mean([c r]);
    end
end