SRCSTD_DATADIR=bin
SRC_LANG=pt_NVI
TGT_LANG=gu

mkdir -p $SRCSTD_DATADIR
python -u ../../preprocess.py\
    -train_src bpetok/train.src.bpetok\
    -train_tgt bpetok/train.std.bpetok\
    -valid_src bpetok/valid.src.bpetok\
    -valid_tgt bpetok/valid.std.bpetok\
    -save_data $SRCSTD_DATADIR/data\
    -tgt_emb embeddings/std.vec \
    -src_seq_length 175\
    -tgt_seq_length 175 \
    -overwrite
