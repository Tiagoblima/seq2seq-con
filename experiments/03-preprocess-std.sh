
SRC_LANG=pt_NVI
STD_LANG=gun
SRCSTD_DATADIR=$SRC_LANG-$STD_LANG/bin
mkdir -p $SRCSTD_DATADIR
python -u ../preprocess.py\
    -train_src $SRC_LANG-$STD_LANG/bpetok/train.src.bpetok\
    -train_tgt $SRC_LANG-$STD_LANG/bpetok/train.std.bpetok\
    -valid_src $SRC_LANG-$STD_LANG/bpetok/valid.src.bpetok\
    -valid_tgt $SRC_LANG-$STD_LANG/bpetok/valid.std.bpetok\
    -save_data $SRCSTD_DATADIR/data\
    -tgt_emb $SRC_LANG-$STD_LANG/embeddings/std.vec \
    -src_seq_length 175 \
    -tgt_seq_length 175 \
    -overwrite
