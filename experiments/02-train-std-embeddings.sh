SRC_LANG="pt_NVI"
STD_LANG="gun"
mkdir -p $SRC_LANG-$STD_LANG/embeddings/
STD_INPUT=$SRC_LANG-$STD_LANG/bpetok/train.std.bpetok
OUTPUT=$SRC_LANG-$STD_LANG/embeddings/std
fasttext skipgram -input $STD_INPUT -output $OUTPUT -lr 0.025 -dim 100 -t 1e-3 -minCount 2 -ws 3
