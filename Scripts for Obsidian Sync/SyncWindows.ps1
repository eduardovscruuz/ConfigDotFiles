git pull
if ($LASTEXITCODE -ne 0) { Write-Host "❌ Erro no pull. Verifique antes de continuar."; pause; exit }

git add .
git commit -m "Synced via Windows Machine" --allow-empty
git push
if ($LASTEXITCODE -eq 0) { exit } else { pause }
