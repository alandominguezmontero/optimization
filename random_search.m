funstr = '3*(1-x).^2.*exp(-(x.^2)-(y+1).^2)-10*(x/5-x.^3-y.^5).*exp(-x.^2-y.^2)-3*exp(-(x+1).^2-y.^2)';
f = vectorize(inline(funstr));
range=[-3 3 -3 3];

N =50

dx=(range(2)-range(1))/N;
dy=(range(4)-range(3))/N;

[x,y]=meshgrid(range(1):dx:range(2), range(3):dy:range(4));

z=f(x,y)

figure(1)
surfc(x,y,z)

Niter=3000;
k=0;
data=1;

xrange=range(2)-range(1);
yrange=range(4)-range(3);
xn=rand*xrange+range(1);
yn=rand*yrange+range(3);
figure

while(k<Niter)

 if ((xn>=range(1))&(xn<=range(2))&(yn>=range(3))&(yn<=range(4)))
  zn1=f(xn,yn); 
 else
     zn1=-1000;
 end
  contour(x,y,z,15); hold on;    
  plot(xn,yn,'.','markersize',28,'markerfacecolor','k');
  drawnow;
  hold off;
  xnc=xn+randn*1;
  if ((xnc>=range(1))&(xnc<=range(2))&(ync>=range(3))&(ync<=range(4)))
      zn2=f(xnc,ync); 
  else
     zn2=-1000;
 end
   if (zn2>zn1)
      xn=xnc;
      yn=ync;
      element1(data)=xn;
      element2(data)=yn;
      data=data+1;
  end
  k=k+1;
  end