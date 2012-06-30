
Icon Weather Forecast for Geektool
===================================

任意の都市の当日/翌日の天気を自作の天気アイコンを用いてデスクトップに表示するためのGeektool用スクリプト。
予報のデータには[Yahoo! Weather API][]を用いてます。

[Yahoo! Weather API]: http://developer.yahoo.com/weather/



インストール
----------------------------------------------------

1. 入っていない場合はCPANなどを用いて下記のPerlモジュールをインストールしておく。
	Terminalから以下を実行。

		$ sudo cpan -i XML::Simple
		$ sudo cpan -i LWP::Simple

2. ダウンロードしたファイル一式を任意の場所に保存する。
	`/Users/アカウント/Library/Application Support/GeekTool/` とか。どこでもいい。

3. 地域を設定する。
	weather.pl内 17行目当たりの location codes に予報したい都市の名前とWOEIDを入力する。
	WOEIDはYahoo! Weatherで用いられているる地域コード、地域の数は自由に増減可能。

4. GeekTool で新しい Shell Geeklet を作り、_Command_ 欄に
	
		perl スクリプトへのパス/weather.pl
		
	を、そして _Refresh every_ の欄に任意の更新間隔を入力し、weather.pl を定期的に実行させる。
	ちなみにこの Geeklet は特に何かが表示されるわけではないので適当な場所に置いておけば良い。

5. アイコンを表示。
	weather.pl が実行されると results/ ディレクトリに予報アイコンが生成されるので、
	それを GeekTool で Image Geeklet として表示させる。
	この際、先ほどのスクリプト実行用のGeekletと同じ更新間隔を割り当てる。


天気画像のカスタマイズ
----------------------------------------------------
作成したアイコンをicons/フォルダに入れれば良い。
Yahoo! Weatherの天気コード (condition code) と作成したアイコンの対応付けはweather.pl内 24行目からの辺りで行う。
左側がアイコン名、右側がそのアイコンを表示させたい天気コードである。
天気コードについては[Yahoo! Weather API][]のページを参照。
デフォルトでは本来数10個ある天気コードを大雑把に10種にグルーピングしてアイコンを割り当てているが、このグルーピングも自由に変更できる。
元々入ってる画像はデモ用のようなもんなので、ぜひお好きなアイコンに入れ替えてお使いください。


作者
----------------------------------------------------
1024jp

- website: [ヴォルフロッシュ](http://wolfrosch.com/)
- github : [1024jp](https://github.com/1024jp)


ライセンス
----------------------------------------------------
本スクリプト・スイートは [クリエイティブ・コモンズ 表示 - 非営利 3.0 非移植 ライセンス](cc) の下に提供されています。
[cc]: http://creativecommons.org/licenses/by-nc/3.0/deed.ja
