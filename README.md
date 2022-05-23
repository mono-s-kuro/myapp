# myapp
<h1>起動方法</h1>
GithubからダウンロードしたプロジェクトをMacで開いて
ViewModeフォルダ直下にあるファイル全てのfetch関数内のipアドレスにサーバーのURLを入力。
実機やシミュレータでビルドするときは1度目のビルドでネットワークへのアクセス許可をした後にfetchを発火できないので、
一度目のビルドでネットワークへのアクセスをオンにして、再ビルドをかければデータの表示とクエリの発火ができるようになる
<h1>各クラスの説明</h1>
<h2>myappAPP</h2>
作成時からデフォルトで使用。変更なし
<h1>ContentView　→ Sections(一層目、二層目) →SubCell(三層目＋SubViewへのナビゲーション)</h1>
NavigationViewの中にListを作り、次の画面に遷移できるようにした。

階層構造再現のため、Sectionで階層的な構造と配列のループでリンクまで実装しようとしたが、
ネストが多くなり、コンパイラが型判別できなくなり、別々のファイルに分けたが、
それでもcontentの入った配列からbodyを取ってくるまでに処理を開始してbodyのnil判定が全てnilになってしまい、NavigationLinkが有効にならなかった。
そのため、場合分け処理を諦め、SubViewにデフォルトで遷移するようにした。

起動時処理の.onAppearで階層構造とコンテンツのAPIを叩いて配列に保持するまでを行なっている ->	treeModel.fetch()		viewModel.fetch()

<h2>SubView</h2>
大半の時間をContentViewの実装に使ってしまったのでほとんど実装できなかったが、
画面表示時の.onAppearでContentViewから引き継いだidを使いAPIからtitleとbodyを取得し表示		viewModelByid.fetch(id: id)

（実装しようとしたもの）画面上部のボタンでputリクエストを送れるようにしたが、ステータスコードは正常で、メソッドとパラメーターはちゃんとしているがコンテンツが書きかわらない。
Query.put(title: title, body:mybody , id: id)


<h2>ViewModelフォルダ直下のクラス<h2>
<h3>queryクラス</h3>
PUT、DELETE、POSTに対応したクエリでサーバーにアクセスする（現在PUTのみ実装）
<h3>TreeViewModelクラス</h3>
/content-tree		から取ってきたJSONを構造体に変換。外部からアクセスできるようにObservableObjectをクラスを継承している。
<h3>ViewModelクラス</h3>
/content			から取ってきたJSONを構造体に変換。外部からアクセスできるようにObservableObjectをクラスを継承している。
<h3>ViewModelByIdクラス</h3>
/content/[id]		から取ってきたJSONを構造体に変換。外部からアクセスできるようにObservableObjectをクラスを継承している。

<h2>Viewフォルダ直下のクラス</h2>
<h3>Sectionsクラス</h3>
SubCell

<h1>要件に関して</h1>
できるだけ仕様に添えるように実装を考えたが、SwiftUIの非同期とデータ操作が非常に相性が悪く、
用件を実装していく中で経験値が足りなかった部分も多かった。
サーバーとの中間にサーバーを立ててスマホからのリクエストにツリー構造のJSONを生成してレスポンスできるサーバーがあると用件を満たせるかなという所感。
