echo "SAVEPATH is $SAVEPATH"
echo "OUTPATH is $OUTPATH"
git config --global user.name "$ACTOR"
git config --global user.email "${ACTOR}@users.noreply.github.com"
mcs -out mc-to-lac.exe mc-to-lac.cs
mono mc-to-lac.exe
git add .
git commit -m 'mc-to-lac'
git push origin HEAD:main
