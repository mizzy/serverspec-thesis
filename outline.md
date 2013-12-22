# serverspec 論文アウトライン

## タイトル

serverspec: 宣言的記述でサーバの状態をテスト可能な汎用性の高いテストフレームワーク(serverspec: A Versatile Test Framework for Testing States of Servers by Delarative Description)

## アブストラクト

システムの大規模・複雑化に伴い，サーバの構築・運用を効率化するために，サーバの状態をコードで記述する手法が数多く提案されている．それらの手法を効率良く扱うプロセスとして，テスト駆動開発の手法をサーバ構築に応用したTest-Driven Infrastructureが提案されている．

このプロセスを支援するテストフレームワークもいくつか登場しているが，あるものは特定の構成管理ツールに依存，またあるものはOS毎の違いを自ら吸収しなければならないなど、汎用性に難がある．

そこで，本論文では，特定の構成管理ツールやOSに依存することなく，サーバの状態を汎用的かつ可読性の高いコードでテスト可能なテストフレームワークを提案する．

提案手法では，汎用性を高めるために，これまでのOSや構成管理ツール固有の振る舞いを整理して一般化し，汎用コマンド実行フレームワークとして定義する．続いて，テストコード記述の抽象度を高め可読性を上げるために宣言的な記法で汎用コマンド実行フレームワークを操作できる制御テストフレームワークを定義する．これにより，管理者がOSや構成管理ツールの違いを気にすることなくサーバの状態を容易にテストできるようになり，サーバの運用・管理コストを低減できる．また，フレームワークを用途別に分離して定義することにより，制御テストフレームワークを独自の記述に変更する事も容易である．提案するテストフレームワークをserverspecと名付けた．

## 1. はじめに

 * システムの大規模・複雑化に伴い、サーバの構築・運用を効率化するためにサーバの状態をコードで記述する手法が数多く提案されている
   * CFEngineにはじまり、Puppet、Chef、Ansibleなど
   * SmartFrogもこの一種？
     * https://github.com/mizzy/serverspec-thesis/issues/2#issuecomment-31063257
   * Infrastructure as Code について書かれた論文等はあるか？
     * 書籍Web Operationsの第5章
 * それらの手法を効率よく扱うプロセスとしてのTest-Driven Infrastructure
   * 関連論文等はあるか？
   * [書籍](http://shop.oreilly.com/product/0636920030973.do)はある
   * その前身の Agile Infrastructure に触れてもよさそう
     * http://www.jedi.be/presentations/IEEE-Agile-Infrastructure.pdf
 * Patrick Debois氏のAgile Infrastructureに論文は2008年なので、Puppetの登場（2006年）より後、Chefの登場（2009年）より前。
     * Infrastructure as Codeはいつぐらいに出てきた言葉なのか？
       * 明確な出典は見つけられなかった。
       * ブログにも書いたけど、2006年のEC2、Puppet登場を契機としてわき上がってきた概念、という感じらしい
     * Test-Driven Infrastructureはいつぐらいに出てきた言葉なのか？
       * 書籍Test-Driven Infrastructure with Chefの初出は2011年
 * 流れ的には、Puppetの登場 -> Infrastructure as Code -> Agile Operation -> Chefの登場 -> Test-Driven Infrastructure という感じか。

## 2. サーバのテストの現状と課題

* サーバのテストってかつてはどうやってたんだろう？
  * 手動？
  * 監視との違いは？
* Chef以降のテスト
  * footcritic/puppet-lint のような文法チェック系
  * chefspec/rspec-puppetのようなpre-convergenceテスト
  * test-kitchen/cucumber-chefのようなpost-convergenceテスト
    * 実際にテストする部分と、テスト環境をつくる部分があり、ツールによっては密に結合してたりするので、いっしょくたにして論じない方が良さそう
  * 構成管理ツールに密結合してるのが課題

## 3. 提案するサーバテスト手法

## 4. 提案手法によりもたらされた成果


## 5. むすび

## 参考文献
