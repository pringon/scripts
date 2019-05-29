#!/bin/bash
extensions=(
  ["typescript"]="ts"
  ["javascript"]="js"
  ["python"]="py"
  ["c++"]="cpp"
  ["c"]="c"
  ["haskell"]="hs"
)

function escape_underscore {
  string=$1
  echo "${string/_/\\_}"
}

function begin_listing {
  {
    echo "\\textbf{$(escape_underscore $1)}"
    "\\begin{minted}"
    "["
    "linenos"
    "]"
    "{$2}"
    ""
  } >> listing.tex
}

function end_listing {
  {
    echo "\\end{minted}"
    ""
  } >> listing.tex
}

rm -f listing.tex
touch listing.tex

for file in $(find ./$1 -type f -name "*.${extensions[$2]}");
do
  begin_listing "$file" "$2"
  cat "$file" >> listing.tex
  end_listing
done
