proizvodPrvih :: Int -> Int
proizvodPrvih n
	| n < 1 = 0
	| n == 1 = 1
	| otherwise = n * proizvodPrvih (n-1)
