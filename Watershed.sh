d.mon start=wx0
d.rast Kozep_Digitalis_Domborzatmodell_1m_EOV
# Watershed delineation
r.watershed -s elevation=Kozep_Digitalis_Domborzatmodell_1m_EOV threshold=1000000 accumulation=accum_1M drainage=draindir_1M basin=basin_1M
d.erase
d.rast basin_1M
# Relief calculation
r.relief input=Kozep_Digitalis_Domborzatmodell_1m_EOV output=Kozep_shade
# Basin boundaries
r.to.vect -s basin_1M output=basin_1M type=area
# Plot
d.erase
d.his hue=basin_1M intensity=Kozep_shade brighten=40
d.vect basin_1M type=boundary
