d.mon start=wx0
d.rast Kozep_Digitalis_Domborzatmodell_1m_EOV
r.watershed -s elevation=Kozep_Digitalis_Domborzatmodell_1m_EOV threshold=100000 accumulation=accum_10K drainage=draindir_10K basin=basin_10K
