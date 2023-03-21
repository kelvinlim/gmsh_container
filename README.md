# gmsh_container

Build an apptainer container to run the gmsh program avoiding problems with 
missing library on MSI Centos 7.  

```
OSError: /lib64/libm.so.6: version `GLIBC_2.23' not found (required by /panfs/jay/groups/20/limko/kolim/Projects/gmsh_container/.venv/lib/libgmsh.so.4.11)
```

## to create a recipe from a Dockerfile

```
$ apptainer recipe Dockerfile > gmsh.def

# build a container from a def file
$ apptainer build gmsh.sif gmsh.def
```

## Deploying

1. Copy the gmsh.sif and gmsh.def into the same directory, (e.g. /home/limko/public/gmsh_app)
2. Check that gmsh.sh is executable (e.g. chmod a+x gmsh.sh)
3. Add the directory to your path; preferably in your ~/.bashrc file
    ```
    export PATH=/home/limko/public/gmsh_app:$PATH
    ```
4. To run gmsh in a vnc desktop
    ```
    gmsh.sh
    ```

## gmsh command line arguments
```
Apptainer> gmsh --help
Gmsh, a 3D mesh generator with pre- and post-processing facilities
Copyright (C) 1997-2020 C. Geuzaine and J.-F. Remacle
Usage: gmsh [options] [files]
(Related option names, if any, are given between parentheses)
Geometry:
  -0                   Output model, then exit
  -tol value           Set geometrical tolerance (Geometry.Tolerance)
  -match               Match geometries and meshes
Mesh:
  -1, -2, -3           Perform 1D, 2D or 3D mesh generation, then exit
  -save                Save mesh, then exit
  -o file              Specify output file name
  -format string       Select output mesh format: auto, msh1, msh2, msh22, msh3, msh4, msh40, msh41, msh, unv, vtk, wrl, mail, stl, p3d, mesh, bdf, cgns, med, diff, ir3, inp, ply2, celum, su2, x3d, dat, neu, m, key (Mesh.Format)
  -bin                 Create binary files when possible (Mesh.Binary)
  -refine              Perform uniform mesh refinement, then exit
  -barycentric_refine  Perform barycentric mesh refinement, then exit
  -reclassify angle    Reclassify surface mesh, then exit
  -reparam angle       Reparametrize surface mesh, then exit
  -part int            Partition after batch mesh generation (Mesh.NbPartitions)
  -part_weight [tri,quad,tet,hex,pri,pyr,trih] int Weight of a triangle/quad/etc. during partitioning (Mesh.Partition[Tri,Quad,...]Weight)
  -part_split          Save mesh partitions in separate files (Mesh.PartitionSplitMeshFiles)
  -part_[no_]topo      Create the partition topology (Mesh.PartitionCreateTopology)
  -part_[no_]ghosts    Create ghost cells (Mesh.PartitionCreateGhostCells)
  -part_[no_]physicals Create physical groups for partitions (Mesh.PartitionCreatePhysicals)
  -part_topo_pro       Save the partition topology .pro file (Mesh.PartitionTopologyFile)
  -preserve_numbering_msh2 Preserve element numbering in MSH2 format (Mesh.PreserveNumberingMsh2)
  -save_all            Save all elements (Mesh.SaveAll)
  -save_parametric     Save nodes with their parametric coordinates (Mesh.SaveParametric)
  -save_topology       Save model topology (Mesh.SaveTopology)
  -algo string         Select mesh algorithm: auto, meshadapt, del2d, front2d, delquad, pack, initial2d, del3d, front3d, mmg3d, hxt, initial3d (Mesh.Algorithm and Mesh.Algorithm3D)
  -smooth int          Set number of mesh smoothing steps (Mesh.Smoothing)
  -order int           Set mesh order (Mesh.ElementOrder)
  -optimize[_netgen]   Optimize quality of tetrahedral elements (Mesh.Optimize[Netgen])
  -optimize_threshold  Optimize tetrahedral elements that have a quality less than a threshold (Mesh.OptimizeThreshold)
  -optimize_ho         Optimize high order meshes (Mesh.HighOrderOptimize)
  -ho_[min,max,nlayers] High-order optimization parameters (Mesh.HighOrderThreshold[Min,Max], Mesh.HighOrderNumLayers)
  -clscale value       Set mesh element size factor (Mesh.MeshSizeFactor)
  -clmin value         Set minimum mesh element size (Mesh.MeshSizeMin)
  -clmax value         Set maximum mesh element size (Mesh.MeshSizeMax)
  -clcurv value        Compute mesh element size from curvature, with given minimum number of elements per 2*pi radians (Mesh.MeshSizeFromCurvature and Mesh.MinimumElementsPerTwoPi)
  -aniso_max value     Set maximum anisotropy for bamg (Mesh.AnisoMax)
  -smooth_ratio value  Set smoothing ration between mesh sizes at nodes of a same edge for bamg (Mesh.SmoothRatio)
  -epslc1d value       Set accuracy of evaluation of mesh size field for 1D mesh (Mesh.LcIntegrationPrecision)
  -swapangle value     Set the threshold angle (in degrees) between two adjacent faces below which a swap is allowed (Mesh.AllowSwapAngle)
  -rand value          Set random perturbation factor (Mesh.RandomFactor)
  -bgm file            Load background mesh from file
  -check               Perform various consistency checks on mesh
  -ignore_periocity    Ignore periodic boundaries (Mesh.IgnorePeriodicity)
Post-processing:
  -link int            Select link mode between views (PostProcessing.Link)
  -combine             Combine views having identical names into multi-time-step views
Solver:
  -listen              Always listen to incoming connection requests (Solver.AlwaysListen)
  -minterpreter string Name of Octave interpreter (Solver.OctaveInterpreter)
  -pyinterpreter string Name of Python interpreter (Solver.OctaveInterpreter)
  -run                 Run ONELAB solver(s)
Display:
  -n                   Hide all meshes and post-processing views on startup (View.Visible, Mesh.[Points,Lines,SurfaceEdges,...])
  -nodb                Disable double buffering (General.DoubleBuffer)
  -numsubedges         Set num of subdivisions for high order element display (Mesh.NumSubEdges)
  -fontsize int        Specify the font size for the GUI (General.FontSize)
  -theme string        Specify FLTK GUI theme (General.FltkTheme)
  -display string      Specify display (General.Display)
  -camera              Use camera mode view (General.CameraMode)
  -stereo              OpenGL quad-buffered stereo rendering (General.Stereo)
  -gamepad             Use gamepad controller if available
Other:
  -, -parse_and_exit   Parse input files, then exit
  -new                 Create new model before merge next file
  -merge               Merge next files
  -open                Open next files
  -log filename        Log all messages to filename
  -a, -g, -m, -s, -p   Start in automatic, geometry, mesh, solver or post-processing mode (General.InitialModule)
  -pid                 Print process id on stdout
  -watch pattern       Pattern of files to merge as they become available (General.WatchFilePattern)
  -bg file             Load background (image or PDF) file (General.BackgroundImageFileName)
  -v int               Set verbosity level (General.Verbosity)
  -nopopup             Don't popup dialog windows in scripts (General.NoPopup)
  -string "string"     Parse command string at startup
  -setnumber name value Set constant or option number name=value
  -setstring name value Set constant or option string name=value
  -option file         Parse option file at startup
  -convert files       Convert files into latest binary formats, then exit
  -nt int              Set number of threads (General.NumThreads)
  -cpu                 Report CPU times for all operations
  -version             Show version number
  -info                Show detailed version information
  -help                Show command line usage
  -help_options        Show all options
Apptainer> 

```

