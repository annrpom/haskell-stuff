module Main where

import Prelude hiding ( (++)
                      , reverse
                      , length
                      , elem
                      , map
                      , filter
                      , takeWhile
                      , dropWhile
                      , nub
                      )

{-- this is code from class --}
append :: [a] -> [a] -> [a]
append lst1 [] = lst1
append [] lst2 = lst2
append (x : xs) lst2 = x : (append xs lst2)

reverse :: [a] -> [a]
reverse lst
  = let reverse' [] acc = acc
        reverse' (x : xs) acc = reverse' xs (x : acc)
    in reverse' lst []

{-- length : ls -> int --}
-- returns the length of input ls
length :: [a] -> Integer
length [] = 0
length (x : xs) = 1 + length xs

-- using foldl
length' :: [a] -> Integer
length' ls = foldl (\acc x -> 1 + acc) 0 ls


{-- elem : a [a] -> boolean --}
-- returns whether or not the given a occurs in [a]
elem :: Eq a => a -> [a] -> Bool
elem a [] = False
elem a (x : xs) = if a == x then True else elem a xs

-- using foldl
elem' :: Eq a => a -> [a] -> Bool
elem' a ls = foldl (\acc x -> acc || x == a)  False ls


{-- map : fn [a] -> [b] --}
-- it's map.
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x : xs) = (f x) : map f xs

-- using foldr
map' :: (a -> b) -> [a] -> [b]
map' f ls = foldr (\x acc -> f x : acc) [] ls


{-- append' : ls1 ls2 -> ls3 --}
-- it's append.
append' :: [a] -> [a] -> [a]
append' ls1 ls2 = foldr (\x acc ->  x : acc) ls2 ls1

-- using foldl
append'' :: [a] -> [a] -> [a]
append'' ls1 ls2 = foldl (\acc x -> x : acc) ls2 (reverse ls1)


-- this is the example provided in the assignment
maxmin :: [Float] -> (Float, Float)
maxmin lst =
  let infinity = 1 / 0
      smaller n m = if n < m then n else m
      bigger n m = if n >= m then n else m
  in foldr
     (\n (mini, maxi) -> (smaller n mini, bigger n maxi))
     (infinity, 0)
     lst


{-- HERE IS THE SECOND PART OF ASS1 --}
{-- filter : pred ls -> ls --}
-- it's filter.
filter :: (a -> Bool) -> [a] -> [a]
filter pred [] = []
filter pred (x : xs) = if pred x then x : (filter pred xs) else (filter pred xs)

-- using foldr
filter' :: (a -> Bool) -> [a] -> [a]
filter' pred ls = foldr (\x acc -> if pred x then x : acc else acc) [] ls


{-- takeWhile : pred ls -> ls --}
-- returns the longest prefix of given list whose members satisfy the pred
takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile pred [] = []
takeWhile pred (x : xs) = if pred x then x : (takeWhile pred xs) else []

-- using foldr
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' pred ls = foldr (\x acc -> if pred x then x : acc else []) [] ls


{-- dropwhile : pred ls -> ls --}
-- returns the rest of a list where the frist element doesnt hold for the given predicate
dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile pred [] = []
dropWhile pred (x : xs) = if pred x then (dropWhile pred xs) else x : xs

-- using foldr
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' pred ls = foldr (\x acc -> if pred x then acc else ls) [] ls 


isIn :: Eq a => a -> [a] -> Bool
isIn a [] = False
isIn a (x : xs) = if x == a then True else (isIn a xs)


{-- diff : ls1 ls2 -> ls3 --}
-- set difference
diff :: Eq a  => [a] -> [a] -> [a]
diff ls1 [] = ls1 
diff [] ls2 = []
diff (x : xs) ls2 = if (isIn x ls2) then diff xs ls2 else x : diff xs ls2

-- using foldr
diff' :: Eq a => [a] -> [a] -> [a]
diff' ls1 ls2 = foldr (\x acc -> if (isIn x ls2) then acc else x : acc) [] ls1


{-- nub : ls -> ls --}
-- removes any dupes from input list
nub :: Eq a => [a] -> [a]
nub [] = []
nub (x : xs) = x : diff (nub xs) [x]

-- using foldr
nub' :: Eq a => [a] -> [a]
nub' ls = foldr (\x acc -> x : (diff acc [x])) [] ls


{-- HERE IS THE LAST PART OF ASS1 --}
{-- partition : ls a -> tup --}
-- given a input ls and a, partitions ls so that everything to left < piv and right > piv
partition :: [Integer] ->
             Integer ->
             ([Integer], Integer, [Integer])
partition ls x = ((filter (\n -> n < x) ls), x, (filter (\n -> n > x) ls)) 

{-- here is quickort --}
quicksort :: [Integer] -> [Integer]
quicksort [] = []
quicksort (x : xs) = let (ls, mid, gr) = partition xs x
                     in (append (append (quicksort ls) [mid]) (quicksort gr))



main :: IO ()
main = do
  putStrLn "hello world"
