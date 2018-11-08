module EastAsianWidth
  def self.east_asian_width(character)
    x = character.codepoints[0]
    y = character.codepoints[1] || 0
    codepoint = x
    if (0xD800 <= x && x <= 0xDBFF) && (0xDC00 <= y && y <= 0xDFFF)
      x &= 0x3FF
      y &= 0x3FF
      codepoint = (x << 10) | y
      codepoint += 0x10000
    end

    if (0x3000 == codepoint) ||
       (0xFF01 <= codepoint && codepoint <= 0xFF60) ||
       (0xFFE0 <= codepoint && codepoint <= 0xFFE6)
      'F'
    elsif (0x20A9 == codepoint) ||
          (0xFF61 <= codepoint && codepoint <= 0xFFBE) ||
          (0xFFC2 <= codepoint && codepoint <= 0xFFC7) ||
          (0xFFCA <= codepoint && codepoint <= 0xFFCF) ||
          (0xFFD2 <= codepoint && codepoint <= 0xFFD7) ||
          (0xFFDA <= codepoint && codepoint <= 0xFFDC) ||
          (0xFFE8 <= codepoint && codepoint <= 0xFFEE)
      'H'
    elsif (0x1100 <= codepoint && codepoint <= 0x115F) ||
          (0x11A3 <= codepoint && codepoint <= 0x11A7) ||
          (0x11FA <= codepoint && codepoint <= 0x11FF) ||
          (0x2329 <= codepoint && codepoint <= 0x232A) ||
          (0x2E80 <= codepoint && codepoint <= 0x2E99) ||
          (0x2E9B <= codepoint && codepoint <= 0x2EF3) ||
          (0x2F00 <= codepoint && codepoint <= 0x2FD5) ||
          (0x2FF0 <= codepoint && codepoint <= 0x2FFB) ||
          (0x3001 <= codepoint && codepoint <= 0x303E) ||
          (0x3041 <= codepoint && codepoint <= 0x3096) ||
          (0x3099 <= codepoint && codepoint <= 0x30FF) ||
          (0x3105 <= codepoint && codepoint <= 0x312D) ||
          (0x3131 <= codepoint && codepoint <= 0x318E) ||
          (0x3190 <= codepoint && codepoint <= 0x31BA) ||
          (0x31C0 <= codepoint && codepoint <= 0x31E3) ||
          (0x31F0 <= codepoint && codepoint <= 0x321E) ||
          (0x3220 <= codepoint && codepoint <= 0x3247) ||
          (0x3250 <= codepoint && codepoint <= 0x32FE) ||
          (0x3300 <= codepoint && codepoint <= 0x4DBF) ||
          (0x4E00 <= codepoint && codepoint <= 0xA48C) ||
          (0xA490 <= codepoint && codepoint <= 0xA4C6) ||
          (0xA960 <= codepoint && codepoint <= 0xA97C) ||
          (0xAC00 <= codepoint && codepoint <= 0xD7A3) ||
          (0xD7B0 <= codepoint && codepoint <= 0xD7C6) ||
          (0xD7CB <= codepoint && codepoint <= 0xD7FB) ||
          (0xF900 <= codepoint && codepoint <= 0xFAFF) ||
          (0xFE10 <= codepoint && codepoint <= 0xFE19) ||
          (0xFE30 <= codepoint && codepoint <= 0xFE52) ||
          (0xFE54 <= codepoint && codepoint <= 0xFE66) ||
          (0xFE68 <= codepoint && codepoint <= 0xFE6B) ||
          (0x1B000 <= codepoint && codepoint <= 0x1B001) ||
          (0x1F200 <= codepoint && codepoint <= 0x1F202) ||
          (0x1F210 <= codepoint && codepoint <= 0x1F23A) ||
          (0x1F240 <= codepoint && codepoint <= 0x1F248) ||
          (0x1F250 <= codepoint && codepoint <= 0x1F251) ||
          (0x20000 <= codepoint && codepoint <= 0x2F73F) ||
          (0x2B740 <= codepoint && codepoint <= 0x2FFFD) ||
          (0x30000 <= codepoint && codepoint <= 0x3FFFD)
      'W'
    elsif (0x0020 <= codepoint && codepoint <= 0x007E) ||
          (0x00A2 <= codepoint && codepoint <= 0x00A3) ||
          (0x00A5 <= codepoint && codepoint <= 0x00A6) ||
          (0x00AC == codepoint) ||
          (0x00AF == codepoint) ||
          (0x27E6 <= codepoint && codepoint <= 0x27ED) ||
          (0x2985 <= codepoint && codepoint <= 0x2986)
      'Na'
    elsif (0x00A1 == codepoint) ||
          (0x00A4 == codepoint) ||
          (0x00A7 <= codepoint && codepoint <= 0x00A8) ||
          (0x00AA == codepoint) ||
          (0x00AD <= codepoint && codepoint <= 0x00AE) ||
          (0x00B0 <= codepoint && codepoint <= 0x00B4) ||
          (0x00B6 <= codepoint && codepoint <= 0x00BA) ||
          (0x00BC <= codepoint && codepoint <= 0x00BF) ||
          (0x00C6 == codepoint) ||
          (0x00D0 == codepoint) ||
          (0x00D7 <= codepoint && codepoint <= 0x00D8) ||
          (0x00DE <= codepoint && codepoint <= 0x00E1) ||
          (0x00E6 == codepoint) ||
          (0x00E8 <= codepoint && codepoint <= 0x00EA) ||
          (0x00EC <= codepoint && codepoint <= 0x00ED) ||
          (0x00F0 == codepoint) ||
          (0x00F2 <= codepoint && codepoint <= 0x00F3) ||
          (0x00F7 <= codepoint && codepoint <= 0x00FA) ||
          (0x00FC == codepoint) ||
          (0x00FE == codepoint) ||
          (0x0101 == codepoint) ||
          (0x0111 == codepoint) ||
          (0x0113 == codepoint) ||
          (0x011B == codepoint) ||
          (0x0126 <= codepoint && codepoint <= 0x0127) ||
          (0x012B == codepoint) ||
          (0x0131 <= codepoint && codepoint <= 0x0133) ||
          (0x0138 == codepoint) ||
          (0x013F <= codepoint && codepoint <= 0x0142) ||
          (0x0144 == codepoint) ||
          (0x0148 <= codepoint && codepoint <= 0x014B) ||
          (0x014D == codepoint) ||
          (0x0152 <= codepoint && codepoint <= 0x0153) ||
          (0x0166 <= codepoint && codepoint <= 0x0167) ||
          (0x016B == codepoint) ||
          (0x01CE == codepoint) ||
          (0x01D0 == codepoint) ||
          (0x01D2 == codepoint) ||
          (0x01D4 == codepoint) ||
          (0x01D6 == codepoint) ||
          (0x01D8 == codepoint) ||
          (0x01DA == codepoint) ||
          (0x01DC == codepoint) ||
          (0x0251 == codepoint) ||
          (0x0261 == codepoint) ||
          (0x02C4 == codepoint) ||
          (0x02C7 == codepoint) ||
          (0x02C9 <= codepoint && codepoint <= 0x02CB) ||
          (0x02CD == codepoint) ||
          (0x02D0 == codepoint) ||
          (0x02D8 <= codepoint && codepoint <= 0x02DB) ||
          (0x02DD == codepoint) ||
          (0x02DF == codepoint) ||
          (0x0300 <= codepoint && codepoint <= 0x036F) ||
          (0x0391 <= codepoint && codepoint <= 0x03A1) ||
          (0x03A3 <= codepoint && codepoint <= 0x03A9) ||
          (0x03B1 <= codepoint && codepoint <= 0x03C1) ||
          (0x03C3 <= codepoint && codepoint <= 0x03C9) ||
          (0x0401 == codepoint) ||
          (0x0410 <= codepoint && codepoint <= 0x044F) ||
          (0x0451 == codepoint) ||
          (0x2010 == codepoint) ||
          (0x2013 <= codepoint && codepoint <= 0x2016) ||
          (0x2018 <= codepoint && codepoint <= 0x2019) ||
          (0x201C <= codepoint && codepoint <= 0x201D) ||
          (0x2020 <= codepoint && codepoint <= 0x2022) ||
          (0x2024 <= codepoint && codepoint <= 0x2027) ||
          (0x2030 == codepoint) ||
          (0x2032 <= codepoint && codepoint <= 0x2033) ||
          (0x2035 == codepoint) ||
          (0x203B == codepoint) ||
          (0x203E == codepoint) ||
          (0x2074 == codepoint) ||
          (0x207F == codepoint) ||
          (0x2081 <= codepoint && codepoint <= 0x2084) ||
          (0x20AC == codepoint) ||
          (0x2103 == codepoint) ||
          (0x2105 == codepoint) ||
          (0x2109 == codepoint) ||
          (0x2113 == codepoint) ||
          (0x2116 == codepoint) ||
          (0x2121 <= codepoint && codepoint <= 0x2122) ||
          (0x2126 == codepoint) ||
          (0x212B == codepoint) ||
          (0x2153 <= codepoint && codepoint <= 0x2154) ||
          (0x215B <= codepoint && codepoint <= 0x215E) ||
          (0x2160 <= codepoint && codepoint <= 0x216B) ||
          (0x2170 <= codepoint && codepoint <= 0x2179) ||
          (0x2189 == codepoint) ||
          (0x2190 <= codepoint && codepoint <= 0x2199) ||
          (0x21B8 <= codepoint && codepoint <= 0x21B9) ||
          (0x21D2 == codepoint) ||
          (0x21D4 == codepoint) ||
          (0x21E7 == codepoint) ||
          (0x2200 == codepoint) ||
          (0x2202 <= codepoint && codepoint <= 0x2203) ||
          (0x2207 <= codepoint && codepoint <= 0x2208) ||
          (0x220B == codepoint) ||
          (0x220F == codepoint) ||
          (0x2211 == codepoint) ||
          (0x2215 == codepoint) ||
          (0x221A == codepoint) ||
          (0x221D <= codepoint && codepoint <= 0x2220) ||
          (0x2223 == codepoint) ||
          (0x2225 == codepoint) ||
          (0x2227 <= codepoint && codepoint <= 0x222C) ||
          (0x222E == codepoint) ||
          (0x2234 <= codepoint && codepoint <= 0x2237) ||
          (0x223C <= codepoint && codepoint <= 0x223D) ||
          (0x2248 == codepoint) ||
          (0x224C == codepoint) ||
          (0x2252 == codepoint) ||
          (0x2260 <= codepoint && codepoint <= 0x2261) ||
          (0x2264 <= codepoint && codepoint <= 0x2267) ||
          (0x226A <= codepoint && codepoint <= 0x226B) ||
          (0x226E <= codepoint && codepoint <= 0x226F) ||
          (0x2282 <= codepoint && codepoint <= 0x2283) ||
          (0x2286 <= codepoint && codepoint <= 0x2287) ||
          (0x2295 == codepoint) ||
          (0x2299 == codepoint) ||
          (0x22A5 == codepoint) ||
          (0x22BF == codepoint) ||
          (0x2312 == codepoint) ||
          (0x2460 <= codepoint && codepoint <= 0x24E9) ||
          (0x24EB <= codepoint && codepoint <= 0x254B) ||
          (0x2550 <= codepoint && codepoint <= 0x2573) ||
          (0x2580 <= codepoint && codepoint <= 0x258F) ||
          (0x2592 <= codepoint && codepoint <= 0x2595) ||
          (0x25A0 <= codepoint && codepoint <= 0x25A1) ||
          (0x25A3 <= codepoint && codepoint <= 0x25A9) ||
          (0x25B2 <= codepoint && codepoint <= 0x25B3) ||
          (0x25B6 <= codepoint && codepoint <= 0x25B7) ||
          (0x25BC <= codepoint && codepoint <= 0x25BD) ||
          (0x25C0 <= codepoint && codepoint <= 0x25C1) ||
          (0x25C6 <= codepoint && codepoint <= 0x25C8) ||
          (0x25CB == codepoint) ||
          (0x25CE <= codepoint && codepoint <= 0x25D1) ||
          (0x25E2 <= codepoint && codepoint <= 0x25E5) ||
          (0x25EF == codepoint) ||
          (0x2605 <= codepoint && codepoint <= 0x2606) ||
          (0x2609 == codepoint) ||
          (0x260E <= codepoint && codepoint <= 0x260F) ||
          (0x2614 <= codepoint && codepoint <= 0x2615) ||
          (0x261C == codepoint) ||
          (0x261E == codepoint) ||
          (0x2640 == codepoint) ||
          (0x2642 == codepoint) ||
          (0x2660 <= codepoint && codepoint <= 0x2661) ||
          (0x2663 <= codepoint && codepoint <= 0x2665) ||
          (0x2667 <= codepoint && codepoint <= 0x266A) ||
          (0x266C <= codepoint && codepoint <= 0x266D) ||
          (0x266F == codepoint) ||
          (0x269E <= codepoint && codepoint <= 0x269F) ||
          (0x26BE <= codepoint && codepoint <= 0x26BF) ||
          (0x26C4 <= codepoint && codepoint <= 0x26CD) ||
          (0x26CF <= codepoint && codepoint <= 0x26E1) ||
          (0x26E3 == codepoint) ||
          (0x26E8 <= codepoint && codepoint <= 0x26FF) ||
          (0x273D == codepoint) ||
          (0x2757 == codepoint) ||
          (0x2776 <= codepoint && codepoint <= 0x277F) ||
          (0x2B55 <= codepoint && codepoint <= 0x2B59) ||
          (0x3248 <= codepoint && codepoint <= 0x324F) ||
          (0xE000 <= codepoint && codepoint <= 0xF8FF) ||
          (0xFE00 <= codepoint && codepoint <= 0xFE0F) ||
          (0xFFFD == codepoint) ||
          (0x1F100 <= codepoint && codepoint <= 0x1F10A) ||
          (0x1F110 <= codepoint && codepoint <= 0x1F12D) ||
          (0x1F130 <= codepoint && codepoint <= 0x1F169) ||
          (0x1F170 <= codepoint && codepoint <= 0x1F19A) ||
          (0xE0100 <= codepoint && codepoint <= 0xE01EF) ||
          (0xF0000 <= codepoint && codepoint <= 0xFFFFD) ||
          (0x100000 <= codepoint && codepoint <= 0x10FFFD)
      'A'
    else
      'N'
    end
  end

  def self.character_length(character)
    code = east_asian_width(character)
    if %w[F W A].include? code
      2
    else
      1
    end
  end

  # Split a string considering surrogate-pairs.
  def self.string_to_array(string)
    string.scan(/[\\uD800-\\uDBFF][\\uDC00-\\uDFFF]|[^\\uD800-\\uDFFF]/)
  end

  def self.length(string)
    string_to_array(string)
      .map { |character| character_length(character) }
      .sum
  end

  def self.slice(text, start, end_)
    text_len = length(text)
    start ||= 0
    end_ ||= 1
    start = text_len + start if start < 0
    end_ = text_len + end_ if end_ < 0
    result = ''
    east_asian_width_len = 0
    chars = string_to_array(text)
    chars.each do |char|
      char_len = length(char)
      if east_asian_width_len >= start - (char_len == 2 ? 1 : 0)
        break if east_asian_width_len + char_len > end_

        result += char
      end
      east_asian_width_len += char_len
    end
    result
  end
end
