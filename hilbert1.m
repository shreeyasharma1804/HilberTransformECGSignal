x = load('ECG_60sec_clean_360Hz.mat');

data = x.ECG_60sec_clean_360;

y = hilbert(data);

f = figure('visible','off');

hold on

plot(data,color='r')
plot(imag(y),color='b')
xlabel('Time(s)')
legend('Original Signal','Hilbert Transform')
saveas(gcf,'ECG.png')
hold off

function result = my_hilbert(s)
    fprintf("Using My Hilbert\n");
    n = length(s)

    %fftLength = 2 ^ nextpow2(2 * n - 1);
    fftLength = n

    H = zeros(1, fftLength);
    H(1) = 1;
    H(2:n / 2) = 2;
    H(n / 2 + 1) = 1;

    x = zeros(1, fftLength);
    x(1:n) = s
    X = fft(x)

    Y = X .* H
    y = ifft(Y)

    result = y(1:n);
end
