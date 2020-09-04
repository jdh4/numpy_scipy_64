module purge

## build Python ##
cd $HOME/software
wget https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tgz
tar zxf Python-3.8.5.tgz
cd Python-3.8.5
mkdir exec
module load rh/devtoolset/8
./configure --help
./configure --enable-optimizations --prefix=$HOME/software/Python-3.8.5/exec
make -j 10
make test  # some tests fail
make install
./exec/bin/python3 --version

export NPY_USE_BLAS_ILP64=1
export NPY_BLAS_ILP64_ORDER=openblas_ilp64
export NPY_LAPACK_ILP64_ORDER=openblas_ilp64

## build numpy against 64-bit openblas ##
cd $HOME/software
wget https://github.com/numpy/numpy/archive/v1.19.1.tar.gz
tar zxf v1.19.1.tar.gz
cd numpy-1.19.1
wget https://raw.githubusercontent.com/jdh4/numpy_scipy_64/master/numpy/site.cfg
sed -i 's/jdh4/fangx/' site.cfg
$HOME/software/Python-3.8.5/exec/bin/pip3 install --user cython
$HOME/software/Python-3.8.5/exec/bin/python3 setup.py install --prefix=$HOME/.local
cd ~
$HOME/software/Python-3.8.5/exec/bin/python3 -c "import numpy; numpy.show_config()"

## build scipy against 64-bit openblas ##
cd $HOME/software
wget https://github.com/scipy/scipy/releases/download/v1.5.2/scipy-1.5.2.tar.gz
tar zxf scipy-1.5.2.tar.gz
cd scipy-1.5.2
wget https://raw.githubusercontent.com/jdh4/numpy_scipy_64/master/scipy/site.cfg
sed -i 's/jdh4/fangx/' site.cfg
$HOME/software/Python-3.8.5/exec/bin/python3 setup.py install --prefix=$HOME/.local
cd ~
$HOME/software/Python-3.8.5/exec/bin/python3 -c "import scipy; scipy.show_config()"
