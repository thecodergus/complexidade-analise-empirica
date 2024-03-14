module Pesquisa where

import System.CPUTime (getCPUTime)

pesquisaSequencial :: Eq a => [a] -> a -> Maybe Int
pesquisaSequencial [] _ = Nothing
pesquisaSequencial (x : xs) target
  | x == target = Just 0
  | otherwise = case pesquisaSequencial xs target of
    Nothing -> Nothing
    Just n -> Just (n + 1)

pesquisaBinaria :: Ord a => [a] -> a -> Maybe Int
pesquisaBinaria xs target = pesquisaBinariaHelper xs 0 (length xs - 1)
  where
    pesquisaBinariaHelper [] _ _ = Nothing
    pesquisaBinariaHelper (x : xs) low high
      | low > high = Nothing
      | x == target = Just low
      | x < target = pesquisaBinariaHelper xs (low + 1) high
      | otherwise = pesquisaBinariaHelper xs low (high - 1)

medirTempo :: (a -> b) -> a -> IO (b, Double)
medirTempo f x = do
  inicio <- getCPUTime
  let resultado = f x
  fim <- getCPUTime
  let tempo = fromIntegral (fim - inicio) / (10 ^ (12 :: Integer))
  return (resultado, tempo)
