#!/bin/bash

#General args
ROOT=$PWD

export IDENTITY_PATH

# Path to an RSA private key. If this path does not exist, a new key pair will be created.
# Remove this file if you want a new PeerID.
DEFAULT_IDENTITY_PATH="$ROOT"/swarm.pem
IDENTITY_PATH=${IDENTITY_PATH:-$DEFAULT_IDENTITY_PATH}

#lets go!
echo "Getting requirements..."

pip install -r "$ROOT"/requirements_gpu.txt
CONFIG_PATH="$ROOT/hivemind_exp/configs/gpu/grpo-qwen-2.5-0.5b-deepseek-r1.yaml"

echo ">> Done!"
echo ""
echo ""
echo "Good luck in the swarm!"

python -m hivemind_exp.gsm8k.train_single_gpu \
    --identity_path "$IDENTITY_PATH" \
    --wallet_private_key "$WALLET_PRIVATE_KEY" \
    --config "$CONFIG_PATH"
