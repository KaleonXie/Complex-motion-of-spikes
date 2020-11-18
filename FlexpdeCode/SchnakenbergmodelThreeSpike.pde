{ Fill in the following sections (removing comment marks ! if necessary),
  and delete those that are unused.}
TITLE 'Schnakenberg'     { the problem identification }
COORDINATES cartesian1  { coordinate system, 1D,2D,3D, etc }
VARIABLES        { system variables }
  u
 v { choose your own names }
w 
 SELECT         { method controls }
ERRLIM=1e-5
 DEFINITIONS    { parameter definitions }
eps=0.01
Du=eps^2
Dv=1/500
b=1/2
 L=1
v0=6*3
!u0=3/2*(1/(cosh((x+2/3-0.1)/2/0.01))^2+1/(cosh( (x-0.1)/2/0.01))^2+1/(cosh( (x-2/3-0.1)/2/0.01))^2 )/v0 ! (1,1,1)
u0=3/2*(1/(cosh((x+2/3-0.1)/2/0.01))^2+1/(cosh( (x)/2/0.01))^2+1/(cosh( (x-2/3)/2/0.01))^2 )/v0!  (1,1,-1)
!u0=3/2*(1/(cosh((x+2/3-0.1)/2/0.01))^2+1/(cosh( (x-0.01)/2/0.01))^2+1/(cosh( (x-2/3+0.1)/2/0.01))^2 )/v0! (1,0,-1)
tau=3000
sigma=0
theta=0

int1=integral( (dxx(u))^2)
int2=integral( (dx(u))^2)
INITIAL VALUES
u=u0
v=v0
w=u0
EQUATIONS        { PDE's, one for each variable }
u: dt(u)=Du*dxx(u)-0.8*u+u^2*v-0.2*w
v: 0.001*dt(v)=Dv*dxx(v)+b-u^2*v/eps
w: (5+tau*eps^2)*dt(w)=u-w

! CONSTRAINTS    { Integral constraints }
BOUNDARIES       { The domain definition }
  REGION 1       { For each material region }
    START (-L)   { Walk the domain boundary }
 point natural(u)=0
 point natural(v)=0
  point natural(w)=0
    LINE TO  (L)
    
    Region 2 "left"
    start (-1) line to (-0.33)
    Region 3 "mid"
        start (-0.33) line to (0.33)
    Region 4 "right"
    start(0.33) line to (1)
    
    
    
TIME 0 by 0.1 TO 3000000   { if time dependent }
MONITORS
for cycle=200 { show progress }
elevation(u0,u,w) from (-L) to (L) report( int2/int1) !REPORT(tau) 
elevation(v) from(-L) to (L)

plots

for cycle=200
history( globalmax_x(u,"left"))  export format "#t#r,#i" 
history( globalmax_x(u,"mid"))  export format "#t#r,#i" 
history(globalmax_x(u,"right"))  export format "#t#r,#i" 

END


