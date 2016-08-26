%This is a function that will get a list of all files in a directory and run GetData.m on each.
%The output of GetData.m will be integrated for channels 1, 2, and 3, and the integral vs time will be returned.

function [IntCh1, IntCh2, IntCh3, IntCh4] = RunIntegral(dirname)

  %The Dir command returns a struct with info on the files in the directory.
  theFiles = readdir(dirname);
  IntCh1 = zeros(size(theFiles));
  IntCh2 = zeros(size(theFiles));
  IntCh3 = zeros(size(theFiles));
  IntCh4 = zeros(size(theFiles));  
  
  for i = 1:max(size(theFiles))
    printf("Reading file %s\n", strcat(dirname, theFiles(i){1}))
    %Call GetData and take an integral.
    if max(size(strfind(theFiles(i){1}, 'Data_')))%returns 0 if string doesn't match, 1 otherwise.
    %~(strcmp(theFiles.name,'HeaderInfo.txt'))%theFiles.name ~= 'HeaderInfo.txt'
      [Ch1, Ch2, Ch3, Ch4] = GetData(strcat(dirname,theFiles(i){1}));
      Ch1 = Ch1 - mean(Ch1(1:501));
      Ch2 = Ch2 - mean(Ch2(1:501));
      Ch3 = Ch3 - mean(Ch3(1:501));
      Ch4 = Ch4 - mean(Ch4(1:501));
      IntCh1(i) = sum(Ch1);
      IntCh2(i) = sum(Ch2);
      IntCh3(i) = sum(Ch3);
      IntCh4(i) = sum(Ch4);
    end
  end  
end