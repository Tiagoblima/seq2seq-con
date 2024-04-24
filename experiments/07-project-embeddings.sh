STD_LANG="gun"
TGT_LANG="gub"
SRC_LANG="pt_NVI"
WORK_DIR="../third_party/MUSE"


EMB_STD=$SRC_LANG-$STD_LANG/embeddings/std.vec
EMB_TGT=$SRC_LANG-$TGT_LANG/embeddings/tgt.vec

echo "src embedding $EMB_STD"
echo "tgt embedding $EMB_TGT"
python $WORK_DIR/unsupervised.py --src_lang $STD_LANG --tgt_lang $TGT_LANG --src_emb $EMB_STD --tgt_emb $EMB_TGT --emb_dim 100 --dis_most_frequent 750 --n_refinement 0
