TO_ROMAN = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
}

TO_ARABIC = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
}

def fromRoman(romanNumber)
    values = romanNumber.split(//).each do |x|
        if TO_ARABIC.keys.include?(x) == false
             raise TypeError
        end
    end

    values = values.map{ |e| TO_ARABIC[e] }
    values.map.with_index do |e, idx| 
        unless values[idx + 1].nil?
          then
            values[idx + 1] > e ? -e : e
          else e
        end
    end.sum
end

def toRoman(number)
    if number > 3999 or number < 1
        raise RangeError
    end

    roman_key = ""

    # find the 
    while number > 0
      TO_ROMAN.each do |key, value|
        if number >= key
          number -= key
          roman_key += value
          break
        end
      end
    end

    return roman_key
end
