r.in.gdal input=~/watershed/Kozep_Digitalis_Domborzatmodell_1m_EOV.tif out=Kozep_Digitalis_Domborzatmodell_1m_EOV
d.mon start=wx0
d.rast Kozep_Digitalis_Domborzatmodell_1m_EOV

r.in.gdal input=~/watershed/Del_Digitalis_Domborzatmodell_EOV_1m.tif out=Del_Digitalis_Domborzatmodell_EOV_1m
g.region rast=Del_Digitalis_Domborzatmodell_EOV_1m
d.erase
d.rast Del_Digitalis_Domborzatmodell_EOV_1m


basin=basin_1M
# Watershed delineation
r.watershed -s elevation=Kozep_Digitalis_Domborzatmodell_1m_EOV threshold=1000000 accumulation=accum_1M drainage=draindir_1M basin=$basin
d.erase
d.rast $basin
# Relief calculation
r.relief input=Kozep_Digitalis_Domborzatmodell_1m_EOV output=Kozep_shade
# Basin boundaries
r.to.vect -s $basin output=$basin type=area
# Plot
d.erase
d.his hue=$basin intensity=Kozep_shade brighten=40
d.vect $basin type=boundary
