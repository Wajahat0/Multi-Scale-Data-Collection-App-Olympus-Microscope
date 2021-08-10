clear
clc
close all
folder=uigetdir();
a={}
I=dir(fullfile(folder,"*.csv"));
T = importfile(strcat(I(1).folder,'\',I(1).name));
xz=remove_black(imread(strcat(I(1).folder,'\',I(1).name(1:end-9),'1000x.tif')));
[J,rect]=imcrop(xz);
save_path= strcat('.\RAW\',I(1).folder(28:end));
patch_data= strcat('.\Patch\',I(1).folder(28:end));
mkdir(save_path)
mkdir(patch_data)
close all
for i=1:length(I)
    x=I(i).name(1:end-9);
    filename = strcat(I(1).folder,'\',x);
    
    I1000xa = remove_black(imread(strcat(filename,'1000x.tif')));
    I1000x = imcrop(I1000xa,rect);
    
    a{1,1} =strcat(save_path,'\',x,'1000x.tif');
    a{1,2} =';';
    
    I400x = remove_black(imread(strcat(filename,'400x.tif')));
    [Ic, bbox]=detectreg(I1000x,I400x);
    
    a{2,1} =strcat(save_path,'\',x,'400x.tif');
    a{2,2} =';';
    a{2,3} =bbox;
    
    I100x = remove_black(imread(strcat(filename,'100x.tif')));
    [Ic1, bbox1]=detectreg(Ic,I100x);
    
    a{3,1} =strcat(save_path,'\',x,'100x.tif');
    a{3,2} =';';
    a{3,3} =bbox1;
    
    
    imwrite(I1000xa,strcat(save_path,'\',x,'1000x.tif'));
    imwrite(I400x,strcat(save_path,'\',x,'400x.tif'));
    imwrite(I100x,strcat(save_path,'\',x,'100x.tif'));
    writetable(cell2table(a),strcat(save_path,'\',x,'100x.csv'));
    imwrite(I1000x,strcat(patch_data,'\',x,'1000x.png'));
    imwrite(Ic,strcat(patch_data,'\',x,'400x.png'));
    imwrite(Ic1,strcat(patch_data,'\',x,'100x.png'));
    
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
