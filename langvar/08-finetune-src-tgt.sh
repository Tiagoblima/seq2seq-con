BASEDIR=../
SRC_LANG=pt_NVI
STD_LANG=gun
TGT_LANG=gub
SRCSTD_MODELDIR=$SRC_LANG-$STD_LANG/checkpoints
VALIDSTEPS=2000
TRAINSTEPS=350000 #350000
SAVESTEPS=50000
DATADIR=$SRC_LANG-$STD_LANG/bin
LR=0.0007

mkdir -p $SRCSTD_MODELDIR
python -u $BASEDIR/train.py\
    -data $DATADIR/data \
    -save_model $SRC_LANG-$TGT_LANG/checkpoints/ \
    -initialize_with $SRCSTD_MODELDIR/checkpoint_step_10000.pt \
    -layers 6\
    -rnn_size 512\
    -word_vec_size 512\
    -transformer_ff 1024\
    -heads 8\
    -warmup_init_lr 1e-8\
    -warmup_end_lr 0.0007\
    -min_lr 1e-9\
    -encoder_type transformer\
    -decoder_type transformer\
    -position_encoding\
    -train_steps $TRAINSTEPS\
    -max_generator_batches 2\
    -dropout 0.1\
    -batch_size 4000 \
    -batch_type tokens\
    -normalization tokens\
    -accum_count 2\
    -optim radam\
    -adam_beta2 0.9995\
    -decay_method linear\
    -weight_decay 0.00001\
    -warmup_steps 1\
    -learning_rate 1 \
    -max_grad_norm 5.0\
    -param_init 0 \
    -param_init_glorot\
    -label_smoothing 0.1\
    -valid_steps $VALIDSTEPS\
    -valid_batch_size 4000\
    -save_checkpoint_steps $SAVESTEPS\
    -world_size 1\
    -generator_function continuous-linear\
    -loss nllvmf\
    -generator_layer_norm\
    -lambda_vmf 0.2\
    -share_decoder_embeddings\
    -gpu_ranks 0 \
    -early_stopping 4
