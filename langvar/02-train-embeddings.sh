STD_INPUT=./bpetok/gun.bpetok
OUTPUT=embeddings/std
fasttext skipgram -input $STD_INPUT -output $OUTPUT -lr 0.025 -dim 100 -t 1e-3 -minCount 2 -ws 3
