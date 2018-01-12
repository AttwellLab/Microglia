function [rootpath2, headerlinesIn2]=MicronConvert(rootpath,params)

XY_Resolution = params.XYResolution;
Z_Resolution = params.ZResolution;


files       = dir([rootpath '/*.swc']);
mkdir(rootpath, 'Micron SWCs');
rootpath2 = fullfile(rootpath, 'Micron SWCs');

for a = 1:length(files)
    filename = files(a).name;
    delimiterIn = ' ';
    headerlinesIn = params.headerlinesIn;
    headerlinesIn2 = headerlinesIn+1;

    A= importdata(fullfile(rootpath, filename), delimiterIn, headerlinesIn);
    A.data(:,3) =    (A.data(:,3)+1) * XY_Resolution;
    A.data(:,4) =    (A.data(:,4)+1) * XY_Resolution;
    A.data(:,5) =    (A.data(:,5)+1) * Z_Resolution;
    A.data(:,6) =    A.data(:,6) * XY_Resolution;

    
    
    s = sprintf('%s\n', A.textdata{:});
    
    fid=fopen(fullfile(rootpath2,filename),'w');
    fprintf(fid,'%s\n','#Micron Converted');
    fprintf(fid,s);
    dlmwrite(fullfile(rootpath2,filename), A.data, 'delimiter',' ', '-append');
    fclose('all');
    
    



end