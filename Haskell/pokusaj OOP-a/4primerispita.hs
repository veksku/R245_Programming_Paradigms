module Lib where

data Transakcija = MkTransakcija { ident :: Int, iznos :: Int, posiljalac :: String, primalac :: String} deriving (Show, Eq)
												
{- 

ako nema deriving Show onda npr
instance Show Transakcija where
	show (MkTransakcija ident iznos posiljalac primalac) =
	"[" ++ show ident ++ " " ++ show iznos ++ " " ++ show posiljalac ++ " " ++ show primalac ++ "]"

ako nema deriving Eq onda npr
instance Eq Transakcija where
	(==) (MkTransakcija ident1 iznos1 posiljalac1 primalac1) (MkTransakcija ident1 iznos1 posiljalac1 primalac1) = 
	ident1 == ident2 
	(ovde je sasvim ok jer iden je kao jedinstveni ID, za dodatke koristiti && i ||)
	
-}		


	 
type AktivneTransakcije = [Transakcija]

izlistaj :: AktivneTransakcije -> String -> [Transakcija]
izlistaj [] _ = []
izlistaj (x:xs) br = if (posiljalac x) == br || (primalac x) == br then x : izlistaj xs br else izlistaj xs br

dodaj :: AktivneTransakcije -> Transakcija -> AktivneTransakcije
dodaj ts t = t : ts

ukloni :: AktivneTransakcije -> Int -> AktivneTransakcije
ukloni [] _ = []
ukloni (x:xs) id = if (ident x) == id then xs else x : ukloni xs id

ukupno :: AktivneTransakcije -> Int
ukupno [] = 0
ukupno (x:xs) = (iznos x) + ukupno xs


--izlistaj [MkTransakcija 5 6 "baba" "deda", MkTransakcija 2 738 "jovan" "milan"] "deda"
--dodaj [MkTransakcija 5 6 "baba" "deda", MkTransakcija 2 738 "jovan" "milan"] (MkTransakcija 1 27 "kuku" "lele")
--ukloni [MkTransakcija 5 6 "baba" "deda", MkTransakcija 2 738 "jovan" "milan"] 2
--ukloni [MkTransakcija 5 6 "baba" "deda", MkTransakcija 2 738 "jovan" "milan"] 5
--ukupno [MkTransakcija 5 300 "baba" "deda", MkTransakcija 2 500 "jovan" "milan"]
