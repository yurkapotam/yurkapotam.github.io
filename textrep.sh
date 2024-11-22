echo "AMOUNT is $AMOUNT"
echo "ACTOR is $ACTOR"
git config --global user.name "${ACTOR}"
git config --global user.email "${ACTOR}@users.noreply.github.com"
pwsh ./textrep.ps1 -amount $AMOUNT -text "TEXT"
git add .
git commit -m 'textrep'
git push origin HEAD:main
