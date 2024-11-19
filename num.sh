echo "AMOUNT is $AMOUNT"
echo "ACTOR is $ACTOR"
git config --global user.name "${ACTOR}"
git config --global user.email "${ACTOR}@users.noreply.github.com"
pwsh ./num.ps1 $AMOUNT
git add .
git commit -m 'num'
git push origin HEAD:main
