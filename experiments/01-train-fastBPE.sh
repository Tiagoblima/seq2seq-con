# learning BPE codes
SRC_LANG="eng"
STD_LANG="gun"
TGT_LANG="gub"
VOCAB_SIZE=24000
BASE_DIR=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/


TRAIN_SRC_TEXT=$BASE_DIR/nllb/$SRC_LANG/train.txt
TRAIN_STD_TEXT=$BASE_DIR/nllb/$STD_LANG/train.txt
TRAIN_TGR_TEXT=$BASE_DIR/bible/$TGT_LANG/train.txt
TRAIN_SRC_TGR_TEXT=$BASE_DIR/bible/$SRC_LANG/train.txt

VALID_SRC_TEXT=$BASE_DIR/nllb/$SRC_LANG/validation.txt
VALID_STD_TEXT=$BASE_DIR/nllb/$STD_LANG/validation.txt
VALID_TGR_TEXT=$BASE_DIR/bible/$TGT_LANG/validation.txt
VALID_SRC_TGR_TEXT=$BASE_DIR/bible/$SRC_LANG/validation.txt

TEST_SRC_TEXT=$BASE_DIR/nllb/$SRC_LANG/test.txt
TEST_STD_TEXT=$BASE_DIR/nllb/$STD_LANG/test.txt
TEST_TGR_TEXT=$BASE_DIR/bible/$TGT_LANG/test.txt
TEST_SRC_TGR_TEXT=$BASE_DIR/bible/$SRC_LANG/test.txt

mkdir -p $SRC_LANG-$STD_LANG/bpecodes/
mkdir -p $SRC_LANG-$TGT_LANG/bpecodes/

echo $TRAIN_STD_TEXT

../third_party/fastBPE/fast learnbpe $VOCAB_SIZE $TRAIN_SRC_TEXT > $SRC_LANG-$STD_LANG/bpecodes/$SRC_LANG.bpecodes

# use concat files
cat $TRAIN_TGR_TEXT $TRAIN_STD_TEXT | shuf > $SRC_LANG-$TGT_LANG/temp/train.$STD_LANG.$TGT_LANG.text
../third_party/fastBPE/fast learnbpe $VOCAB_SIZE $SRC_LANG-$TGT_LANG/temp/train.$STD_LANG.$TGT_LANG.text > $SRC_LANG-$TGT_LANG/bpecodes/$TGT_LANG.bpecodes
cp $SRC_LANG-$TGT_LANG/bpecodes/$TGT_LANG.bpecodes $SRC_LANG-$STD_LANG/bpecodes/$STD_LANG.bpecodes

mkdir -p $SRC_LANG-$STD_LANG/bpetok/
mkdir -p $SRC_LANG-$TGT_LANG/bpetok/
mkdir -p $SRC_LANG-$TGT_LANG/temp/

#applying BPE codes
../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/train.$SRC_LANG.bpetok $TRAIN_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/$SRC_LANG.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/train.$STD_LANG.bpetok $TRAIN_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/$STD_LANG.bpecodes 

../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/train.$SRC_LANG.bpetok $TRAIN_SRC_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/$SRC_LANG.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/train.$TGT_LANG.bpetok $TRAIN_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/$TGT_LANG.bpecodes 

#repeat similar steps for tokenizing the target monolingual corpus, validation set, and test set.

../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/valid.$SRC_LANG.bpetok $VALID_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/$SRC_LANG.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/valid.$STD_LANG.bpetok $VALID_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/$STD_LANG.bpecodes

../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/valid.$SRC_LANG.bpetok $VALID_SRC_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/$SRC_LANG.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/valid.$TGT_LANG.bpetok $VALID_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/$TGT_LANG.bpecodes

../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/test.$SRC_LANG.bpetok $TEST_SRC_TEXT $SRC_LANG-$STD_LANG/bpecodes/$SRC_LANG.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/bpetok/test.$STD_LANG.bpetok $TEST_STD_TEXT $SRC_LANG-$STD_LANG/bpecodes/$STD_LANG.bpecodes 

../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/test.$SRC_LANG.bpetok $TEST_SRC_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/$SRC_LANG.bpecodes 
../third_party/fastBPE/fast applybpe $SRC_LANG-$TGT_LANG/bpetok/test.$TGT_LANG.bpetok $TEST_TGR_TEXT $SRC_LANG-$TGT_LANG/bpecodes/$TGT_LANG.bpecodes 

