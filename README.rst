==============
 sed レシピ集
==============

はじめに
========

このスクリプト集は、 `<http://sed.sourceforge.net/sed1line.txt>`_ に記載されている sed のレシピ集を実際の実行例を表示できるようにしたものです。

元のレシピ集をより理解しやすくするために、いくつかのレシピを追加しています。


使い方
======

git clone した後、 bin ディレクトリ以下のコマンドを実行してください。どのような結果が表示されるかは、このドキュメントに記載しています。


スクリプト解説
==============


sed1.sh
-------

sed G ${SRC_FILE}
~~~~~~~~~~~~~~~~~

.. double space a file 

改行を1つ追加して出力する。

sed '/cat.*/G' ${SRC_FILE}
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. insert a blank line below every line which matches "regex"

正規表現にマッチした行の下に空行を追加する。bin/sed4.sh も参照のこと。


sed2.sh
-------

sed '/^$/d' ${SRC_FILE}
~~~~~~~~~~~~~~~~~~~~~~~

空行を全部削除する。


sed '/^$/d;G' ${SRC_FILE}
~~~~~~~~~~~~~~~~~~~~~~~~~

.. double space a file which already has blank lines in it. Output file
.. should contain no more than one blank line between lines of text.

改行を1つ追加して出力。ただし、2行以上空行が続く箇所は1行にまとめる。


sed3.sh
-------

sed 'n;d' ${SRC_FILE}
~~~~~~~~~~~~~~~~~~~~~

1行置きに行を削除。

n は1行置きにパターンスペースに読み込むオプション。


sed4.sh
-------

sed '/cat.*/{x;p;x;}' ${SRC_FILE}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. insert a blank line above and below every line which matches "regex"

正規表現にマッチした行の上に空行を追加する。

x ホールドスペースとパターンスペースを入れ替える

p 現在のパターンスペースを表示する

ここは以下の処理を行っている。

(1) ホールドスペースとパターンスペースを入れ替え、
(2) ホールドスペースを表示し、
(3) そしてパターンスペースを呼び戻す。

bin/sed1.sh も参照のこと。

sed5.sh
-------

sed = ${SRC_FILE}
~~~~~~~~~~~~~~~~~~

'=' は行番号を表示する。同一行に表示するわけではないので注意。


sed = ${SRC_FILE} | sed 'N;s/\n/ /'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. number each line of a file (simple left alignment).

行番号を、同一行に左寄せで表示する。

N は次の行をパターンスペースに追加する。

's/[正規表現]/[置換文字列]/' で特定の文字列を置換可能。

つまりここでは、「行1 + 改行 + 行2」というパターンスペースを「行1 + (スペース) + 行2」の形に置換している。
