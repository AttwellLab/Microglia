function Surveillance(path, timeline, baseline, ncells)
%THIS CALCULATES THE SURVEILLANCE INDEX (ABSOLUTE AND NORMALISED), RAMIFICATION INDEX AND CUMULATIVE SURVEILLANCE BASED ON BINARISED IMAGES. 
%THE DATA NEEDS TO BE SEPARATED INTO FOLDERS DEPENDING ON THEIR
%TREATMENT/GENOTYPE. 
%EACH FOLDER SHOULD THEN CONTAIN A SUBFOLDER CALLED "binarised" CONTAINING THE BINARISED DATA.
%THE TIMELINE AND BASELINE ON LINES 21 AND 22 NEED TO BE CHANGED ACCORDING TO THE EXPERIMENT-
%USE THE LONGEST RECORDING, IF SOME RECORDINGS ARE SHORTER, IT WON'T MATTER
%THE END GRAPH SHOWS THE CUMULATIVE SURVEILLANCE, THE INITIAL SLOPE (BASED
%ON THE FIRST 2 MINUTES)



% Folder/Genotype/Treatment Names
dirinfo = dir(path);
dirinfo(~[dirinfo.isdir]) = [];
tf = ismember( {dirinfo.name}, {'.', '..'});
dirinfo(tf) = [];
txt={dirinfo.name};

%preallocate matrix for 30 cells THIS NEEDS CHANGING IF N>30 OTHERWISE
%LEAVE IT



for a=1:length(txt)
    %preallocate matrix for 30 cells THIS NEEDS CHANGING IF N>30 OTHERWISE
    %LEAVE IT
    CumSurv.(txt{a}).cells=nan(length(timeline),ncells);
    RamificationIndex.(txt{a}).cells=nan(length(timeline),ncells);
    SurveillanceIndex.(txt{a}).cells=nan(length(timeline)-1,ncells);
    NormalisedSurveillanceIndex.(txt{a}).cells=nan(length(timeline)-1,ncells);
    % file operations
    
    files   = dir([fullfile(path,txt{a},'binarised'),'/*.tif']);
    
    for fls = 1:size(files,1)
        
        % import
        info=imfinfo(fullfile(files(fls).folder,files(fls).name));
        
        for frm = 1:1:min(length(info),length(timeline))
            C(:,:,frm) = imread(fullfile(files(fls).folder,files(fls).name),'Index',frm);
            Area(frm)  = bwarea(C(:,:,frm));
            Peri(frm)  = sum(sum(bwperim(C(:,:,frm),8)));
        end
        C = C>0;
        
        % create cumulative sum
        
        CS(:,:,1) = C(:,:,1);
        for frm = 2:1:min(length(info),length(timeline))
            CS(:,:,frm) = CS(:,:,frm-1)+C(:,:,frm);
        end
        for frm = 1:1:min(length(info),length(timeline))
            dat(frm,1) =sum(sum(CS(:,:,frm)));
        end
        
        C=double(C);
        
        
        %calculate ramification index
        
        RI = ((Peri./Area).*sqrt(Area/pi)/2)';
        
        
         %calculate differences
        for i=1:min(length(info),length(timeline))-1
            D(:,:,i)=C(:,:,i+1)-C(:,:,i);
        end
        
        E = D>0;
        R = D<0;
        
        for k=1:min(length(info),length(timeline))-1
            S(:,:,k)=medfilt2(E(:,:,k))+medfilt2(R(:,:,k));
            SI(k,1)=sum(sum(S(:,:,k)));
        end
        
        %Normalise to baseline
        
        BaseMeanSI = grpstats(SI(baseline)', [], {'mean'});
        SINorm = SI/BaseMeanSI;
        
        
        clearvars C CS D S BaseMeanSI E R
        
       
        
        % store data
        
        for frm = 1:min(length(info),length(timeline))
                CumSurv.(txt{a}).cells(frm,fls) = dat(frm);
                RamificationIndex.(txt{a}).cells(frm,fls) = RI(frm);
        end
        
        for frm = 1:min(length(info),length(timeline))-1
                SurveillanceIndex.(txt{a}).cells(frm,fls) = SI(frm);
                NormalisedSurveillanceIndex.(txt{a}).cells(frm,fls) = SINorm(frm);
        end
        
        [RamificationIndex.(txt{a}).mean, RamificationIndex.(txt{a}).sem, RamificationIndex.(txt{a}).n]= grpstats(RamificationIndex.(txt{a}).cells', [], {'mean', 'sem', 'numel'});
        
        [SurveillanceIndex.(txt{a}).mean, SurveillanceIndex.(txt{a}).sem, SurveillanceIndex.(txt{a}).n]= grpstats(SurveillanceIndex.(txt{a}).cells', [], {'mean', 'sem', 'numel'});
        [NormalisedSurveillanceIndex.(txt{a}).mean, NormalisedSurveillanceIndex.(txt{a}).sem, NormalisedSurveillanceIndex.(txt{a}).n]= grpstats(NormalisedSurveillanceIndex.(txt{a}).cells', [], {'mean', 'sem', 'numel'});
        
        [CumSurv.(txt{a}).mean, CumSurv.(txt{a}).sem, CumSurv.(txt{a}).n]= grpstats(CumSurv.(txt{a}).cells', [], {'mean', 'sem', 'numel'});
        InitSlope.(txt{a}).cells(fls)=(dat(3)-dat(1))/2;
        
        clearvars dat SI RI SINorm Peri Area
        
    end
    [InitSlope.(txt{a}).mean, InitSlope.(txt{a}).sem] = grpstats(InitSlope.(txt{a}).cells, [], {'mean','sem'});
    
       
end

clearvars -except path dirinfo files InitSlope NormalisedSurveillanceIndex SurveillanceIndex RamificationIndex CumSurv timeline baseline txt
ResultsFilename= fullfile(path, 'Results.mat');
save(ResultsFilename)

% basis figure
figure('pos',[500 500 1500 800]);

subplot(151);
for i=1:length(txt);
    errorbar(timeline(2:end),SurveillanceIndex.(txt{i}).mean,SurveillanceIndex.(txt{i}).sem)
    hold on
end
ylim([0 +inf]);
xlabel('Time (min)');
ylabel('Suveillance Index (pixels)');
legend(txt, 'Location', 'southwest');

subplot(152);
for i=1:length(txt);
    errorbar(timeline(2:end),NormalisedSurveillanceIndex.(txt{i}).mean,NormalisedSurveillanceIndex.(txt{i}).sem)
    hold on
end
ylim([0 +inf]);
xlabel('Time (min)');
ylabel('Normalised Suveillance Index');
legend(txt, 'Location', 'southwest');

subplot(153);
for i=1:length(txt);
    errorbar(timeline,RamificationIndex.(txt{i}).mean,RamificationIndex.(txt{i}).sem)
    hold on
end
ylim([0 +inf]);
xlabel('Time (min)');
ylabel('Ramification Index');
legend(txt, 'Location', 'southwest');

subplot(154);
for i=1:length(txt);
    errorbar(timeline,CumSurv.(txt{i}).mean,CumSurv.(txt{i}).sem)
    hold on
end
ylim([0 +inf]);
xlabel('Time (min)');
ylabel('Pixels surveilled');
legend(txt, 'Location', 'southwest');

subplot(155);
for i=1:length(txt);
  b(i)=bar(i, InitSlope.(txt{i}).mean);
  hold on
  errorbar(i, InitSlope.(txt{i}).mean, InitSlope.(txt{i}).sem,'.k')
  
end

ylim([0 +inf]);
ylabel('Initial slope (pixels/min)');
xticklabels(txt)
xticks(1:length(txt));

