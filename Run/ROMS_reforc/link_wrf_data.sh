export DATA_DIR=/nobackupp19/schen4/p7/schen4_nbp1/COAWST/COAWST_DUST/COAWST/Projects/ArabianGulf_DON_MOREOUTPUT
export SAVE_DIR=${PWD}/DATA

rm -rf ${SAVE_DIR}
mkdir  ${SAVE_DIR}

ln -s ${DATA_DIR}/qck_*  ${SAVE_DIR}/
