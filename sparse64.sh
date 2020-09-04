module purge
module load anaconda3
conda create --name sparse64 python=3.8 cython -y
conda activate sparse64

mkdir -p $HOME/software
cd $HOME/software

export NPY_USE_BLAS_ILP64=1
export NPY_BLAS_ILP64_ORDER=openblas_ilp64
export NPY_LAPACK_ILP64_ORDER=openblas_ilp64

wget https://github.com/numpy/numpy/archive/v1.19.1.tar.gz
tar zxf v1.19.1.tar.gz
cd numpy-1.19.1
wget https://raw.githubusercontent.com/jdh4/numpy_scipy_64/master/numpy/site.cfg
sed -i 's/jdh4/fangx/' site.cfg
module load rh/devtoolset/8
python setup.py install --prefix=$HOME/.conda/envs/sparse64

cd $HOME/software
wget https://github.com/scipy/scipy/releases/download/v1.5.2/scipy-1.5.2.tar.gz
tar zxf scipy-1.5.2.tar.gz
cd scipy-1.5.2
wget https://raw.githubusercontent.com/jdh4/numpy_scipy_64/master/scipy/site.cfg
sed -i 's/jdh4/fangx/' site.cfg
python setup.py install --prefix=$HOME/.conda/envs/sparse64
