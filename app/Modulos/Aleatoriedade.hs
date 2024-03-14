module Aleatoriedade where

import System.Random

-- Função para gerar uma lista de números aleatórios de um tamanho específico
gerarListaAleatoria :: Int -> IO [Int]
gerarListaAleatoria tamanho = do
  g <- newStdGen
  return $ take tamanho $ randomRs (1, tamanho * 10) g