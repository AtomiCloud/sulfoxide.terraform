#!/usr/bin/env bash

set -eou pipefail

init_login() {
  echo "🚨 Select Self-Hosting and key in 'https://secrets.atomi.cloud'" && infisical login
}

echo "🔏 Setting up secrets for local development..."
printf '\r\n' | infisical user switch &>/dev/null || init_login

echo "⬇️ Downloading local secrets..."
infisical run --env="main" ./scripts/local/gen.sh
./scripts/local/sync.sh
echo "✅ Secrets set up for local development!"
