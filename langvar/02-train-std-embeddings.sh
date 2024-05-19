SRC_LANG=$1
STD_LANG=$2

PATH_EMBEDDINGS=$SRC_LANG-$STD_LANG/embeddings/

STD_INPUT=$PATH_EMBEDDINGS/bpetok/train.$STD_LANG.bpetok
OUTPUT=$PATH_EMBEDDINGS/$STD_LANG
../third_party/Embeddings/fasttext skipgram -input $STD_INPUT -output $OUTPUT -lr 0.025 -dim 500 -t 1e-3 -minCount 2 -ws 3 -minn 3  -maxn 6
