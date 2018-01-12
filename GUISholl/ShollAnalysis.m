function ShollAnalysis(rootpath, params, headerlinesIn)
%Script for Sholl Analysis
%Lorena Arancibia 19/07/2016

%Ammended 11/06/2017


%Define Soma radius:
Soma = params.Soma;
%Define Sholl Radius:
SR = params.SR;
%Define Max Radius
MR = params.MR;
%Sholl Radii
edges=[Soma:SR:MR];
%Create results table (columns: Sholl Rdius, Branches, Terminals,
%Intersections)
Results = [edges' zeros(length(edges),3)];


files       = dir([rootpath '/*.swc']);
mkdir(rootpath, sprintf('SR_%d', SR));
fpath = fullfile(rootpath, sprintf('SR_%d', SR));

for a=1:length(files);

    filename = files(a).name;
    delimiterIn = ' ';
    

    A= importdata(fullfile(rootpath, filename), delimiterIn, headerlinesIn);
    

    % Create a column calculating the distance from centre
    d = bsxfun(@minus, A.data(:,3:5), A.data(1,3:5));
    A.data(:,8) = sqrt(sum(d.^2,2));

    %Find branches
    %Branch nodes are those that are parent to 2 children
    Parents = unique(A.data(:,7)); %define parents
    ParentCounts = [Parents, histc(A.data(:,7),Parents)]; %Bin parents and find number of ocurrences
    ParentCounts(ParentCounts(:,2)==1,:) = []; %Removes lines where ocurrence is only once
    Br = A.data(ismember(A.data(:,1), ParentCounts(:,1)),:); %Create matrix with data for branch points only

    % Find number of branches within each Sholl Radius
    Results(2:end,2) = histcounts(Br(:,8), edges);

    %Find Terminal points
    tips=A.data(~ismember(A.data(:,1), Parents),:);

    % Find number of terminal points within each Sholl Radius
    Results(2:end,3) = histcounts(tips(:,8), edges);

    %Find Intersections
    for i=1:length(edges);
        c = find (A.data(:,8)>=edges(i)); %find all nodes more than Sholl sphere away from soma
        e=find(ismember(A.data(:,7),c)); %find all parents more than Sholl sphere away from soma
        f=find(A.data(e,8)<edges(i)); %find children that are closer to soma than sholl sphere
        Results(i,4) = sum(~ismember(A.data(c,7),A.data(c,1)))+numel(f);
        clearvars c e f
    end

    

    %Save results in tab delimited file
    idx = strfind(files(a).name, '.swc'); %find .tif in filename
    
       newfile=sprintf('%s%s',files(a).name(1:idx-1),'.dat');
    
   
    
        
    fid=fopen(fullfile(fpath,newfile),'w');
    fprintf(fid, '%s\t%s\t%s\t%s\n','SR','Branches','Terminal points', 'Intersections');
    dlmwrite(fullfile(fpath,newfile), Results, 'delimiter','\t', '-append');
    fclose('all');

    %clear variants before next loop
    clearvars Br d ParentCounts Parents
end
