ROMAN_DEFINITIONS = [
    ["M" , 1000],
    ["CM" , 900],
    ["D" , 500],
    ["CD" , 400],
    ["C" , 100],
    ["XC" , 90],
    ["L" , 50],
    ["XL" , 40],
    ["X" , 10],
    ["IX" , 9],
    ["V" , 5],
    ["IV" , 4],
    ["I" , 1]
]     

def fromRoman(romanNumber)
    romanDup = romanNumber.dup
    if (romanDup !~ /^[IVXLCDM]*$/)
        raise TypeError
    end
    number =  0
    for romSymbol, arabicNum in ROMAN_DEFINITIONS
        while romanDup.index(romSymbol) == 0
            number += arabicNum
            romanDup.slice!(romSymbol)
        end
    end
    return number 
end

def toRoman(arabicNumber)
    if(arabicNumber <= 0 || arabicNumber >= 4000)
        raise RangeError
    else
        roman_numeral = ""
        for romSymbol, romNum in ROMAN_DEFINITIONS
        counter = arabicNumber / romNum
        arabicNumber = arabicNumber % romNum
        roman_numeral << (romSymbol * counter)
        end
        return roman_numeral
    end
end