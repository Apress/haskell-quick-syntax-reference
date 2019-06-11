import Text.Parsec
let parenSet = char '(' >> many parenSet >> char ')' :: Parsec String () Char
let parens = (many parenSet >> eof) <|> eof
parse parens "" "()"
parse parens "" "()(())"
parse parens "" "("
