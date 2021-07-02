clear
clc
close all
folder=uigetdir();
a={}
I=dir(fullfile(folder,"*.csv"));
T = importfile(strcat(I(1).folder,'\',I(1).name));
xz=imread(strcat(I(1).folder,'\',I(1).name(1:end-9),'1000x.tif'));
ol_path='D:\ITU\21062021\OL\CM1';
% [J,rect]=imcrop(xz);
close all
for i=1:length(I)
    x=I(i).name(1:end-9);
    filename = strcat(I(1).folder,'\',x);
    filename1 = strcat(ol_path,'\',x);
    cI1000x = imread(strcat(filename,'1000x.tif'));
    lI1000x = imread(strcat(filename1,'1000x.tif'));
    [Ic1k, bbox]=detectreg(cI1000x,lI1000x);
    
    
    cI400x = imread(strcat(filename,'400x_T.tif'));
    lI400x = imread(strcat(filename1,'400x_T.tif'));
    [Ic4k, bbox]=detectreg(cI400x,lI400x);
    
    
    
    
    cI100x = imread(strcat(filename,'100x_T.tif'));
    lI100x = imread(strcat(filename1,'100x_T.tif'));
    [Ic01k, bbox]=detectreg(cI100x,lI100x);
 
    imwrite(Ic1k,strcat('.\datal\OL_CM4\',x,'1000x.tif'));
    imwrite(Ic4k,strcat('.\datal\OL_CM4\',x,'400x.tif'));
    imwrite(Ic01k,strcat('.\datal\OL_CM4\',x,'100x.tif'));
    
    imwrite(cI1000x,strcat('.\datal\CM4\',x,'1000x.tif'));
    imwrite(cI400x,strcat('.\datal\CM4\',x,'400x.tif'));
    imwrite(cI100x,strcat('.\datal\CM4\',x,'100x.tif'));
    end

        function rgb = remove_black(img);
                 Ib=im2bw(img,0.02);
                 stats = regionprops(Ib, 'BoundingBox', 'Area');
                 [val idx]= max(vertcat(stats.Area));
                 rgb=imcrop(img,stats(idx).BoundingBox);
        end
