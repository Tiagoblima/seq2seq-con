BASE_DIR=$1
OUTFILE=$2
cat $(ls $BASE_DIR | grep $BASE_DIR/^ru.*\\.txt) >> $OUTFILE
