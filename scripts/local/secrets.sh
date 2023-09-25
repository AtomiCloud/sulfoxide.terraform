#!/usr/bin/env bash

set -eou pipefail

echo "🔏 Setting up secrets for local development..."
while ! (doppler me --json | jq -r '.workplace.name' | grep 'AtomiCloud') &>/dev/null; do

  doppler login
done

echo "⬇️ Downloading local secrets..."
doppler secrets substitute tfvars.tpl -p root -c main >*.auto.tfvars
./scripts/local/sync.sh
echo "✅ Secrets set up for local development!"
