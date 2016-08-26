%This script will eliminate the outliers from the integrated waveform dataset.
ResponsePMT1 = zeros(size(AllData_BeamOn(:,1)));
ResponsePMT2 = zeros(size(AllData_BeamOn(:,1)));

for i=1:max(size(AllData_BeamOn))
  ResponsePMT1(i) = AllData_BeamOn(i,1)./AllData_BeamOn(i,3);
  ResponsePMT2(i) = AllData_BeamOn(i,2)./AllData_BeamOn(i,3);
  if (0.6<ResponsePMT1(i))||(ResponsePMT1(i)<0.35)
    ResponsePMT1(i) = ResponsePMT1(i-1);
    end
  if (0.6<ResponsePMT2(i))||(ResponsePMT2(i)<0.35)
    ResponsePMT2(i) = ResponsePMT2(i-1);
  end
end
