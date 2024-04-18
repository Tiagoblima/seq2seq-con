VALIDSTEPS=2000
TRAINSTEPS=50000
SAVESTEPS=50000
SRCSTD_MODELDIR=./checkpoints
for i in $(eval echo {${SAVESTEPS}..${TRAINSTEPS}..${SAVESTEPS}}); do
    echo "Evaluating checkpoint ... ${i}"
    python -u ../../translate.py\
        -gpu 0\
        -decode_loss cosine\
        -model $SRCSTD_MODELDIR/checkpoint_step_${i}.pt\
        -src bpetok/valid.src.bpetok\
        -output $SRCSTD_MODELDIR/step_${i}.pred.std\
        -batch_size 4000\
        -batch_type tokens\
        -beam_size 1\
        -replace_unk 
    source ./evaluate.sh $SRCSTD_MODELDIR/step_${i}.pred.std bpetok/valid.std.bpetok std
done