NumberOfElements = 50;
HinZeroPosition = 3;

Hin = zeros(NumberOfElements,1);
for i=3:NumberOfElements
    if i==3
    	   kroneckerDelta = 1;
    else
           kroneckerDelta = 0;
    end
    Hin(i)= 6*kroneckerDelta-7*(1/6)^((i-3)/2)*cos((i-3)*pi/2+0.775);
end

H = zeros(2*NumberOfElements-1,1);
ZeroPosition = NumberOfElements;
StartFilledPosition = ZeroPosition-HinZeroPosition+1;
EndFilledPosition = StartFilledPosition + NumberOfElements-1;
H(StartFilledPosition:EndFilledPosition) = Hin;
H = fliplr(H'); %% H[m] => H[-m]
H = H';
MaxNofH = find(H,1, 'last')-ZeroPosition;
H(1:NumberOfElements) = H(MaxNofH+1:MaxNofH+NumberOfElements);
H(NumberOfElements+1:end) = zeros(NumberOfElements-1,1);

for i=1:NumberOfElements
    X(i)= (1/4)^(i);
end

XZeroPosition = 1;
NumberOfElementsOfX = NumberOfElements;
No = MaxNofH-(XZeroPosition-1);
ConvolutionWidth = NumberOfElements +NumberOfElementsOfX;
Y = zeros(ConvolutionWidth,1);
YZeroPosition = No;
SlidingWindow = zeros(NumberOfElements, 1);
c=2;
StartXMW = 1;
EndXMW = NumberOfElements;
XMW = X(StartXMW:EndXMW)';
for i=1:ConvolutionWidth-1
    % keyboard;
   if i<=NumberOfElements
        WindowStart = NumberOfElements+1-i;
        SlidingWindow = H(WindowStart:WindowStart+NumberOfElements-1);
    else if i+NumberOfElements>ConvolutionWidth
            SlidingWindow = zeros(NumberOfElements,1);
            SlidingWindow(c:end) = H(1:NumberOfElements+1-c);
            c = c + 1;
        else
            StartXMW = StartXMW+1;
            EndXMW = EndXMW+1;
            XMW = X(StartXMW:EndXMW);
        end
    end
    Y(i)= sum(XMW.*SlidingWindow);
end





%% H(0) = H[-2]
%% H(1) = H[-1]
%% H(2) = H[0]



%% X(0) = X[-2]
%% X(1) = X[-1]
%% X(2) = X[0]