# StoreKit
Tried to solve an api compatibility for ios16. It's just an investigation so only use it for a reference.
It'll be realistic if the missing symbols are few (e.g. games or small apps), otherwise it's hard to keep compatibility.

## build
rm -rf .theos
make FINALPACKAGE=1

## patch
only for a specific app, so change the content of patch.sh is needed
./patch.sh </path/to/ipa>

## 手順
missingsymbolを発見時
1. 本当にios17+かどうか確認
  - appleのdocument
  - githubにあるios sdksのdumpでsymbolがあるか探す
  - installして確認

  - 旧版のアプリでその名前を調べる => 別の場所にあるならそれをリンクすれば良い
2. stub作成
  - framework全体がない場合は、idaからシンボルを全て取ってきて全てstubに?
  - IDAで同様のやつは、同時に追加

## 注意
ログを見るときは Referenced from にも注目、アプリ本体でない場合はそこにも注入が必要