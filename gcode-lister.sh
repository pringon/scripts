function escape_underscore {
  string=$1
  echo ${string/_/\\_}
}

function begin_listing {
  echo "\\textbf{$(escape_underscore $1)}" >> listing.tex
  echo "\\begin{minted}" >> listing.tex
  echo "[" >> listing.tex
  echo "linenos" >> listing.tex
  echo "]" >> listing.tex
  echo "{$2}" >> listing.tex
  echo "" >> listing.tex
}

function end_listing {
  echo "\\end{minted}" >> listing.tex
  echo "" >> listing.tex
}

rm -f listing.tex
touch listing.tex

for file in $(find ./$1 -type f -name "*" ! -name "config.*" ! -name ".*");
do
  begin_listing $file $2
  cat $file >> listing.tex
  end_listing
done
