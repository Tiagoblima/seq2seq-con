
SRC_LANG=$1
STD_LANG=$2

python -u ../build_vocab.py -config $SRC_LANG-$STD_LANG/config/config.yaml
