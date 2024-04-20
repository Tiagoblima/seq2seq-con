# learning BPE codes
STD_LANG="gun"
SRC_LANG="pt_NVI"
TGT_LANG="gub"
VOCAB_SIZE=6000


TRAIN_SRC_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$SRC_LANG/train.txt
TRAIN_STD_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$STD_LANG/train.txt
TRAIN_TGR_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$TGT_LANG/train.txt

VALID_SRC_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$SRC_LANG/validation.txt
VALID_STD_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$STD_LANG/validation.txt
VALID_TGR_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$TGT_LANG/validation.txt

TEST_SRC_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$SRC_LANG/test.txt
TEST_STD_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$STD_LANG/test.txt
TEST_TGR_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$TGT_LANG/test.txt

mkdir -p $SRC_LANG-$STD_LANG/bpecodes/
mkdir -p $SRC_LANG-$TGT_LANG/bpecodes/

../third_party/fastBPE/fast learnbpe $VOCAB_SIZE $TRAIN_SRC_TEXT > $SRC_LANG-$STD_LANG/bpecodes/src.bpecodes
../third_party/fastBPE/fast learnbpe $VOCAB_SIZE $TRAIN_STD_TEXT > $SRC_LANG-$STD_LANG/bpecodes/std.bpecodes
../third_party/fastBPE/fast learnbpe $VOCAB_SIZE $TRAIN_TGR_TEXT > $SRC_LANG-$TGT_LANG/bpecodes/tgt.bpecodes

mkdir -p $SRC_LANG-$STD_LANG/bpetok/
mkdir -p $SRC_LANG-$TGT_LANG/bpetok/
#applying BPE codes
../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/train.src.bpetok $TRAIN_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/src.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/train.std.bpetok $TRAIN_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/std.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/train.tgt.bpetok $TRAIN_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/tgt.bpecodes 

#repeat similar steps for tokenizing the target monolingual corpus, validation set, and test set.

../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/valid.src.bpetok $VALID_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/src.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/valid.std.bpetok $VALID_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/std.bpecodes
../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/valid.tgt.bpetok $VALID_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/tgt.bpecodes

../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/test.src.bpetok $TEST_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/src.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/test.std.bpetok $TEST_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/std.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/test.tgt.bpetok $TEST_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/tgt.bpecodes 

