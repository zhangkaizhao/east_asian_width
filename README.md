# East Asian Width

Get [East Asian Width](http://www.unicode.org/reports/tr11/) from a character.

'F'(Fullwidth), 'H'(Halfwidth), 'W'(Wide), 'Na'(Narrow), 'A'(Ambiguous) or 'N'(Natural).

Original Code is [東アジアの文字幅 (East Asian Width) の判定 - 中途](http://d.hatena.ne.jp/takenspc/20111126#1322252878).

---

This is a Ruby port of [East Asian Width](https://github.com/komagata/eastasianwidth).

Status: [b89f04d](https://github.com/komagata/eastasianwidth/commit/b89f04d44dc786885615e94cd6e2ba1ef7866fa4)

## Install

```sh
gem install east_asian_width
```

## Usage

```ruby
require 'east_asian_width'

puts EastAsianWidth.east_asian_width('￦') # -> 'F'
puts EastAsianWidth.east_asian_width('｡') # -> 'H'
puts EastAsianWidth.east_asian_width('뀀') # -> 'W'
puts EastAsianWidth.east_asian_width('a') # -> 'Na'
puts EastAsianWidth.east_asian_width('①') # -> 'A'
puts EastAsianWidth.east_asian_width('ف') # -> 'N'

puts EastAsianWidth.character_length('￦') # -> 2
puts EastAsianWidth.character_length('｡') # -> 1
puts EastAsianWidth.character_length('뀀') # -> 2
puts EastAsianWidth.character_length('a') # -> 1
puts EastAsianWidth.character_length('①') # -> 2
puts EastAsianWidth.character_length('ف') # -> 1

puts EastAsianWidth.length('あいうえお') # -> 10
puts EastAsianWidth.length('abcdefg') # -> 7
puts EastAsianWidth.length('￠￦｡ￜㄅ뀀¢⟭a⊙①بف') # -> 19
```
