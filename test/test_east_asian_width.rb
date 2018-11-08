require "minitest/autorun"

require('./lib/east_asian_width.rb')

describe EastAsianWidth do
  before do
    @eaw = EastAsianWidth
  end

  describe "east_asian_width" do
    it "Fullwidth" do
      @eaw.east_asian_width('￠').must_equal "F"
      @eaw.east_asian_width('￦').must_equal "F"
    end

    it "Halfwidth" do
      @eaw.east_asian_width('｡').must_equal "H"
      @eaw.east_asian_width('ￜ').must_equal "H"
    end

    it "Wide" do
      @eaw.east_asian_width('ㄅ').must_equal "W"
      @eaw.east_asian_width('뀀').must_equal "W"
    end

    it "Narrow" do
      @eaw.east_asian_width('¢').must_equal "Na"
      @eaw.east_asian_width('⟭').must_equal "Na"
      @eaw.east_asian_width('a').must_equal "Na"
    end

    it "Ambiguous" do
      @eaw.east_asian_width('⊙').must_equal "A"
      @eaw.east_asian_width('①').must_equal "A"
    end

    it "Natural" do
      @eaw.east_asian_width('ب').must_equal "N"
      @eaw.east_asian_width('ف').must_equal "N"
    end
  end

  describe "character_length" do
    it "Fullwidth" do
      @eaw.character_length('￠').must_equal 2
      @eaw.character_length('￦').must_equal 2
      @eaw.character_length('𩸽').must_equal 2
    end

    it "Halfwidth" do
      @eaw.character_length('｡').must_equal 1
      @eaw.character_length('ￜ').must_equal 1
    end

    it "Wide" do
      @eaw.character_length('ㄅ').must_equal 2
      @eaw.character_length('뀀').must_equal 2
    end

    it "Narrow" do
      @eaw.character_length('¢').must_equal 1
      @eaw.character_length('⟭').must_equal 1
      @eaw.character_length('a').must_equal 1
    end

    it "Ambiguous" do
      @eaw.character_length('⊙').must_equal 2
      @eaw.character_length('①').must_equal 2
    end

    it "Natural" do
      @eaw.character_length('ب').must_equal 1
      @eaw.character_length('ف').must_equal 1
    end
  end

  describe "length" do
    it "Fullwidth" do
      @eaw.length('あいうえお').must_equal 10
    end

    it "Halfwidth" do
      @eaw.length('abcdefg').must_equal 7
    end

    it "Mixed" do
      @eaw.length('￠￦｡ￜㄅ뀀¢⟭a⊙①بف').must_equal 19
    end

    it "Surrogate-Pair character included" do
      @eaw.length('a𩸽b').must_equal 4
    end
  end

  describe "slice" do
    it "Fullwidth" do
      @eaw.slice("あいうえお", 0, 6).must_equal "あいう"
      @eaw.slice("あいうえお", 2, 8).must_equal "いうえ"
      @eaw.slice("あいうえお", 4, 10).must_equal "うえお"
      @eaw.slice("あいうえお", 2, -2).must_equal "いうえ"
      @eaw.slice("あいうえお", -2, 10).must_equal "お"
    end
    it "Fullwidth, start / end is not aligned" do
      @eaw.slice("あいうえお", 0, 1).must_equal ""
      @eaw.slice("あいうえお", 1, 9).must_equal "あいうえ"
      @eaw.slice("あいうえお", 9, 10).must_equal "お"
      @eaw.slice("あいうえお", -1, 10).must_equal "お"
      @eaw.slice("あいうえお", 1, -1).must_equal "あいうえ"
    end
    it "Halfwidth" do
      @eaw.slice("abcdefg", 0, 3).must_equal "abc"
      @eaw.slice("abcdefg", 3, 6).must_equal "def"
      @eaw.slice("abcdefg", -2, 7).must_equal "fg"
      @eaw.slice("abcdefg", 5, -1).must_equal "f"
    end
    it "Mixed" do
      @eaw.slice("aあb", 0, 3).must_equal "aあ"
      @eaw.slice("aあb", 1, 4).must_equal "あb"
    end
    it "Mixed, start / end is not aligned" do
      @eaw.slice("aあb", 0, 2).must_equal "a"
      @eaw.slice("aあb", 2, 4).must_equal "あb"
      @eaw.slice("aあb", -2, 4).must_equal "あb"
      @eaw.slice("aあb", 2, -1).must_equal "あ"
      (@eaw.slice("aあb", 0, 2) + @eaw.slice("aあb", 2, 4)).must_equal "aあb"
    end
    it "Surrogate-Pair character included" do
      @eaw.slice("a𩸽b", 0, 3).must_equal "a𩸽"
      @eaw.slice("a𩸽b", 1, 4).must_equal "𩸽b"
    end
    it "Surrogate-Pair character included, start / end is not aligned" do
      @eaw.slice("a𩸽b", 0, 2).must_equal "a"
      @eaw.slice("a𩸽b", 2, 4).must_equal "𩸽b"
    end
  end
end
