rem delete any previous 
del gipshand2-3k.binvox

rem use default resolution of 256 and downsample twice, so resolution is 64
rem you will to add your own arguments here - see http://www.patrickmin.com/minecraft/
binvox gipshand2-3k.obj -down -down

rem now display it
viewvox gipshand2-3k.binvox