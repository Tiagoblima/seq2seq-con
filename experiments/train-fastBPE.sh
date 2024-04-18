# learning BPE codes
STD_LANG="gun"
SRC_LANG="pt_NVI"
TRAIN_SRC_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$SRC_LANG/train.txt
TRAIN_STD_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$STD_LANG/train.txt

VALID_SRC_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$SRC_LANG/validation.txt
VALID_STD_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$STD_LANG/validation.txt

TEST_SRC_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$SRC_LANG/test.txt
TEST_STD_TEXT=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/$STD_LANG/test.txt
mkdir -p $SRC_LANG-$STD_LANG/bpecodes/

../fastBPE/fast learnbpe 24000 $TRAIN_SRC_TEXT > $SRC_LANG-$STD_LANG/bpecodes/src.bpecodes
../fastBPE/fast learnbpe 12000 $TRAIN_STD_TEXT > $SRC_LANG-$STD_LANG/bpecodes/std.bpecodes

mkdir -p $SRC_LANG-$STD_LANG/bpetok/

#applying BPE codes
../fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/train.src.bpetok $TRAIN_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/src.bpecodes 
../fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/train.std.bpetok $TRAIN_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/std.bpecodes 

#repeat similar steps for tokenizing the target monolingual corpus, validation set, and test set.

../fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/valid.src.bpetok $VALID_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/src.bpecodes 
../fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/valid.std.bpetok $VALID_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/std.bpecodes 
../fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/test.src.bpetok $TEST_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/src.bpecodes 
../fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/test.std.bpetok $TEST_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/std.bpecodes 

