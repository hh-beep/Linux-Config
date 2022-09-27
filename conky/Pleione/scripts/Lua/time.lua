words = {"One ", "Two ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine "}
levels = {"THOUSAND ", "MILLION ", "BILLION ", "TRILLION ", "QUADRILLION ", "QUINTILLION ", "SEXTILLION ", "SEPTILLION ", "OCTILLION ", [0] = ""}
iwords = {"Ten ", "Twenty ", "Thirty ", "Forty ", "Fifty ", "Sixty ", "Seventy ", "Eighty ", "Ninety "}
twords = {"Eleven ", "Twelve ", "Thirteen ", "Fourteen ", "Fifteen ", "Sixteen ", "Seventeen ", "Eighteen ", "Nineteen "}

function digits(n)
  local i, ret = -1
  return function()
    i, ret = i + 1, n % 10
    if n > 0 then
      n = math.floor(n / 10)
      return i, ret
    end
  end
end

level = false
function getname(pos, dig)
  level = level or pos % 3 == 0
  if(dig == 0) then return "" end
  local name = (pos % 3 == 1 and iwords[dig] or words[dig]) .. (pos % 3 == 2 and "HUNDRED " or "")
  if(level) then name, level = name .. levels[math.floor(pos / 3)], false end
  return name
end

function numberToWord(number)
    return number 
end

function conky_Hour()
    return numberToWord(os.date("%I"))
end

function conky_Minute()
    return numberToWord(os.date("%M"))
end

function conky_Date()
    return numberToWord(os.date("%d"))
end
