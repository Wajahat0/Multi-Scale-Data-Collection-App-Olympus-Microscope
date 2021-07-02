function [Ic, bbox]=detectreg(I2,I3)

I = imresize(rgb2gray(I2),0.25);
I1 = imresize(rgb2gray(I3),0.5);

points=detectSURFFeatures(I,'MetricThreshold',100,'NumOctaves',3, 'NumScaleLevels',6);
points1=detectSURFFeatures(I1,'MetricThreshold',100,'NumOctaves',3, 'NumScaleLevels',6);
[AQ,VPTS1]=extractFeatures(I,points);
[SA,VPTS2]=extractFeatures(I1,points1);
LOV=matchFeatures(AQ,SA,'MatchThreshold',10,'MaxRatio',0.8 ,'Unique',true); %%%%
MATCHEDPOINTS1=VPTS1(LOV(:,1));
MATCHEDPOINTS2=VPTS2(LOV(:,2));
[tform,inlierpts1,inlierpts2,x] = estimateGeometricTransform(MATCHEDPOINTS1,MATCHEDPOINTS2,'similarity', ....
    'Confidence',99.9,'MaxNumTrials',5000, 'MaxDistance',0.5);

boxPolygon = [1, 1;...                           % top-left
        size(I, 2), 1;...                 % top-right
        size(I, 2), size(I, 1);... % bottom-right
        1, size(I, 1);...                 % bottom-left
        1, 1];   
    
newBoxPolygon = transformPointsForward(tform, boxPolygon);
c=transpose(newBoxPolygon(:, 2));
a=transpose(newBoxPolygon(:, 1));
BW = roipoly(I1,a,c);
BW=imresize(BW,2);
stats = regionprops(BW, 'BoundingBox', 'Centroid');
Ic=imcrop(I3,stats.BoundingBox);
bbox= stats.BoundingBox;
end