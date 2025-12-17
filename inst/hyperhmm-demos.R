### simple demos of R embedding of HyperHMM

# source code for inference
library(hyperhmm)
library(ggpubr)

### first -- just do inference on a very simple example. we model two observations, 001 and 011
# construct toy example
m = matrix(c(0,0,1,0,1,1), byrow=TRUE, ncol=3)
# do inference
fitted = HyperHMM(m)

m = matrix(c(0,0,0,0,0,0,0,0,0,0,0,0), byrow=TRUE, ncol=3)
fitted = HyperHMM(m)

# produce a set of plots. here we use a syntax to demonstrate back-compatibility
plot_bubs = plot_bubbles(fitted, formatted=TRUE)
plot_cube = plot_hypercube(fitted, use.width = TRUE, node.labels=FALSE, seg.labels = TRUE, threshold=0, rotate.phi=FALSE)
plot_diag = plot_pfg(fitted, pfg.layout="matrix")

# and arrange plots together
ggarrange(plot_bubs, plot_cube, plot_diag, nrow=1)

### some less trivial examples using the two-pathway synthetic model
m.1 = matrix(c(0,0,0,0,0,
                   1,0,0,0,0,
                   1,1,0,0,0,
                   1,1,1,0,0,
                   1,1,1,1,0,
                   0,0,0,0,0,
                   0,0,0,0,1,
                   0,0,0,1,1,
                   0,0,1,1,1,
                   0,1,1,1,1), byrow=TRUE, ncol = 5)

m.2 = matrix(c(1,0,0,0,0,
                   1,1,0,0,0,
                   1,1,1,0,0,
                   1,1,1,1,0,
                   1,1,1,1,1,
                   0,0,0,0,1,
                   0,0,0,1,1,
                   0,0,1,1,1,
                   0,1,1,1,1,
                   1,1,1,1,1), byrow=TRUE, ncol = 5)

fit.1 = HyperHMM(m.2)
plot_standard(fit.1)
fit.2 = HyperHMM(m.2, initialstates = m.1, outputinput = 1)
plot_standard(fit.2)

### now use some data -- from the ovarian cancer case study
fname <- system.file("extdata", "ovarian.txt", package = "hyperhmm")
cgh.raw = readLines(fname)
cgh.mat = do.call(rbind, lapply(strsplit(cgh.raw, ""), as.numeric))
fit.cgh = HyperHMM(cgh.mat)
plot_standard(fit.cgh)
# rather nicer hypercube visualisation
plot_hypercube.flux(fit.cgh)
