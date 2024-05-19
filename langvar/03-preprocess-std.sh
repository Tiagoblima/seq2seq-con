
SRC_LANG=$1
STD_LANG=$2
SRCSTD_DATADIR=$SRC_LANG-$STD_LANG/bin
mkdir -p $SRCSTD_DATADIR
python -u ./preprocess.py\
    -train_src $SRC_LANG-$STD_LANG/bpetok/train.$SRC_LANG.bpetok\
    -train_tgt $SRC_LANG-$STD_LANG/bpetok/train.$STD_LANG.bpetok\
    -valid_src $SRC_LANG-$STD_LANG/bpetok/valid.$SRC_LANG.bpetok\
    -valid_tgt $SRC_LANG-$STD_LANG/bpetok/valid.$STD_LANG.bpetok\
    -save_data $SRCSTD_DATADIR/data\
    -tgt_emb $SRC_LANG-$STD_LANG/embeddings/wiki.$STD_LANG.align.vec \
    -src_seq_length 175 \
    -tgt_seq_length 175 \
    -overwrite
