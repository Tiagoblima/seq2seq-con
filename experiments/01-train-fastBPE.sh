# learning BPE codes
SRC_LANG=$1
STD_LANG=$2
TGT_LANG=$3
VOCAB_SIZE=24000
BASE_DIR=/home/tiagoblima/repos/seq2seq-con/data/preprocessed/texts/
PATH_SRC_STD=$BASE_DIR/wmt19/$SRC_LANG
PATH_STD=$BASE_DIR/wmt19/$STD_LANG
PATH_SRC_TGR=$BASE_DIR/open-subititles/$TGT_LANG
PATH_TGR=$BASE_DIR/open-subititles/$TGT_LANG
PATH_EMBEDDINGS_TEXT=$BASE_DIR/conll17/$STD_LANG/train.txt

TRAIN_SRC_TEXT=$PATH_SRC_STD/train.txt
TRAIN_STD_TEXT=$PATH_STD/train.txt

TRAIN_SRC_TGR_TEXT=$PATH_SRC_TGR/train.txt
TRAIN_TGR_TEXT=$PATH_SRC_TGR/train.txt

VALID_SRC_TEXT=$PATH_SRC_STD/validation.txt
VALID_STD_TEXT=$PATH_STD/validation.txt

VALID_TGR_TEXT=$PATH_TGR/validation.txt
VALID_SRC_TGR_TEXT=$PATH_SRC_TGR/validation.txt

TEST_SRC_TEXT=$PATH_SRC_STD/test.txt
TEST_STD_TEXT=$PATH_STD/test.txt

TEST_SRC_TGR_TEXT=$PATH_SRC_TGR/test.txt
TEST_TGR_TEXT=$PATH_TGR/test.txt

mkdir -p $SRC_LANG-$STD_LANG/bpecodes/
mkdir -p $SRC_LANG-$TGT_LANG/bpecodes/
mkdir -p $SRC_LANG-$STD_LANG/embeddings/bpetok/
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

../third_party/fastBPE/fast applybpe $SRC_LANG-$STD_LANG/embeddings/bpetok/train.$STD_LANG.bpetok $PATH_EMBEDDINGS_TEXT $SRC_LANG-$STD_LANG/bpecodes/$STD_LANG.bpecodes 
