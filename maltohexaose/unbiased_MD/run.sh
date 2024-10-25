gmx_mpi grompp -f em.mdp -c amyl-maltohexaose_ff99_GMX_box_solv_ion.gro -r amyl-maltohexaose_ff99_GMX_box_solv_ion.gro -p amyl-maltohexaose_ff99_GMX.top -o em.tpr -v
export OMP_NUM_THREADS=1
nohup mpiexec -np 2 gmx_mpi mdrun -deffnm em -gpu_id 1 -pin on -pinoffset 1 -ntomp 1


gmx_mpi grompp -f equil_nvt.mdp -c em.gro -r amyl-maltohexaose_ff99_GMX_box_solv_ion.gro -p amyl-maltohexaose_ff99_GMX.top -n index.ndx -o nvt_eqm.tpr -v
export OMP_NUM_THREADS=1
nohup mpiexec -np 2 gmx_mpi mdrun -deffnm nvt_eqm -gpu_id 1 -pin on -pinoffset 1 -ntomp 1


gmx_mpi grompp -f equil_npt.mdp -c nvt_eqm.gro -r amyl-maltohexaose_ff99_GMX_box_solv_ion.gro -p amyl-maltohexaose_ff99_GMX.top -n index.ndx -o npt_eqm1.tpr -v
export OMP_NUM_THREADS=1
nohup mpiexec -np 2 gmx_mpi mdrun -deffnm npt_eqm1 -gpu_id 1 -pin on -pinoffset 1 -ntomp 1


gmx_mpi grompp -f equil_npt.mdp -c npt_eqm1.gro -r amyl-maltohexaose_ff99_GMX_box_solv_ion.gro -p amyl-maltohexaose_ff99_GMX_noSOL.top -n index.ndx -o npt_eqm2.tpr -v
export OMP_NUM_THREADS=1
nohup mpiexec -np 2 gmx_mpi mdrun -deffnm npt_eqm2 -gpu_id 1 -pin on -pinoffset 1 -ntomp 1


gmx_mpi grompp -f equil_npt3.mdp -c npt_eqm2.gro -p amyl-maltohexaose_ff99_GMX.top -n index.ndx -o npt_eqm3.tpr -v
export OMP_NUM_THREADS=1
nohup mpiexec -np 2 gmx_mpi mdrun -deffnm npt_eqm3 -gpu_id 1 -pin on -pinoffset 1 -ntomp 1



gmx_mpi grompp -f nvt_prod.mdp -c npt_eqm3.gro -p amyl-maltohexaose_ff99_GMX.top -n index.ndx -o nvt_prod.tpr -v
export OMP_NUM_THREADS=1
nohup mpiexec -np 2 gmx_mpi mdrun -deffnm nvt_prod -cpi nvt_prod.cpt -gpu_id 1 -pin on -pinoffset 1 -ntomp 1
