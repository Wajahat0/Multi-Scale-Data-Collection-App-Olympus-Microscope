clear
clc
close all
folder=uigetdir();
a={}
I=dir(fullfile(folder,"*.csv"));
T = importfile(strcat(I(1).folder,'\',I(1).name));
xz=remove_black(imread(strcat(I(1).folder,'\',I(1).name(1:end-9),'1000x.tif')));
[J,rect]=imcrop(xz);
close all
for i=1:length(I)
    x=I(i).name(1:end-9);
    filename = strcat(I(1).folder,'\',x);
    I1000xa = remove_black(imread(strcat(filename,'1000x.tif')));
    I1000x = imcrop(I1000xa,rect);
    I400x = remove_black(imread(strcat(filename,'400x.tif')));
    [Ic, bbox]=detectreg(I1000x,I400x);
    
    I100x = remove_black(imread(strcat(filename,'100x.tif')));
    [Ic1, bbox1]=detectreg(Ic,I100x);
    a{1,1} = strcat('data\CM1\',x,'1000x.tif');
    imwrite(I1000x,strcat('.\data\CM1\',x,'1000x.tif'));
    a{2,1} =strcat('data\CM1\',x,'400x.tif');
    a{2,2} =';';
    a{2,3} =bbox;
    imwrite(I400x,strcat('.\data\CM1\',x,'400x.tif'));
    imwrite(Ic,strcat('.\data\CM1\',x,'400x_T.tif'));
    a{3,1} =strcat('data\CM1\',x,'100x.tif');
    a{3,2} =';';
    a{3,3} =bbox1;
    imwrite(I100x,strcat('.\data\CM1\',x,'100x.tif'));
    imwrite(Ic1,strcat('.\data\CM1\',x,'100x_T.tif'));
    writetable(cell2table(a),strcat('.\data\CM1\',x,'1000x.csv'));
    clear J
    clear I1000xa
    clear I1000x
    clear I400x
    clear I100x
    clear Ic1
    clear Ic
end

        function rgb = remove_black(img);
                 Ib=im2bw(img,0.02);
                 stats = regionprops(Ib, 'BoundingBox', 'Area');
                 [val idx]= max(vertcat(stats.Area));
                 rgb=imcrop(img,stats(idx).BoundingBox);
        end
