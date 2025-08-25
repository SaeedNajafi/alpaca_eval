#!/bin/bash

# # DPO 135M
# epochs=(575 1150 1725 2300 2875)
# logps=(yes no)
# betas=(0.01 0.05 0.1 0.5 1.0)

# for beta_i in ${!betas[@]};
# do
#     beta=${betas[$beta_i]}
#     for logps_i in ${!logps[@]};
#     do
#         logp=${logps[$logps_i]}
#         for epoch_i in ${!epochs[@]};
#         do
#             epoch=${epochs[$epoch_i]}
#             name=smollm2-135M-orca_bin_ultra-offline-dpo-beta_${beta}-lr_0.0005-avg_logps_${logp}-v4_checkpoint-${epoch}
#             model_dir=${main_path}/smollm2-135M-orca_bin_ultra-offline-dpo-beta_${beta}-lr_0.0005-avg_logps_${logp}-v4/checkpoint-${epoch}
#             rm -r -f ./src/alpaca_eval/models_configs/${name}
#             mkdir -p ./src/alpaca_eval/models_configs/${name}
#             cp ./src/alpaca_eval/models_configs/smollm2-135m-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
#             python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
#             bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='smollm2-135m-sft'
#         done
#     done
# done

# # DPO 360M
# epochs=(575 1150 1725 2300 2875)
# logps=(yes no)
# betas=(0.01 0.05 0.1 0.5 1.0)

# for beta_i in ${!betas[@]};
# do
#     beta=${betas[$beta_i]}
#     for logps_i in ${!logps[@]};
#     do
#         logp=${logps[$logps_i]}
#         for epoch_i in ${!epochs[@]};
#         do
#             epoch=${epochs[$epoch_i]}
#             name=smollm2-360M-orca_bin_ultra-offline-dpo-beta_${beta}-lr_0.00005-avg_logps_${logp}-v4_checkpoint-${epoch}
#             model_dir=${main_path}/smollm2-360M-orca_bin_ultra-offline-dpo-beta_${beta}-lr_0.00005-avg_logps_${logp}-v4/checkpoint-${epoch}
#             rm -r -f ./src/alpaca_eval/models_configs/${name}
#             mkdir -p ./src/alpaca_eval/models_configs/${name}
#             cp ./src/alpaca_eval/models_configs/smollm2-360m-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
#             python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
#             bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='smollm2-360m-sft'
#         done
#     done
# done


# # SimPO 135M
# epochs=(575 1150 1725 2300 2875)
# logps=(yes no)
# betas=(0.01 0.05 0.1 0.5 1.0)

# for beta_i in ${!betas[@]};
# do
#     beta=${betas[$beta_i]}
#     for logps_i in ${!logps[@]};
#     do
#         logp=${logps[$logps_i]}
#         for epoch_i in ${!epochs[@]};
#         do
#             epoch=${epochs[$epoch_i]}
#             name=smollm2-135M-orca_bin_ultra-offline-simpo-beta_${beta}-lr_0.0001-gamma-to-beta_1.6-avg_logps_${logp}-v4_checkpoint-${epoch}
#             model_dir=${main_path}/smollm2-135M-orca_bin_ultra-offline-simpo-beta_${beta}-lr_0.0001-gamma-to-beta_1.6-avg_logps_${logp}-v4/checkpoint-${epoch}
#             rm -r -f ./src/alpaca_eval/models_configs/${name}
#             mkdir -p ./src/alpaca_eval/models_configs/${name}
#             cp ./src/alpaca_eval/models_configs/smollm2-135m-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
#             python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
#             bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='smollm2-135m-sft'
#         done
#     done
# done

# # SimPO 360M
# epochs=(575 1150 1725 2300 2875)
# logps=(yes no)
# betas=(0.01 0.05 0.1 0.5 1.0)

# for beta_i in ${!betas[@]};
# do
#     beta=${betas[$beta_i]}
#     for logps_i in ${!logps[@]};
#     do
#         logp=${logps[$logps_i]}
#         for epoch_i in ${!epochs[@]};
#         do
#             epoch=${epochs[$epoch_i]}
#             name=smollm2-360M-orca_bin_ultra-offline-simpo-beta_${beta}-lr_0.0001-gamma-to-beta_1.6-avg_logps_${logp}-v4_checkpoint-${epoch}
#             model_dir=${main_path}/smollm2-360M-orca_bin_ultra-offline-simpo-beta_${beta}-lr_0.0001-gamma-to-beta_1.6-avg_logps_${logp}-v4/checkpoint-${epoch}
#             rm -r -f ./src/alpaca_eval/models_configs/${name}
#             mkdir -p ./src/alpaca_eval/models_configs/${name}
#             cp ./src/alpaca_eval/models_configs/smollm2-360m-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
#             python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
#             bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='smollm2-360m-sft'
#         done
#     done
# done


# # MMPO 135M
# epochs=(575 1150 1725 2300 2875)
# logps=(yes no)
# betas=(0.01 0.05 0.1 0.5 1.0)
# entropies=(yes no)

# for beta_i in ${!betas[@]};
# do
#     beta=${betas[$beta_i]}
#     for logps_i in ${!logps[@]};
#     do
#         logp=${logps[$logps_i]}
#         for epoch_i in ${!epochs[@]};
#         do
#             for entropy_i in ${!entropies[@]};
#             do
#                 entropy=${entropies[$entropy_i]}
#                 epoch=${epochs[$epoch_i]}
#                 name=smollm2-135M-orca_bin_ultra-offline-mmpo-beta_${beta}-lr_0.0005-reward_eps_0.9-avg_logps_${logp}-v4-${entropy}-entropy_checkpoint-${epoch}
#                 model_dir=${main_path}/smollm2-135M-orca_bin_ultra-offline-mmpo-beta_${beta}-lr_0.0005-reward_eps_0.9-avg_logps_${logp}-v4-${entropy}-entropy/checkpoint-${epoch}
#                 rm -r -f ./src/alpaca_eval/models_configs/${name}
#                 mkdir -p ./src/alpaca_eval/models_configs/${name}
#                 cp ./src/alpaca_eval/models_configs/smollm2-135m-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
#                 python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
#                 bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='smollm2-135m-sft'
#             done
#         done
#     done
# done

# # MMPO 360M
# epochs=(575 1150 1725 2300 2875)
# logps=(yes no)
# betas=(0.01 0.05 0.1 0.5 1.0)
# entropies=(yes no)

# for beta_i in ${!betas[@]};
# do
#     beta=${betas[$beta_i]}
#     for logps_i in ${!logps[@]};
#     do
#         logp=${logps[$logps_i]}
#         for epoch_i in ${!epochs[@]};
#         do
#             for entropy_i in ${!entropies[@]};
#             do
#                 entropy=${entropies[$entropy_i]}
#                 epoch=${epochs[$epoch_i]}
#                 name=smollm2-360M-orca_bin_ultra-offline-mmpo-beta_${beta}-lr_0.0005-reward_eps_0.9-avg_logps_${logp}-v4-${entropy}-entropy_checkpoint-${epoch}
#                 model_dir=${main_path}/smollm2-360M-orca_bin_ultra-offline-mmpo-beta_${beta}-lr_0.0005-reward_eps_0.9-avg_logps_${logp}-v4-${entropy}-entropy/checkpoint-${epoch}
#                 rm -r -f ./src/alpaca_eval/models_configs/${name}
#                 mkdir -p ./src/alpaca_eval/models_configs/${name}
#                 cp ./src/alpaca_eval/models_configs/smollm2-360m-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
#                 python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
#                 bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='smollm2-360m-sft'
#             done
#         done
#     done
# done


main_path="/home/saeednjf/projects/def-afyshe-ab/saeednjf/checkpoints"

# DPO llama3.2-1b
epochs=(1530 3060 4590 6120 7650)
global_steps=(1529 3058 4588 6117 7647)
logps=(yes no)
betas=(0.01 0.05 0.1 0.5)

for beta_i in ${!betas[@]};
do
    beta=${betas[$beta_i]}
    for logps_i in ${!logps[@]};
    do
        logp=${logps[$logps_i]}
        for epoch_i in ${!epochs[@]};
        do
            epoch=${epochs[$epoch_i]}
            global_step=${global_steps[$epoch_i]}
            name=llama3.2-1b-offline-dpo-beta_${beta}-lr_0.0005-avg_logps_${logp}-v13_checkpoint-${epoch}
            model_dir=${main_path}/llama-3.2-1b-dpo-v13/llama3.2-1b-offline-dpo-beta_${beta}-lr_0.0005-avg_logps_${logp}-v13/checkpoint-${epoch}
            rm -r -f ./src/alpaca_eval/models_configs/${name}
            mkdir -p ./src/alpaca_eval/models_configs/${name}
            cp ./src/alpaca_eval/models_configs/llama-3.2-1b-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
            python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
            bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='llama-3.2-1b-sft'
        done
    done
done

# SimPO llama3.2-1b
epochs=(1530 3060 4590 6120 7650)
global_steps=(1529 3058 4588 6117 7647)
logps=(yes no)
betas=(0.01 0.05 0.1 0.5 1.0)

for beta_i in ${!betas[@]};
do
    beta=${betas[$beta_i]}
    for logps_i in ${!logps[@]};
    do
        logp=${logps[$logps_i]}
        for epoch_i in ${!epochs[@]};
        do
            epoch=${epochs[$epoch_i]}
            global_step=${global_steps[$epoch_i]}
            name=llama3.2-1b-offline-simpo-beta_${beta}-lr_0.0005-gamma-to-beta_1.0-avg_logps_${logp}-v13_checkpoint-${epoch}
            model_dir=${main_path}/llama-3.2-1b-simpo-v13/llama3.2-1b-offline-simpo-beta_${beta}-lr_0.0005-gamma-to-beta_1.0-avg_logps_${logp}-v13/checkpoint-${epoch}
            rm -r -f ./src/alpaca_eval/models_configs/${name}
            mkdir -p ./src/alpaca_eval/models_configs/${name}
            cp ./src/alpaca_eval/models_configs/llama-3.2-1b-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
            python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
            bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='llama-3.2-1b-sft'
        done
    done
done


# MMPO llama3.2-1b
epochs=(1530 3060 4590 6120 7650)
global_steps=(1529 3058 4588 6117 7647)
logps=(yes no)
betas=(0.01 0.05 0.1 0.5 1.0)
entropies=(yes no)

for beta_i in ${!betas[@]};
do
    beta=${betas[$beta_i]}
    for logps_i in ${!logps[@]};
    do
        logp=${logps[$logps_i]}
        for epoch_i in ${!epochs[@]};
        do
            for entropy_i in ${!entropies[@]};
            do
                entropy=${entropies[$entropy_i]}
                epoch=${epochs[$epoch_i]}
                global_step=${global_steps[$epoch_i]}
                name=llama3.2-1b-offline-mmpo-beta_${beta}-lr_0.0005-reward_eps_0.9-avg_logps_${logp}-v13-${entropy}-entropy_checkpoint-${epoch}
                model_dir=${main_path}/llama-3.2-1b-mmpo-v13/llama3.2-1b-offline-mmpo-beta_${beta}-lr_0.0005-reward_eps_0.9-avg_logps_${logp}-v13-${entropy}-entropy/checkpoint-${epoch}
                rm -r -f ./src/alpaca_eval/models_configs/${name}
                mkdir -p ./src/alpaca_eval/models_configs/${name}
                cp ./src/alpaca_eval/models_configs/llama-3.2-1b-sft/prompt.txt ./src/alpaca_eval/models_configs/${name}/prompt.txt
                python create_yamls.py --name ${name} --path ${model_dir} --config_root ./src/alpaca_eval/models_configs
                bash eval_command.sh MODEL_CONFIG=${name} NAME=${name} REF_MODEL_CONFIG='llama-3.2-1b-sft'
            done
        done
    done
done