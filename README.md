# char\_range\_eq3\_benchmark

Active Supportの `Range#===`（[ActiveSupport::CompareWithRange#===](https://api.rubyonrails.org/classes/ActiveSupport/CompareWithRange.html#method-i-3D-3D-3D)）と通常の `Range#===` の実行速度を比較するベンチマーク。

## 実行環境

* Mac mini (2018)
    * CPU：Intel Core i7 3.2 GHz 6コア
    * メモリ：DDR4 2667 MHz 16 GB
    * SSD 256 GB
    * macOS Catalina 10.15.7
* Ruby 3.0.1

## 実行結果

[BenchmarkDriver](https://github.com/benchmark-driver/benchmark-driver)上で実行。

```
$ bundle exec ruby char_range_eq3_benchmark.rb
Warming up --------------------------------------
         Default ===    55.360k i/s -     58.740k times in 1.061047s (18.06μs/i)
  Active Support ===    44.636k i/s -     48.455k times in 1.085554s (22.40μs/i)
Calculating -------------------------------------
         Default ===    55.020k i/s -    166.081k times in 3.018555s (18.18μs/i)
  Active Support ===    45.137k i/s -    133.908k times in 2.966715s (22.15μs/i)

Comparison:
         Default ===:     55020.0 i/s
  Active Support ===:     45136.8 i/s - 1.22x  slower
```
