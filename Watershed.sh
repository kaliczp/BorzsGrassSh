d.mon start=wx0
d.rast Kozep_Digitalis_Domborzatmodell_1m_EOV
r.watershed -s elevation=Kozep_Digitalis_Domborzatmodell_1m_EOV threshold=1000000 accumulation=accum_1M drainage=draindir_1M basin=basin_1M
d.erase
d.rast basin_1M
