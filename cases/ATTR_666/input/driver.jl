using WAVI 
function driver()

#
#Grid and boundary conditions
#
nx = 160
ny = 20
nσ = 4
x0 = 0.0
y0 = -40000.0
dx = 4000.0
dy = 4000.0
h_mask=trues(nx,ny)
u_iszero = falses(nx+1,ny); u_iszero[1,:].=true
v_iszero=falses(nx,ny+1); v_iszero[:,1].=true; v_iszero[:,end].=true
grid = Grid(nx = nx, 
            ny = ny,   
            nσ = nσ, 
            x0 = x0, 
            y0 = y0, 
            dx = dx, 
            dy = dy,
            h_mask = h_mask, 
            u_iszero = u_iszero, 
            v_iszero = v_iszero)

#
#Bed 
#
function modified_mismip_plus_bed(x,y)
    xbar = 300000.0
    b0 = -200.0; b2 = -728.8; b4 = 343.91; b6 = -50.75*0.95;
    wc = 24000.0; fc = 4000.0; dc = 500.0
    bx(x)=b0+b2*(x/xbar)^2+b4*(x/xbar)^4+b6*(x/xbar)^6
    by(y)= dc*( (1+exp(-2(y-wc)/fc))^(-1) + (1+exp(2(y+wc)/fc))^(-1) )
    b = max(bx(x) + by(y), -720.0)
    return b
end
bed = modified_mismip_plus_bed;


#
#solver parameters
#
maxiter_picard = 1
solver_params = SolverParams(maxiter_picard = maxiter_picard)

#
#Physical parameters
#
default_thickness = 100.0 #set the initial condition this way
accumulation_rate = 0.3
params = Params(default_thickness = default_thickness, 
                accumulation_rate = accumulation_rate)

#
#make the model
#
model = Model(grid = grid,
              bed_elevation = bed, 
              params = params, 
              solver_params = solver_params)

#
#timestepping parameters
#
niter0 = 0
dt = 0.1
end_time = 100.
chkpt_freq = 10.
pchkpt_freq = 10.
timestepping_params = TimesteppingParams(niter0 = niter0, 
                                         dt = dt, 
                                         end_time = end_time, 
                                         chkpt_freq = chkpt_freq, 
                                          pchkpt_freq = pchkpt_freq)

#
#output parameters
#
outputs = (h = model.fields.gh.h,
           u = model.fields.gh.u,
           v = model.fields.gh.v,
	   b = model.fields.gh.b,
	   s = model.fields.gh.s)
output_freq = 1.
output_params = OutputParams(outputs = outputs, 
                            output_freq = output_freq,
                            output_format = "mat",
                            dump_vel = true,
			    zip_format = "nc")

#
# assemble the simulation
#
simulation = Simulation(model = model, 
                        timestepping_params = timestepping_params, 
                        output_params = output_params)
                
#
#perform the simulation
#
run_simulation!(simulation)

return simulation
end

driver()

