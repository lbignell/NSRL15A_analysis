%This script will stitch together the two exposures into a single dataset, accounting for any shift that occurred between the exposures.
NumSamples1 = max(size(AllData1_Good));
NumSamples2 = max(size(AllData2_Good));

Run1_mean1 = mean(AllData1_Good((NumSamples1-20):NumSamples1,1));
Run1_mean2 = mean(AllData1_Good((NumSamples1-20):NumSamples1,2));
Run1_mean3 = mean(AllData1_Good((NumSamples1-20):NumSamples1,3));

Run2_mean1 = mean(AllData2_Good((NumSamples2-20):NumSamples2,1));
Run2_mean2 = mean(AllData2_Good((NumSamples2-20):NumSamples2,2));
Run2_mean3 = mean(AllData2_Good((NumSamples2-20):NumSamples2,3));

%Multiply entire Run2 dataset by ratio of 1st and 2nd mean.
Int_PMT5pc = [AllData1_Good(:,1); AllData2_Good(:,1).*(Run1_mean1./Run2_mean1)];
Int_PMTLS = [AllData1_Good(:,2); AllData2_Good(:,2).*(Run1_mean2./Run2_mean2)];
Int_IC = [AllData1_Good(:,3); AllData2_Good(:,3).*(Run1_mean3./Run2_mean3)];
Int_Dose = [AllData1_Good(:,5); (AllData2_Good(:,5) + max(AllData1_Good(:,5)))];
Int_Dose = Int_Dose.*(800./(max(Int_Dose)));