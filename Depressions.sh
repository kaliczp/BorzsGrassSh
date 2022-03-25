r.fill.dir input=Kozep_Digitalis_Domborzatmodell_1m_EOV output=elev_fill1 direction=dir1 areas=unres1
r.fill.dir input=elev_fill1 output=elev_fill2 direction=dir2 areas=unres2
r.fill.dir input=elev_fill2 output=elev_fill3 direction=dir3 areas=unres3
r.fill.dir input=elev_fill3 output=elev_fill4 direction=dir4 areas=unres4
r.mapcalc "depr_bin = if((Kozep_Digitalis_Domborzatmodell_1m_EOV-elev_fill4) < 0., 1, null())"
r.colors depr_bin color=blues
r.to.vect -s depr_bin output=depr_bin type=area
v.extract in=depr_bin out=Kozep_centr type=centroid
v.type in=Kozep_centr out=KozepCentr_pts from_type=centroid to_type=point
v.out.ascii KozepCentr_pts out=Kozeppontok.txt prec=2

r.fill.dir input=Del_Digitalis_Domborzatmodell_EOV_1m output=Del_elev_fill1 direction=Del_dir1 areas=Del_unres1
r.fill.dir input=Del_elev_fill1 output=Del_elev_fill2 direction=Del_dir2 areas=Del_unres2
r.fill.dir input=Del_elev_fill2 output=Del_elev_fill3 direction=Del_dir3 areas=Del_unres3
r.fill.dir input=Del_elev_fill3 output=Del_elev_fill4 direction=Del_dir4 areas=Del_unres4
r.fill.dir input=Del_elev_fill4 output=Del_elev_fill5 direction=Del_dir5 areas=Del_unres5
r.fill.dir input=Del_elev_fill5 output=Del_elev_fill6 direction=Del_dir6 areas=Del_unres6
r.mapcalc "Del_depr_bin = if((Del_Digitalis_Domborzatmodell_EOV_1m-Del_elev_fill6) < 0., 1, null())"
r.colors Del_depr_bin color=blues
r.to.vect -s Del_depr_bin output=Del_depr_bin type=area
v.type input=Del_depr_bin output=Del_boundary from_type=line to_type=boundary
v.centroids in=Del_boundary out=Del_Centr cat=2

# Pontok
v.extract in=Del_Centr out=centr type=centroid
# If needed convert centroids to points
v.type in= out=centr_pts from_type=centroid to_type=point
v.out.ascii centr_pts out=Delpontok.txt prec=2
