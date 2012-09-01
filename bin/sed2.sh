#!/bin/sh

BIN=$(cd $(dirname $0);pwd)
echo "bin=${BIN}"
source ${BIN}/source.sh


SRC_FILE=${DATA_DIR}/test2.txt


echo "--------- input ----------"

echo "source: ${SRC_FILE}"
cat ${SRC_FILE}

echo "---------------------------"
echo "sed '/^$/d' ${SRC_FILE}"
echo "# 空行を全部削除"
echo "---------------------------"
sed '/^$/d' ${SRC_FILE}
echo "---------------------------"
echo "sed '/^$/d;G' ${SRC_FILE}"
echo "# double space a file which already has blank lines in it. Output file"
echo "# should contain no more than one blank line between lines of text."
echo "# 改行を1つ追加して出力。ただし、2行以上空行が続く箇所は1行にまとめる"
echo "---------------------------"
sed '/^$/d;G' ${SRC_FILE}
