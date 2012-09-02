#!/bin/sh

BIN=$(cd $(dirname $0);pwd)
echo "bin=${BIN}"
source ${BIN}/source.sh


SRC_FILE=${DATA_DIR}/test4.txt


echo "--------- input ----------"

echo "source: ${SRC_FILE}"
cat ${SRC_FILE}

echo "---------------------------"
echo "sed '/cat.*/{x;p;x;}' ${SRC_FILE}"
echo '# insert a blank line above and below every line which matches "regex"'
echo "# 正規表現にマッチした行の上に空行を追加する"
echo "# x ホールドスペースとパターンスペースを入れ替える"
echo "# p 現在のパターンスペースを表示する"
echo "# ここでの作業は、(1) ホールドスペースとパターンスペースを入れ替え、"
echo "# (2) ホールドスペースを表示し、"
echo "# (3) そしてパターンスペースを呼び戻す、ということを行っている。"
echo "# bin/sed1.sh も参照のこと"
echo "---------------------------"
sed '/cat.*/{x;p;x;}' ${SRC_FILE}
echo "---------------------------"
echo "sed '/cat.*/{x;p;x;G;}' ${SRC_FILE}"
echo '# insert a blank line above and below every line which matches "regex"'
echo "# 正規表現にマッチした行の上と下に空行を追加する"
echo "---------------------------"
sed '/cat.*/{x;p;x;G;}' ${SRC_FILE}
