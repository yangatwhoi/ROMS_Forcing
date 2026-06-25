export DATA_DIR=${PWD}/DATA
export SAVE_DIR=${PWD}/Result

rm -rf ${SAVE_DIR}
mkdir  ${SAVE_DIR}

cdo mergetime ${DATA_DIR}/*sustr.nc ${SAVE_DIR}/sustr.nc
cdo mergetime ${DATA_DIR}/*svstr.nc ${SAVE_DIR}/svstr.nc
cdo mergetime ${DATA_DIR}/*Pair.nc ${SAVE_DIR}/Pair.nc
cdo mergetime ${DATA_DIR}/*swrad.nc ${SAVE_DIR}/swrad.nc
cdo mergetime ${DATA_DIR}/*lwrad.nc ${SAVE_DIR}/lwrad.nc
cdo mergetime ${DATA_DIR}/*shflux.nc ${SAVE_DIR}/shflux.nc
cdo mergetime ${DATA_DIR}/*swflux.nc ${SAVE_DIR}/swflux.nc

