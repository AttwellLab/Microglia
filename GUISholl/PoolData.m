function [Int]=PoolData(path1,rootpath,params)


fpath=fullfile(rootpath,sprintf('SR_%d',params.SR));
[~, N, ~] = fileparts(path1);

Brfile = sprintf('%s_%s',N,'Branches.dat');
Tpfile = sprintf('%s_%s',N,'Tips.dat');
Intfile = sprintf('%s_%s',N,'Intersections.dat');

if exist(Brfile, 'file')==2
    delete (Brfile)
    delete (Tpfile)
    delete (Intfile)
end

files=dir([fpath '/*.dat']);

for a=1:length(files)
    A = importdata(fullfile(fpath, files(a).name));
    Br(:,a+1) = A.data(:,2);
    Tp(:,a+1) = A.data(:,3);
    Int(:,a+1) = A.data(:,4);
end

    Br(:,1) = A.data(:,1);
    Tp(:,1) = A.data(:,1);
    Int(:,1) = A.data(:,1);
    
   
    
    Labels = {'SR', files.name};
    [r,nc]=size(Labels);
    
    %Save Branches Pool
    
    fid=fopen(fullfile(fpath,Brfile),'w');
    for c=1:nc
        fprintf(fid, '%s\t',Labels{:,c});
    end
    fprintf(fid, '\n');
    dlmwrite(fullfile(fpath,Brfile), Br, 'delimiter','\t', '-append');
    fclose('all');
    
    %Save Tips Pool
    
    fid = fopen(fullfile(fpath,Tpfile),'w');
    for c=1:nc
        fprintf(fid, '%s\t',Labels{:,c});
    end
    fprintf(fid, '\n');
    dlmwrite(fullfile(fpath,Tpfile), Tp, 'delimiter','\t', '-append');
    fclose('all');
    
    %Save Intersections Pool
    
    fid = fopen(fullfile(fpath,Intfile),'w');
    for c=1:nc
        fprintf(fid, '%s\t',Labels{:,c});
    end
    fprintf(fid, '\n');
    dlmwrite(fullfile(fpath,Intfile), Int, 'delimiter','\t', '-append');
    fclose('all');
    