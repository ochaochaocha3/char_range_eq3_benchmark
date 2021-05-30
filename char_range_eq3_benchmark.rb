# frozen_string_literal: true

require 'benchmark_driver'

Benchmark.driver do |x|
  x.prelude <<~RUBY
    class Range
      alias old_eq3 ===
    end

    require 'active_support/core_ext/range/compare_range'

    r = "\\x00"..."\\x20"

    # Example from https://modern.ircdocs.horse/formatting.html#examples
    s = "Rules: Don't spam 5\\x0313,8,6\\x03,7,8, and especially not \\x029\\x02\\x1D!"
  RUBY

  x.report 'Default ===', %q! s.each_char { |c| r.old_eq3(c) } !
  x.report 'Active Support ===', %q! s.each_char { |c| r === c } !
end
