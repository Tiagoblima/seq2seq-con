import datasets as dts 
import os 
import tqdm 

BASE_DIR = "/home/tiagoblima/projects/seq2seq-con/data/raw/wmt19/"
OUTPATH = "/home/tiagoblima/projects/seq2seq-con/data/preprocessed/wmt19/"
src_lang = input("src language: ")
trg_lang = input("trg language: ")
split = input("split [train|validation|None]: ")
data_dir = os.path.join(BASE_DIR, f"{src_lang}-{trg_lang}")
wmt19 = dts.load_dataset("parquet", data_dir=data_dir)

print(wmt19)
src_path = os.path.join(OUTPATH, src_lang)
trg_path = os.path.join(OUTPATH, trg_lang)

os.makedirs(src_path, exist_ok=True)
os.makedirs(trg_path, exist_ok=True)
if not split:
    for split in ["train", "validation"]:
        wmt19_split  = wmt19[split]
    
        print(f"Saving at {split} at\nsrc:{src_path}\ntrg:{trg_path}\n ")
        with open(os.path.join(src_path, split + ".txt"), "w") as srcfile:
            with open(os.path.join(trg_path, split + ".txt"), "w") as trgfile:  
                for example in tqdm.tqdm(wmt19_split, total=wmt19_split.num_rows):
                    srcfile.write(example["translation"][src_lang].strip()+ "\n")
                    trgfile.write(example["translation"][trg_lang].strip()+ "\n")
else:
   
    with open(os.path.join(src_path, split + ".txt"), "w") as srcfile:
        with open(os.path.join(trg_path, split + ".txt"), "w") as trgfile:
            wmt19_split  = wmt19[split]
            for example in tqdm.tqdm(wmt19_split, total=wmt19_split.num_rows):
                srcfile.write(example["translation"][src_lang].strip() + "\n")
                trgfile.write(example["translation"][trg_lang].strip()+ "\n")