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
echo "sed = ${SRC_FILE} | sed 'N;s/\n/ /'"
echo "# number each line of a file (simple left alignment). "
echo "# 行番号を、同一行に左寄せで表示する"
echo "# N は次の行をパターンスペースに追加する"
echo "# 's/[正規表現]/[置換文字列]/' で特定の文字列を置換可能。"
echo "# つまりここでは、「行1 + 改行 + 行2」というパターンスペースを「行1 + (スペース) + 行2」の形に置換している。"
echo "---------------------------"
sed = ${SRC_FILE} | sed 'N;s/\n/ /'
