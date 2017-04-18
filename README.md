Yunoki.rb
=========

異體字變換 program

# 概要

異體字を變換する program です．異體字の data は http://wwwap.hi.u-tokyo.ac.jp/ships/itaiji_list.jsp にある「史料編纂所データベース異体字同定一覧」に基づいてゐます．

# 動作環境

- linuxBean 14.04 ( Ubuntu Linux 14.04 から派生 )
- Ruby 1.9.3p484 (2013-11-22 revision 43786) [i686-linux]

で動作を確認してゐます．

# 使ひ方

變換前の字を標準入力に渡すと，變換後の字を標準出力に表示します：

```
$ echo 亜 | ruby Yunoki.rb

亞
```

變換前の字は第 0 引數として渡しても同じ動作をします：

```
$ ruby Yunoki.rb 亜

亞
```

變換は toggle 方式です：

```
$ echo 亜 | ruby Yunoki.rb

亞
```

```
$ echo 亜 | ruby Yunoki.rb | ruby Yunoki.rb

亜
```

異體字が複數あるときは， `table.dat` の順で變換します：

```
$ echo 弁 | ruby Yunoki.rb

辨

$ echo 辨 | ruby Yunoki.rb

辧

$ echo 辧 | ruby Yunoki.rb
瓣
```

# Emacs からの利用

```
(defun ieremii-replace-char nil
 (interactive)
 (save-excursion
  (backward-char)
  (set-mark-command nil)
  (forward-char)
  (shell-command-on-region (region-beginning) (region-end) "ruby /home/ieremius/prd/src/Yunoki.rb/Yunoki.rb" nil t))
 (forward-char))
```

を eval すると，變換したい文字の後ろに cursor を置いて `ieremii-replace-char` を實行すれば異體字に變換することができます．ただし，上の code 中の `Yunoki.rb` の path は適當に書き替へてください．この code は 

- linuxBean 14.04 ( Ubuntu Linux 14.04 から派生 )
- GNU Emacs 24.3.1

で動作確認してゐます．

# 名前の由來

私の故郷である靜岡市にある靜岡鐵道の柚木 ( ゆのき ) 驛から名前をもらつてゐます．
