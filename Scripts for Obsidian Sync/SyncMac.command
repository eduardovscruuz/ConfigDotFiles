#!/bin/bash

cd "$(dirname "$0")"

echo "Fazendo pull..."
git pull

if [ $? -ne 0 ]; then
  echo -e "\n❌ Erro no pull. Corrija antes de continuar."
  read -n 1 -s -r -p "Pressione qualquer tecla para sair..."
  osascript -e 'tell application "Terminal" to quit' &
  exit 1
fi

git add .
git commit -m "Synced via Mac" --allow-empty
git push

if [ $? -eq 0 ]; then
  echo -e "\n✅ Push realizado com sucesso!"
else
  echo -e "\n❌ Erro durante o push."
fi

echo
read -n 1 -s -r -p "Pressione qualquer tecla para sair..."
osascript -e 'tell application "Terminal" to quit' &
exit 0
