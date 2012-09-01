#!/bin/sh

BIN=$(cd $(dirname $0);pwd)
echo "bin=${BIN}"
source ${BIN}/source.sh


SRC_FILE=${DATA_DIR}/test3.txt


echo "--------- input ----------"

echo "source: ${SRC_FILE}"
cat ${SRC_FILE}

echo "---------------------------"
echo "sed 'n;d' ${SRC_FILE}"
echo "# 1行置きに行を削除"
echo "# n は1行置きにパターンスペースに読み込むオプション"
echo "---------------------------"
sed 'n;d' ${SRC_FILE}
echo "---------------------------"
