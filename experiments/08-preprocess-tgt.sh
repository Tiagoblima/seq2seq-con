
SRC_LANG=eng
TGT_LANG=gub
SRCSTD_DATADIR=$SRC_LANG-$TGT_LANG/bin
mkdir -p $SRCSTD_DATADIR
python -u ../preprocess.py\
    -train_src $SRC_LANG-$TGT_LANG/bpetok/train.$SRC_LANG.bpetok\
    -train_tgt $SRC_LANG-$TGT_LANG/bpetok/train.$TGT_LANG.bpetok\
    -valid_src $SRC_LANG-$TGT_LANG/bpetok/valid.$SRC_LANG.bpetok\
    -valid_tgt $SRC_LANG-$TGT_LANG/bpetok/valid.$TGT_LANG.bpetok\
    -save_data $SRCSTD_DATADIR/data\
    -tgt_emb $SRC_LANG-$TGT_LANG/embeddings/debug/j00i245f06/vectors-gun.txt \
    -src_seq_length 512 \
    -tgt_seq_length 512 \
    -overwrite
