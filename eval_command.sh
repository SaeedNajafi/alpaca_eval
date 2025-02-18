#!/bin/bash

set -e

conda activate llm-env

alpaca_eval evaluate_from_model \
    --model_configs 'Llama-3-1B-OfflineSimPO' \
    --annotators_config 'weighted_alpaca_eval_gpt-4o-mini-2024-07-18'