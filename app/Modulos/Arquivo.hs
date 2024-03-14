module Arquivo where

import Data.Csv
import qualified Data.ByteString.Lazy as BL
import qualified Data.Vector as V

-- Função para escrever dados em um arquivo CSV
writeCsv :: FilePath -> V.Vector (V.Vector Field) -> IO ()
writeCsv filePath csvData = BL.writeFile filePath $ encode csvData