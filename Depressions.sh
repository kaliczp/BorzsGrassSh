r.fill.dir input=Kozep_Digitalis_Domborzatmodell_1m_EOV output=elev_fill1 direction=dir1 areas=unres1
r.fill.dir input=elev_fill1 output=elev_fill2 direction=dir2 areas=unres2
r.fill.dir input=elev_fill2 output=elev_fill3 direction=dir3 areas=unres3
r.mapcalc "depr_bin = if((Kozep_Digitalis_Domborzatmodell_1m_EOV-elev_fill3) < 0., 1, null())"
r.colors depr_bin color=blues
