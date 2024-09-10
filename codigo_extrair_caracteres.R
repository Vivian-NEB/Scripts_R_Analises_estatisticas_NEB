setwd("G:/ensinopesquisa/Vivian/DESAFIO_HEHE")

library(readxl)
library(magrittr)
library(dplyr)
library(stringr)


BD <- read_excel("BD_IC.xlsx")

BD <- BD %>%
  mutate(cpf2 = str_extract(cpf, "(?<=CPF )\\d{9,12}")) #extrai o número do CPF que está a frente da palavra "CPF"
        

BD <- BD %>%
  mutate(nome = str_remove(cpf, ".*CPF \\d{9,12}\\)\\s"))

# .*CPF: Corresponde a qualquer sequência de caracteres (.*) seguida pela palavra CPF.
# \\d{9,12}: Corresponde a um número de 9 a 12 dígitos (\\d representa um dígito e {9,12} especifica a quantidade mínima e máxima de dígitos).
# \\): Corresponde a um parêntese de fechamento.
# \\s: Corresponde a um espaço em branco.