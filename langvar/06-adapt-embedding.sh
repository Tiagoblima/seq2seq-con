SRC_LANG="eng"
STD_LANG="gun"
TGT_LANG="gub"
mkdir -p $SRC_LANG-$TGT_LANG/embeddings/
TGT_INPUT=$SRC_LANG-$TGT_LANG/bpetok/train.tgt.bpetok
PRETRAINED_STD=$SRC_LANG-$STD_LANG/embeddings/std.vec
OUTPUT=$SRC_LANG-$TGT_LANG/embeddings/tgt
../third_party/Embeddings/fasttext skipgram -input $TGT_INPUT -output $OUTPUT -lr 0.025 -dim 100 -t 1e-3 -minCount 2 -ws 3 -pretrainedVectors $PRETRAINED_STD -minn 3  -maxn 6
