rem delete any previous 
del chevalier.binvox

rem use default resolution of 256 and downsample twice, so resolution is 64
rem you will to add your own arguments here - see http://www.patrickmin.com/minecraft/
rem -aw - draws edges, helps to catch little features
rem -c - carves, which is usually the right thing to use with models that are not "solid"
rem -dc - thickens the model to catch small features
rem -cb - centers the model
rem -dmin 1 - if any of the "child" voxels during "-down" exist, have the downsampled voxel exist
rem -down 3 times - goes from 536 to 536/8 = 67 voxels; this turns out to be tall enough that the model is 64 voxels high
binvox chevalier.obj -d 536 -aw -c -dc -cb -dmin 1 -down -down -down

rem now display it
viewvox chevalier.binvox