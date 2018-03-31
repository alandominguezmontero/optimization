funstr = '3*(1-x1).^2.*exp(-(x1.^2)-(x2+1).^2)-10*(x1/5-x1.^3-x2.^5).*exp(-x1.^2-x2.^2)-3*exp(-(x1+1).^2-x2.^2)';
f  = vectorize(inline(funstr));
range = [-3 3 -3 3]; 

N = 50
dx1 = (range(2)-range(1))/N;
dx2 = (range(4)-range(3))/N;

[x1,x2] = meshgrid(range(1):dx1:range(2), range(3):dx2:range(4));

z = (f(x1,x2));

figure(1)
surfc(x1,x2,z)
hold on

k=0;
n=100;

h=0.001;
alpha=0.05;
error = 1;
tol=1e-6;
znn =1


x1range=range(2)-range(1);
x2range=range(4)-range(3);

X1 = rand*x1range + range(1);
X2 = rand*x2range + range(3);

figure(2)

while k<n
    
    zn = f(X1,X2)
    
    error = zn-znn
    if abs(error)<tol
        break
    end
    vx1 = X1 + h;
    vx2 = X2 + h;
    gx1 = (f(vx1, X2) -zn)/h;
    gx2 = (f(X1, vx2) -zn)/h;
    contour(x1,x2,z,15);hold on;
    plot(X1,X2,'.','markersize',28,'markerfacecolor','k');
    drawnow
    figure(1)
    plot3(X1,X2,zn,'.','markersize',28,'markerfacecolor','k')
    xlabel('x1')
    ylabel('x2')
    drawnow
    hold on
    
    X1 = X1 -alpha * gx1;
    X2 = X2 -alpha * gx2;
    
    k = k + 1
    znn = zn;
end
    
    
