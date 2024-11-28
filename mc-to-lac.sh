echo "SAVEPATH is $SAVEPATH"
echo "OUTPATH is $OUTPATH"
git config --global user.name "$ACTOR"
git config --global user.email "${ACTOR}@users.noreply.github.com"
pwsh ./mc-to-lac.ps1 -savepath $SAVEPATH -outpath $OUTPATH
git add .
git commit -m 'mc-to-lac'
git push origin HEAD:main
