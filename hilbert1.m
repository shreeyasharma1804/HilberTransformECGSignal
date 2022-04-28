
%Design and Implement Hilbert transformer to get a Hilbert transform an ECG signal. 
% Use DFT for design of Hilbert transformer. Refer the textbook for more details. Use Fs=360 Hz and suitable block duration

x = load('ECG_60sec_clean_360Hz.mat');                                     %Loading the required ECG signal
data = x.ECG_60sec_clean_360;                                              %Accessing the file

y_algorithm = my_hilbert(data);                                            %Assigning the ouput of the my_hilbert function that we designed
y_inbuilt= hilbert(data);                                                  %Assigning the output to inbuilt hilbert function in matlab
                                                                           %using imag(y) because imag(y) gives us the hilbert transform of the signal
plot(imag(y_algorithm), color='r')                                         %Plotting the graph of designed hilbert function output
title("Using Designed Hilbert Function")                                   %Labelling the Axes
xlabel("Time(s)")
ylabel('Hilbert Transformed ECG Signal')
figure()

plot(imag(y_inbuilt), color='g')                                           %Plotting the graph of inbuilt hilbert function output
title("Using Inbuilt Hilbert Function")                                    %Labelling the Axes
xlabel("Time(s)")
ylabel('Hilbert Transformed ECG Signal')
figure()
hold on
plot(real(data),color='b')                                                 %Plotting the original ECG signal
plot(imag(y_algorithm),color='r')                                          %Plotting the hilbert function that we designed in the same graph
saveas(gcf,'ECG.png')
xlabel("Time(s)")
ylabel('Signals')
legend('Original ECG Signal', 'Hilbert Transformed ECG Signal')
hold off


%my_hilbert function computes the hilbert transform of the signal and gives
%it as the output
function result = my_hilbert(s)
   
    n = length(s)               %Assigning n as the length of the ECG signal 
    fftLength = n
    H = zeros(1, fftLength);
    H(1) = 1;
    H(2:n / 2) = 2;
    H(n / 2 + 1) = 1;
    x = zeros(1, fftLength);
    x(1:n) = s
    X = fft(x)                  %Taking the Discrete Fourier Transform of x
    Y = X .* H
    y = ifft(Y)                 %Taking Inverse Discrete Fourier Transform of Y. 
    result = y(1:n);
end
