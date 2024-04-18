BASEDIR=/path/to/root/of/this/repository
SRCTGT_MODELDIR=/path/to/save/model
mkdir -p $SRCSTD_MODELDIR
python -u train.py \
    -data $SRCTGT_DATADIR/data\
    -save_model $SRCTGT_MODELDIR/model\
    -finetune regular\
    -initialize_with /path/to/best/src-std-model\
    -num_adapters 0\
    -loss nllvmf\
    -gpu_ranks 0\
    -train_with train\
    -optim radam\
    -reset_optim all\
    -warmup_init_lr 1e-8\
    -warmup_end_lr 0.001\
    -min_lr 1e-9\
    -train_steps $TRAINSTEPS\
    -max_generator_batches 2\
    -batch_size 4000\
    -batch_type tokens\
    -normalization tokens\
    -accum_count 2\
    -adam_beta2 0.9995\
    -decay_method linear\
    -weight_decay 0.0001\
    -warmup_steps 1\
    -learning_rate 1\
    -max_grad_norm 0\
    -param_init 0\
    -param_init_glorot\
    -label_smoothing 0.1\
    -valid_steps $VALIDSTEPS\
    -valid_batch_size 4\
    -save_checkpoint_steps $SAVESTEPS\
    -world_size 1\
    -gpu_ranks 0