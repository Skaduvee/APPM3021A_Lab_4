function submission4
%% Question 1.1
Resistance = [1101.0; 911.3; 636.0; 451.1; 233.5];
Temperature = [25.113; 30.131; 40.120; 50.128; 60.136];

[co, T] = NewtonInterp(Resistance, Temperature)
%% Question 1.2
Rq = [1050.1; 901.56; 875.11; 711.40; 545.27; 333.1; 200];

Tq = NewtonInterpolation2(Resistance, Temperature, Rq);

figure(1)
plot(Temperature, Resistance, '-d')
hold on
plot(Tq,Rq, '-*')
legend("T VS R", "Tq VS Rq")
xlabel("Temperature")
ylabel("Resistance")
hold off

%% Question 2.1
N = 60;
xValues = zeros(N,1);
yValues = zeros(N,1);
xqValues = zeros(N/2,1);
newYValues = zeros(N/2,1);

%Set f(x) to x^3 + x + 1:
f = @(x) x^2 + x + 1;

%Intialise the x values for each polynomial.
for i = 1:N
    xValues(i,1) = rand * 10; %Changing rand interval from (0;1) to (0;10).
    if i <= N/2
        xqValues(i,1) = rand * 10;
    end
end
xValues = sort(xValues);
xqValues = sort(xqValues);

%Determine the y values for chosen polynomial.
for i = 1:N
    yValues(i,1) = f(xValues(i,1));
end

%Determine the yq values for newtons divided difference polynomial.
yqValues = NewtonInterpolation2(xValues,yValues,xqValues);

for i = 1:N/2
    newYValues(i,1) = f(xqValues(i,1));
end

figure(2)
plot(xValues,yValues, '-d')
hold on
plot(xqValues, yqValues, '-*')
legend("x VS f(x)", "xq VS yq")
xlabel("x Values")
ylabel("y Values")
hold off

disp("     ");

%% Question 2.2
disp("The inaccuracy at the end points is due to Runge's theorem. When running the code multiple times more often than not the graph did not appear to be a parabola,")
disp("as the end points would be a much greater magnitude compared to the other points. But when the end points did not go to a much greater magnitude a parabola could be seen.")
disp("The End points were still quite off compared to the other interpolating points. The final initial value from the x values used to create the function is also not used in the")
disp("interpolating function which can also cause inaccuracies. The other x values are used in the interpolating function and so those values are quite accurate compared to the actual function.")
disp("            ");

 
 %% Question 3a
f = @(x) (1)/(1+x^2);
N = 5;
x1Values = zeros(N,1);
y1Values = zeros(N,1);
xq1Values = zeros(N,1);
newY1Values = zeros(101,1);

x1Values = -5 + ((5+5)*rand(N,1));
xq1Values = -5 + ((5+5) * rand(101,1));

x1Values = sort(x1Values);
xq1Values = sort(xq1Values);

for i = 1:N
    y1Values(i,1) = f(x1Values(i,1));
end

yq1Values = NewtonInterpolation2(x1Values, y1Values, xq1Values);

for i = 1:101
    newY1Values(i,1) = f(xq1Values(i,1));
end

maxDifference = CalculateMaxDifferenceBetweenYValues(newY1Values, yq1Values);
disp("n = 5      " + "max difference = " + num2str(maxDifference));

figure(3)
subplot(4,1,1)
plot(xq1Values,newY1Values, '-d')
hold on
plot(xq1Values, yq1Values, '-*')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 10;
x1Values = zeros(N,1);
y1Values = zeros(N,1);
xq1Values = zeros(N,1);

x1Values = -5 + ((5+5)*rand(N,1));
xq1Values = -5 + ((5+5) * rand(101,1));

x1Values = sort(x1Values);
xq1Values = sort(xq1Values);

for i = 1:N
    y1Values(i,1) = f(x1Values(i,1));
end

yq1Values = NewtonInterpolation2(x1Values, y1Values, xq1Values);

for i = 1:101
    newY1Values(i,1) = f(xq1Values(i,1));
end

maxDifference = CalculateMaxDifferenceBetweenYValues(newY1Values, yq1Values);
disp("n = 10     " + "max difference = " + num2str(maxDifference));

subplot(4,1,2)
plot(xq1Values,newY1Values, '-d')
hold on
plot(xq1Values, yq1Values, '-*')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 20;
x1Values = zeros(N,1);
y1Values = zeros(N,1);
xq1Values = zeros(N,1);

x1Values = -5 + ((5+5)*rand(N,1));
xq1Values = -5 + ((5+5) * rand(101,1));

x1Values = sort(x1Values);
xq1Values = sort(xq1Values);

for i = 1:N
    y1Values(i,1) = f(x1Values(i,1));
end

yq1Values = NewtonInterpolation2(x1Values, y1Values, xq1Values);

for i = 1:101
    newY1Values(i,1) = f(xq1Values(i,1));
end

maxDifference = CalculateMaxDifferenceBetweenYValues(newY1Values, yq1Values);
disp("n = 10     " + "max difference = " + num2str(maxDifference));

subplot(4,1,3)
plot(xq1Values,newY1Values, '-d')
hold on
plot(xq1Values, yq1Values, '-*')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 50;
x1Values = zeros(N,1);
y1Values = zeros(N,1);
xq1Values = zeros(N,1);

x1Values = -5 + ((5+5)*rand(N,1));
xq1Values = -5 + ((5+5) * rand(101,1));

x1Values = sort(x1Values);
xq1Values = sort(xq1Values);

for i = 1:N
    y1Values(i,1) = f(x1Values(i,1));
end

yq1Values = NewtonInterpolation2(x1Values, y1Values, xq1Values);

for i = 1:101
    newY1Values(i,1) = f(xq1Values(i,1));
end

maxDifference = CalculateMaxDifferenceBetweenYValues(newY1Values, yq1Values);
disp("n = 10     " + "max difference = " + num2str(maxDifference));

subplot(4,1,4)
plot(xq1Values,newY1Values, '-d')
hold on
plot(xq1Values, yq1Values, '-*')
hold off

disp("             ");

 %% Question 3b

 disp("Weierstrass approximation theorem says that any function f that is continous along the interval [a,b] can be approximated with a polynomial P(X), wehre the difference between f(x) and P(X) is less than the error e.");
 disp("This is provided that the values for x are within the interval [a,b]. For my polynomial approximation all the x values were within the interval of [-5,5] however, the more initial x and y values used the higher the order.");
 disp("One would think that the more points used the better the approximation. This is not the case from the graphs seen in question 3a.")
 disp("The error at the end points was so big that the approximation then diverges and is not accurate at the end points. This is Runge's phenomenon.")
 disp("The rand() function made more or less equi-spaced points and so Runge's theorem comes into effect and causes the inaccuracy at the end points, the higher the order of the interpolating functions.")