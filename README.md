# Building 64-bit NumPy and SciPy

After installing:

```
$ python
>>> import numpy as np
>>> np.show_config()
...
>>> import scipy as sp
>>> sp.show_config()
```

From the mailing list:

Yes, set NPY_USE_BLAS_ILP64=1.  https://docs.scipy.org/doc/scipy/reference/building/index.html#reference-for-build-options You'll need a 64-bit ilp64 openblas https://numpy.org/devdocs/user/building.html#bit-blas-and-lapack Probably easiest to grab the one used in the CI https://github.com/scipy/scipy/blob/master/.travis.yml#L170-L176
