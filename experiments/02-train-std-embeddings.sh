SRC_LANG=$1
STD_LANG=$2
mkdir -p $SRC_LANG-$STD_LANG/embeddings/
STD_INPUT=$SRC_LANG-$STD_LANG/bpetok/train.$STD_LANG.bpetok
OUTPUT=$SRC_LANG-$STD_LANG/embeddings/$STD_LANG
../third_party/Embeddings/fasttext skipgram -input $STD_INPUT -output $OUTPUT -lr 0.025 -dim 100 -t 1e-3 -minCount 2 -ws 3 -minn 3  -maxn 6
