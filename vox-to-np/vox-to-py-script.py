import numpy as np
import binvox_rw
with open('toyota-prius.binvox', 'rb') as f:
    model = binvox_rw.read_as_3d_array(f)
print(model.dims)
