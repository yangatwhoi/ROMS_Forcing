# ROMS_Forcing

## Copyright and Contact

The startup scripts include the following original maintainer information:

- Copyright: (c) 2026 Yang Yu
- Author: Yang Yu
- Email: yang.yu@whoi.edu
- Last updated: May 2026

ROMS_Forcing is a MATLAB toolbox collection for preparing forcing and input files for the Regional Ocean Modeling System (ROMS). It includes utilities for grid generation, initial conditions, boundary conditions, atmospheric forcing, tides, river inputs, biogeochemical variables, NetCDF I/O, and visualization.

## Main Features

- Generate and process ROMS grid files
- Create initial condition, boundary condition, and climatology files
- Build atmospheric forcing files from ERA5, CORE2, CCMP, COADS, and related datasets
- Generate initial and boundary files from GLORYS and other reanalysis products
- Prepare tidal forcing and river forcing files
- Process UMaine biogeochemical initial and boundary conditions
- Provide ROMS vertical-coordinate, interpolation, NetCDF, and visualization helper functions

## Directory Layout

```text
ROMS_Forcing/
|-- Data/                  # Example or local input data
|-- Pre_data/              # Preprocessed data
|-- Run/                   # Task-specific run scripts and parameter files
|-- Tool_box/              # General ROMS forcing MATLAB utilities
|-- grid/                  # ROMS grid generation, checking, and editing tools
|-- make_river/            # River input and river biogeochemical tools
|-- mex60/                 # Legacy MATLAB/32-bit mexcdf support
|-- mexcdf/                # NetCDF/MEX related tools
|-- m_map/                 # Mapping toolbox
|-- ncl_color/             # NCL color maps
|-- tidal_data/            # Tide-related data
|-- tidal_ellipse/         # Tidal ellipse analysis tools
|-- t_tide/                # Tidal analysis toolbox
|-- Viewer/                # Viewer utilities
|-- Visualization_tools/   # Visualization tools
|-- start.m                # Main path initialization script
|-- start_windows.m        # Windows path initialization script
`-- start_linux.m          # Linux path initialization script
```

## Quick Start

1. Open MATLAB.
2. Change the current directory to the toolbox root:

   ```matlab
   cd('F:\Modeling_Tools\Roms_tools\ROMS_Forcing')
   ```

3. Set `Run_dir` and load the toolbox paths:

   ```matlab
   Run_dir = pwd;
   start
   ```

4. Go to the target workflow under `Run/`, edit the parameter file, and run `Run.m`.

   Example for ERA5 atmospheric forcing:

   ```matlab
   cd(fullfile(Run_dir, 'Run', 'ERA5_forcing'))
   edit ERA5_forcing_parameter.m
   Run
   ```

## Common Run Workflows

The `Run/` directory contains task-oriented examples and workflows:

- `GRID/`: create or edit a ROMS grid
- `GRID_POM2ROMS/`: convert a POM grid to a ROMS grid
- `GRID_WRF2ROMS/`: convert a WRF grid to a ROMS grid
- `ERA5_forcing/`: create ERA5 atmospheric forcing
- `CORE2_forcing/`: create CORE2 atmospheric forcing
- `CCMP_wind/`: create CCMP wind forcing
- `COADS_dQdSST/`: create COADS-related heat-flux correction input
- `GLORYS_REG_Ini/`: create regional initial conditions from GLORYS
- `GLORYS_REG_Bry/`: create regional boundary conditions from GLORYS
- `BIO_ICBC/`: create biogeochemical initial and boundary conditions
- `River_forcing/`: create river forcing
- `Tide_forcing/`: create tidal forcing
- `Depth_check/`: check bathymetry and grid-related settings

Most workflow folders contain:

- `*_parameter.m`: input paths, time ranges, grid files, output paths, and other settings
- `make_*.m`: main file-generation routines
- `Run.m`: MATLAB entry point
- `Run.sh`: Linux or cluster entry point

## Dependencies

Recommended environment:

- MATLAB
- NetCDF support
- mexcdf/netcdf_toolbox, included under `mexcdf/`
- On Linux, `start_linux.m` can detect part of the MEX setup automatically
- On Windows, `start_windows.m` loads `mexcdf/mexnc` and `mexcdf/netcdf_toolbox`

If your MATLAB version already provides stable native NetCDF support and conflicts with the older mexcdf tools, adjust the `addpath` order in `start_windows.m` or `start_linux.m`.

## Typical Workflow

1. Prepare or generate the ROMS grid file.
2. Prepare external datasets such as ERA5, GLORYS, CORE2, tide data, or river data.
3. Edit the corresponding parameter file under `Run/`.
4. Run the matching `Run.m` script.
5. Check the output NetCDF file dimensions, variable names, time axis, and missing values.
6. Copy or link the generated files into the ROMS project as forcing, initial, boundary, or tide input files.

## Notes

- This directory is currently not a Git repository, so it cannot be updated directly with `git pull`.
- Before running a workflow, check all absolute paths, grid file names, time ranges, and output directories in the parameter file.
- Some data files can be large. It is usually better to store raw and generated NetCDF files on a separate data drive and reference them with absolute paths.
- Compatibility may vary across MATLAB versions, operating systems, and NetCDF/MEX builds.
- Back up `start*.m` before editing shared path settings, especially when this toolbox is used by multiple users.

## Maintenance Suggestions

Initialize this folder as a Git repository if you want to track local changes:

```powershell
& 'C:\Program Files\Git\cmd\git.exe' init
```

Use a consistent naming convention for local parameter files, grid files, and generated outputs. Avoid committing large `.nc` files directly to Git; use a separate data directory or Git LFS if versioning is needed.
