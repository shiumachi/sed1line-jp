#!/bin/sh

BIN=$(cd $(dirname $0);pwd)
echo "bin=${BIN}"
source ${BIN}/source.sh


SRC_FILE=${DATA_DIR}/test1.txt


echo "--------- input ----------"

echo "source: ${SRC_FILE}"
cat ${SRC_FILE}

echo "---------------------------"
echo "sed G ${SRC_FILE}"
echo "# double space a file "
echo "# 改行を1つ追加して出力"
echo "---------------------------"
sed G ${DATA_DIR}/test1.txt
echo "---------------------------"
echo "sed '/cat.*/G' ${SRC_FILE}"
echo '# insert a blank line below every line which matches "regex"'
echo "# 正規表現にマッチした行の下に空行を追加する"
echo "# bin/sed4.sh も参照のこと"
echo "---------------------------"
sed '/cat.*/G' ${SRC_FILE}

