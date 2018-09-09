iterations = 50;

Y = zeros(iterations,1);
Y(1) = 0; %Y[-2] = 0 
Y(2) = 0; % Y[-1] = 0

for i=3:iterations
    if i==3
        Input = 1;
    else if i==4
        Input = 2;
        else if i==5
        Input = 1;
            else
                Input = 0;
            end
        end
    end
    Y(i)= Input-(1/6)*Y(i-2);
end

figure(1),
stem(-2:length(Y)-3, Y),
xlabel('N'),
ylabel('H[n]'),
title('Solução Iterativa de H[n]')

H = zeros(length(Y),1);
for i=3:iterations
    if i==3
    	   kroneckerDelta = 1;
    else
           kroneckerDelta = 0;
    end
    H(i)= 6*kroneckerDelta-7*(1/6)^((i-3)/2)*cos((i-3)*pi/2+0.775);
end

figure(2),
stem(-2:length(H)-3, H),
xlabel('N'),
ylabel('H[n]'),
title('Solução Analítica de H[n]')


    