        function rgb = remove_black(img);
                 Ib=im2bw(img,0.02);
                 stats = regionprops(Ib, 'BoundingBox', 'Area');
                 [val idx]= max(vertcat(stats.Area));
                 rgb=imcrop(img,stats(idx).BoundingBox);
        end