#!/bin/sh

BIN=$(cd $(dirname $0);pwd)
echo "bin=${BIN}"
source ${BIN}/source.sh


SRC_FILE=${DATA_DIR}/test5.txt


echo "--------- input ----------"

echo "source: ${SRC_FILE}"
cat ${SRC_FILE}

echo "---------------------------"
echo "sed = ${SRC_FILE}"
echo "# '=' は行番号を表示する。同一行に表示するわけではないので注意"
echo "---------------------------"
sed = ${SRC_FILE}

echo "---------------------------"
echo "sed = ${SRC_FILE} | sed 'N;s/\\\n/ /'"
echo "# number each line of a file (simple left alignment). "
echo "# 行番号を、同一行に左寄せで表示する"
echo "# N は次の行をパターンスペースに追加する"
echo "# 's/[正規表現]/[置換文字列]/' で特定の文字列を置換可能。"
echo "# つまりここでは、「行1 + 改行 + 行2」というパターンスペースを「行1 + (スペース) + 行2」の形に置換している。"
echo "---------------------------"
sed = ${SRC_FILE} | sed 'N;s/\n/ /'

echo "---------------------------"
echo "sed = ${SRC_FILE} | sed 'N; s/^/     /; s/ *\(.\{6,\}\)\\\n/\1  /'"
echo "# number each line of a file (number on left, right-aligned)"
echo "# 行番号を、同一行左側右寄せで表示する"
echo "# s/^/     / で、行の最初にスペースを5つ追加する。このとき、直前で N を付加しているためこの処理は2行に1回行われる。"
echo "# s/ *\(.\{6,\}\)\\\n/\1  / まず、 .\{6,\} は任意の6文字以上の文字列を指す。スペース + * は、スペースが0回以上繰り返すことを指す。"
echo "# これらを合わせると、「数字が6ケタを超えるまでは数字+頭のスペースで合計6文字になるように、7ケタ以上は数字のみ」にマッチするようになる。"
echo "# この数字+スペース+改行を、数字+スペースのみ出力し、さらにスペース2つを加えている。改行を消しているので、Nによって連結された2行は実際の出力でも1行にまとめられる。"
echo "---------------------------"
sed = ${SRC_FILE} | sed 'N; s/^/     /; s/ *\(.\{6,\}\)\n/\1  /'

echo "---------------------------"
echo "sed '/./=' ${SRC_FILE} |  sed '/./N; s/\\\n/ /'  "
echo "# number each line of file, but only print numbers if line is not blank"
echo "# 行番号を、同一行に左寄せで表示する。ただし空行には行番号を表示しない。"
echo "# 行番号自体をスキップするわけではないことに注意。"
echo "---------------------------"
sed '/./=' ${SRC_FILE} |  sed '/./N; s/\n/ /'  
