
SRC_LANG=$1
STD_LANG=$2

BASE_DIR=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/

TRAIN_SRC_TEXT=$BASE_DIR/toy/$SRC_LANG/train.txt
TRAIN_STD_TEXT=$BASE_DIR/toy/$STD_LANG/train.txt
TRAIN_TGR_TEXT=$BASE_DIR/bible/$TGT_LANG/train.txt
TRAIN_SRC_TGR_TEXT=$BASE_DIR/bible/$SRC_LANG/train.txt

VALID_SRC_TEXT=$BASE_DIR/toy/$SRC_LANG/validation.txt
VALID_STD_TEXT=$BASE_DIR/toy/$STD_LANG/validation.txt
VALID_TGR_TEXT=$BASE_DIR/bible/$TGT_LANG/validation.txt
VALID_SRC_TGR_TEXT=$BASE_DIR/bible/$SRC_LANG/validation.txt

SRCSTD_DATADIR=$SRC_LANG-$STD_LANG/bin
mkdir -p $SRCSTD_DATADIR
python -u ../preprocess.py\
    -train_src $TRAIN_SRC_TEXT\
    -train_tgt $TRAIN_STD_TEXT\
    -valid_src $VALID_SRC_TEXT\
    -valid_tgt $VALID_STD_TEXT\
    -save_data $SRCSTD_DATADIR/data\
    -tgt_emb $SRC_LANG-$STD_LANG/embeddings/$STD_LANG.vec \
    -src_seq_length 512 \
    -tgt_seq_length 512 \
    -overwrite \
    -shard_size 1000
