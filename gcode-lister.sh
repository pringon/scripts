function begin_listing {
  echo "\\begin{minted}" >> listing.tex
  echo "[" >> listing.tex
  echo "linenos" >> listing.tex
  echo "]" >> listing.tex
  echo "{$1}" >> listing.tex
  echo "" >> listing.tex
}

function end_listing {
  echo "\\end{minted}" >> listing.tex
  echo "" >> listing.tex
}

rm -f listing.tex
touch listing.tex
echo "\\usepackage{minted}" >> listing.tex

for file in $(find ./$1 -type f -name "*" ! -name "config.*");
do
  begin_listing $2
  cat $file >> listing.tex
  end_listing
done
