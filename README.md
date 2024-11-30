# Correlating Enzymatic Reactivity for Different Substrates using Transferable Data-Driven Collective Variables

# Sudip Das, Umberto Raucci, Rui P. P. Neves, Maria J. Ramos, Michele Parrinello 

# https://www.pnas.org/doi/abs/10.1073/pnas.2416621121

This archive contains all the input files needed to reproduce the results of the paper.

It has four folders, one for each of the enzyme-substrate complexes, which are maltotriose, maltotetraose, maltopentaose, and maltohexaose.

Each of these four folder contains two sub-folders: 'unbiased_MD' and 'biased_MD'.


In the 'unbiased_MD' folder the following files are available:
- All the GROMACS inputs for classical energy minimization, MD equilibration and production runs.
- All the initial configurations (in GRO format) for independent runs.


In the 'biased_MD' folder the following files are available:
- All the GROMACS inputs.
- Folders 0, 1, 2, 3 contain starting coordinate file for the corresponding replica.
- plumed*.dat is the PLUMED input, npt_eqm3_align2z_CA.pdb is a coordinate alignment file and the *.pt files contain the Deep-TDA neural network model Contact and Water CVs.
- final_path.pdb is the path corresponding to the path CV.



More information about using PLUMED with Pytorch can be found at https://github.com/luigibonati/data-driven-CVs.
More information about OPES can be found at https://github.com/invemichele/opes.
More information about the calculation of high water density spots and their centers can be found at https://github.com/narjesansari/Hydration_spot.git.
More information about Deep TDA CV can be found at https://colab.research.google.com/drive/1TO7bAkmIznsdfea2i5NXfNtytJrnkkIt?usp=sharing.

The simulations were performed with GROMACS 2021.5, PLUMED 2.9 and Pytorch 1.8. 


If you have comments or questions please send an email to das.sudip37@gmail.com
