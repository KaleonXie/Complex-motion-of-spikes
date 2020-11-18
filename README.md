# Complex-motion-of-spikes
Codes for the paper `Complex oscillatory motion of multiple spikes in a three-component Schnakenberg system' by S.Xie, T.Kolokolnikov, Y.Nishiura (2020).
arXiv:2006.04801v1

The file FlexpdeCode contains the flexpde code for PDE simulation. Running the code within it will produce .p01,p02,p03 data, which describes the location of the spike center.   

The codes in OneSpike, TwoSpikes, ThreeSpikes will read the data from PDE simulation and conduct ODE simulations.



Matrices.m contains the matrix M_1 and M_2 defined in the paper. run it to verify the Eq.~125.
