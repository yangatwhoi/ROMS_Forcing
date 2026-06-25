load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

dir  = "DATA/"
filename  = "qck_*"

all_files = systemfunc("ls "+dir+filename)
time      = -1

do i = 0,dimsizes(all_files)-1,1

  fileI = all_files(i)
  print(fileI)
  a     = addfile(fileI,"r")


;----------------------------------------------------------------------------
; sustr
;----------------------------------------------------------------------------
  varN  = "sustr"
  var   = wrf_user_getvar(a,varN,time)
  fileO = fileI+"_sustr.nc"
  fileS = addfile(fileO, "c")
  fileS->sustr = var
  delete(var)
;----------------------------------------------------------------------------
; svstr
;----------------------------------------------------------------------------
  varN  = "svstr"
  var   = wrf_user_getvar(a,varN,time)
  fileO = fileI+"_svstr.nc"
  fileS = addfile(fileO, "c")
  fileS->svstr = var
  delete(var)
;----------------------------------------------------------------------------
; Pair
;----------------------------------------------------------------------------
  varN  = "Pair"
  var   = wrf_user_getvar(a,varN,time)
  fileO = fileI+"_Pair.nc"
  fileS = addfile(fileO, "c")
  fileS->Pair = var
  delete(var)
;----------------------------------------------------------------------------
; swrad
;----------------------------------------------------------------------------
  varN  = "swrad"
  var   = wrf_user_getvar(a,varN,time)
  fileO = fileI+"_swrad.nc"
  fileS = addfile(fileO, "c")
  fileS->swrad = var
  delete(var)
;----------------------------------------------------------------------------
; lwrad
;----------------------------------------------------------------------------
  varN  = "lwrad"
  var   = wrf_user_getvar(a,varN,time)
  fileO = fileI+"_lwrad.nc"
  fileS = addfile(fileO, "c")
  fileS->lwrad = var
  delete(var)
;----------------------------------------------------------------------------
; shflux
;----------------------------------------------------------------------------
  varN  = "shflux"
  var   = wrf_user_getvar(a,varN,time)
  fileO = fileI+"_shflux.nc"
  fileS = addfile(fileO, "c")
  fileS->shflux = var
  delete(var)
;----------------------------------------------------------------------------
; swflux
;----------------------------------------------------------------------------
  varN  = "EminusP"
  var   = wrf_user_getvar(a,varN,time)
  var   = var*100*86400
  var@units = "centimeter day-1"
  fileO = fileI+"_swflux.nc"
  fileS = addfile(fileO, "c")
  fileS->swflux = var
  delete(var)
;----------------------------------------------------------------------------






end do
