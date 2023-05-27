function u = RK4System(f,x,u0)
%
% RK4System uses RK4 method to solve a system of first-
% order ODEs given in the form u' = f(x,u) subject to
% initial condition vector u0.
%
% u = RK4System(f,x,u0) where
%
% f is an inline (m-dim. vector) function
% representing f(x,u),
% x is an (n+1)-dim. vector representing the mesh
% points,
% u0 is an m-dim. vector representing the initial
% condition of u,
%% u is an m-by-(n+1) matrix, each column being the
% vector of solution estimates at a mesh point.
u(:,1) = u0;
% The first column is set to be the initial vector u0
h = x(2) - x(1);
for i = 1:length(x)-1,
k1 = f(x(i),u(:,i));
k2 = f(x(i)+h/2,u(:,i)+h*k1/2);
k3 = f(x(i)+h/2,u(:,i)+h*k2/2);
k4 = f(x(i)+h,u(:,i)+h*k3);
u(:,i+1) = u(:,i)+h*(k1+2*k2+2*k3+k4)/6;
end