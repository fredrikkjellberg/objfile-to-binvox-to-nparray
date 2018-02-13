# objfile-to-binvox-to-nparray

This is a set of tools to help transform a 3D object file like a car or hand into a 3D numpy array by first transforming it into a voxal space (think mind craft) and then import it into python as an numpy array.

## Obj-to-vox

[Binvox](http://www.cs.princeton.edu/~min/binvox/) is a little program to
convert 3D models into binary voxel format. The `.binvox` file format is a
simple run length encoding format described here [Binvox](http://www.cs.princeton.edu/~min/binvox/)

(http://www.cs.princeton.edu/~min/binvox/binvox.html).
convert from 3D object to vox space: double-click on the file voxprius-high-res.bat. You'll see the conversion take place, then a view of the model will come up. To get out of the viewer, close it and the controlling window (or hit Control-C in that window).

	rem delete any previous 
	del toyota-prius.binvox

	rem use default resolution of 256
	binvox toyota-prius.obj

(http://www.cs.princeton.edu/~min/viewvox/)
View final vox space: double-click on the file view-car.bat

	rem now display it
	viewvox toyota-prius.binvox

## Vox-to-np

Once you have exported the binvox model you can now import the file into python with this small  

Small Python module to read and write `.binvox` files. The voxel data is
represented as dense 3-dimensional Numpy arrays in Python.

Suppose you have a voxelized car model, `toyota-prius.binvox` 

Then:
	
	import binvox_rw
	with open('toyota-prius.binvox', 'rb') as f:
    	model = binvox_rw.read_as_3d_array(f)

You get the idea. `model.data` has the boolean 3D array. You can then
manipulate however you wish. For example, here we dilate it with
`scipy.ndimage` and write the dilated version to disk:

	import scipy.ndimage
    scipy.ndimage.binary_dilation(model.data.copy(), output=model.data)
    model.write('dilated.binvox')


##Credits and other stuff:
-------------------------------------------
advanced: CUDA C mesh voxelizer
https://github.com/kctess5/voxelizer

Credits:
software from http://www.patrickmin.com/minecraft/
GLUT DLL from http://www.xmission.com/~nate/glut.html
hand model from http://shapes.aim-at-shape.net/viewgroup.php?id=354#
chevalier model from who knows where.
Daniel Maturana for the binvox-rw-py python module: https://github.com/dimatura/binvox-rw-py
