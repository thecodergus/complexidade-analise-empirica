module Main where

import Pesquisa ( pesquisaSequencial, pesquisaBinaria, medirTempo )
import Arquivo ()
import Aleatoriedade ()

main :: IO ()
main = do
  -- Cabeçalho do arquivo CSV
  let cabecalho = V.fromList ["Tamanho", "Tempo Sequencial (s)", "Tempo Binário (s)"]

  -- Executar os testes e coletar os resultados
  resultados <- sequence $ map (\(lista, alvo) -> do
      listaValores <- lista
      let tamanho = length listaValores
      sequencial <- medirTempo (pesquisaSequencial listaValores) alvo
      binario <- medirTempo (pesquisaBinaria listaValores) alvo
      return $ V.fromList [toEnum tamanho, toEnum (snd sequencial), toEnum (snd binario)]
    ) casos

  -- Escrever o arquivo CSV usando o módulo CsvWriter
  let csvData = V.cons cabecalho (V.concat resultados)
  writeCsv "resultados.csv" csvData
