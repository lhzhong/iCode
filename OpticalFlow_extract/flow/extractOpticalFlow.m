path1 = '/home/cpss/caffe/zhong/hmdb51/data/hmdb51/';
path2 = '/home/cpss/caffe/zhong/hmdb51/data/hmdb51_flow/';

folderlist = dir(path1);
foldername = {folderlist(:).name};
foldername = setdiff(foldername,{'.','..'});

for i = 1:length(folderlist)-2
    if ~exist([path2,foldername{i}],'dir')
        mkdir([path2,foldername{i}]);
    end
    filelist = dir([path1,foldername{i},'/*.avi']);

    for j = 1:length(filelist)
        if ~exist([path2,foldername{i},'/',filelist(j).name(1:end-4)],'dir')
            mkdir([path2,foldername{i},'/',filelist(j).name(1:end-4)]);
        end 
        file1 = [path1,foldername{i},'/',filelist(j).name];
        file2 = [path2,foldername{i},'/',filelist(j).name(1:end-4),'/','flow_x'];
        file3 = [path2,foldername{i},'/',filelist(j).name(1:end-4),'/','flow_y'];
        cmd = sprintf('./Flow -f %s -x %s -y %s -b 20',file1,file2,file3);
        system(cmd);
    end
end

