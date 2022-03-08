d.mon start=wx0
d.rast Kozep_Digitalis_Domborzatmodell_1m_EOV
# Watershed delineation
r.watershed -s elevation=Kozep_Digitalis_Domborzatmodell_1m_EOV threshold=1000000 accumulation=accum_1M drainage=draindir_1M basin=basin_1M
d.erase
d.rast basin_1M
# Relief calculation
r.relief input=Kozep_Digitalis_Domborzatmodell_1m_EOV output=Kozep_shade
# Plot
d.erase
d.his hue=basin_1M intensity=Kozep_shade brighten=40
