#!/bin/bash

# # SBATCH --job-name=alpaca-eval
# # SBATCH --account=def-afyshe-ab
# # SBATCH --nodes=1
# # SBATCH --gpus-per-node=1
# # SBATCH --cpus-per-gpu=4
# # SBATCH --mem=64G
# # SBATCH --time=03:00:00
# # SBATCH --open-mode=append
# # SBATCH --wait-all-nodes=1
# # SBATCH --output=%x_%j.out
# # SBATCH --error=%x_%j.err

module --force purge

eval "$(conda shell.bash hook)"
conda activate llm-env

# For reading key=value arguments
for ARGUMENT in "$@"
do
	KEY=$(echo $ARGUMENT | cut -f1 -d=)
	KEY_LENGTH=${#KEY}
	VALUE="${ARGUMENT:$KEY_LENGTH+1}"
	export "$KEY"="$VALUE"
done

export CUDA_HOME=$CONDA_PREFIX
export NCCL_HOME=$CONDA_PREFIX
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib

date;pwd

export MASTER_ADDR="$(hostname --fqdn)"
export MASTER_PORT="$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1])')"
export RDVZ_ID=$RANDOM
echo "RDZV Endpoint $MASTER_ADDR:$MASTER_PORT"

export WANDB_PROJECT="mmpo-project-alpaca-eval"
export WANDB_MODE="offline"
export ACCELERATE_LOG_LEVEL="info"
export HF_ENDPOINT="https://huggingface.co"

LOG_DIR="eval_logs"
LOG_PATH="${LOG_DIR}/log_${NAME}.log"
# Make logging directories.
mkdir -p "${LOG_DIR}"
echo "Placing logs in: ${LOG_DIR}"

NUM_GPUs=$(nvidia-smi --query-gpu=name --format=csv,noheader | wc -l)
echo "GPUs per node: ${NUM_GPUs}"

# NUM_PROCS=$((NUM_GPUs*SLURM_NNODES))

alpaca_eval evaluate_from_model \
    --reference_model_configs ${REF_MODEL_CONFIG} \
    --model_configs ${MODEL_CONFIG} \
    --annotators_config "weighted_alpaca_eval_gpt-4o-mini-2024-07-18" > ${LOG_PATH} 2>&1