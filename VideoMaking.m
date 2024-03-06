fprintf('Select the input image folder:\n')
folder_img = uigetdir;
listing = dir(folder_img);

writervid = VideoWriter('new1.avi');
writervid.FrameRate = 12;
open(writervid);
for i = 1:size(listing,1)
    [pathstr,name,ext] = fileparts(listing(i).name);
    if strcmpi(ext,'.png')
        Img_name= [name ext];
        vid=imread([folder_img '\' Img_name]);
        vid = im2double(vid);
        writeVideo(writervid,vid);
    end
end
close(writervid)