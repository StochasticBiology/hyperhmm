# hyperhmm
Hypercubic (hidden) Markov models for accumulation modelling

<img width="3100" height="1378" alt="image" src="https://github.com/user-attachments/assets/7cea16b2-3167-4b31-a100-86911973a245" />

Code for HyperHMM [1] to infer the transition probabilities on a hypercubic transition network given some observations of emitted signals from a hidden Markov model on that network. Visualisations of the inferred parameterised model and its summary dynamics are also performed. This is the expectation-maximisation cousin of HyperTraPS https://github.com/StochasticBiology/HyperTraPS (simple implementation here https://github.com/StochasticBiology/hypertraps-simple). 

The codebase for the original article [1] was not in R library format and can be found here https://github.com/StochasticBiology/hypercube-hmm . This repository is an R library version of the same code. It can be installed with

`remotes::install_github("StochasticBiology/hyperhmm")`

[1] Moen, M.T. and Johnston, I.G., 2023. HyperHMM: efficient inference of evolutionary and progressive dynamics on hypercubic transition graphs. Bioinformatics, 39(1), p.btac803.
