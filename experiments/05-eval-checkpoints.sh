VALIDSTEPS=2000
TRAINSTEPS=350000
SAVESTEPS=10000
SRC_LANG=$1
STD_LANG=$2
SRCSTD_MODELDIR=$SRC_LANG-$STD_LANG/checkpoints
for i in $(eval echo {0..${TRAINSTEPS}..${SAVESTEPS}}); do
    if [ -f $SRCSTD_MODELDIR/checkpoint_step_${i}.pt ]; then 
        echo "Evaluating checkpoint ... ${i}"
        python -u ../translate.py\
            -gpu 0\
            -decode_loss cosine\
            -model $SRCSTD_MODELDIR/checkpoint_step_${i}.pt\
            -src $SRC_LANG-$STD_LANG/bpetok/valid.$SRC_LANG.bpetok\
            -output $SRCSTD_MODELDIR/step_${i}.pred.$STD_LANG\
            -batch_size 4000\
            -batch_type tokens\
            -beam_size 1\
            -replace_unk 
        source ./evaluate.sh $SRCSTD_MODELDIR/step_${i}.pred.$STD_LANG $SRC_LANG-$STD_LANG/bpetok/valid.$STD_LANG.bpetok $STD_LANG
    else
        echo "checkpoint $i not found"
    fi    
done