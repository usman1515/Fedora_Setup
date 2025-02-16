# URL: https://f4pga-examples.readthedocs.io/en/latest/getting.html#toolchain-installation

#!/bin/bash

# create Tools dir if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# install dependencies
sudo dnf install -y findutils git wget which xz

# clone the examples repo
git clone https://github.com/chipsalliance/f4pga-examples f4pga_examples
cd f4pga_examples

# download conda installer script
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda_installer.sh

# choosing install dir
export CONDA_INSTALL_DIR=$HOME/Tools/miniconda
# select target family FPGAs
export FPGA_FAM=xc7

echo $CONDA_INSTALL_DIR
echo $FPGA_FAM

# install conda
source ./conda_installer.sh -u -p $CONDA_INSTALL_DIR

# check conda version
export PATH="$CONDA_INSTALL_DIR/bin/:$PATH"
conda --version

# INFO: terminal quits at this point

# prevent base conda env from automatically loading at startup
conda config --set auto_activate_base false
conda config --add channels defaults
ls -a ~ | grep ".conda"
cat ~/.condarc

source "$CONDA_INSTALL_DIR/etc/profile.d/conda.sh";

# check for existing conda envs
conda env list

# create conda env
export CONDA_ENV_NAME="f4pga_xc7"
echo $CONDA_ENV_NAME

conda env create -n $CONDA_ENV_NAME -f ~/Tools/f4pga_examples/xc7/environment.yml

conda env list
conda activate $CONDA_ENV_NAME
conda list -v
pip list -v
# conda deactivate

# download architecture definitions
export F4PGA_PACKAGES='install-xc7 xc7a50t_test xc7a100t_test xc7a200t_test xc7z010_test'
echo $F4PGA_PACKAGES

# choosing install dir
export F4PGA_INSTALL_DIR=$HOME/Tools/f4pga
# select target family FPGAs
export FPGA_FAM=xc7

echo $CONDA_INSTALL_DIR
echo $FPGA_FAM
echo $F4PGA_INSTALL_DIR/$FPGA_FAM

mkdir -p $F4PGA_INSTALL_DIR/$FPGA_FAM
cd $F4PGA_INSTALL_DIR/$FPGA_FAM

F4PGA_TIMESTAMP='20220920-124259'
F4PGA_HASH='007d1c1'

echo $F4PGA_TIMESTAMP
echo $F4PGA_HASH

F4PGA_PACKAGE='install-xc7'
wget https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/${F4PGA_TIMESTAMP}/symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz
tar -xJf symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz -C $F4PGA_INSTALL_DIR/$FPGA_FAM

F4PGA_PACKAGE='xc7a50t_test'
wget https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/${F4PGA_TIMESTAMP}/symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz
tar -xJf symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz -C $F4PGA_INSTALL_DIR/$FPGA_FAM

F4PGA_PACKAGE='xc7a100t_test'
wget https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/${F4PGA_TIMESTAMP}/symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz
tar -xJf symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz -C $F4PGA_INSTALL_DIR/$FPGA_FAM

F4PGA_PACKAGE='xc7a100t_test'
wget https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/${F4PGA_TIMESTAMP}/symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz
tar -xJf symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz -C $F4PGA_INSTALL_DIR/$FPGA_FAM

F4PGA_PACKAGE='xc7a200t_test'
wget https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/${F4PGA_TIMESTAMP}/symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz
tar -xJf symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz -C $F4PGA_INSTALL_DIR/$FPGA_FAM

F4PGA_PACKAGE='xc7z010_test'
wget https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/${F4PGA_TIMESTAMP}/symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz
tar -xJf symbiflow-arch-defs-${F4PGA_PACKAGE}-${F4PGA_HASH}.tar.xz -C $F4PGA_INSTALL_DIR/$FPGA_FAM


