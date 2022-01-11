# preamble
library('mrgsolve')

# load models
nameless_model <- mrgsolve::mread(model = 'nameless', file = 'nameless.cpp')

# run first model
sim <- nameless_model %>%
  mrgsim(
    delta = 1,
    hmax = 0,
    maxsteps = 1e9,
    atol = 1e-7,
    rtol = 1e-4,
    end = 120
  )

# plot results
plot <- sim %>%
    plot(type='l')

# show
plot