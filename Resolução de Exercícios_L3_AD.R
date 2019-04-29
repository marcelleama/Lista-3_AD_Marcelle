#Lista 3: resolução de exercícios

#Exercício número 1:

#Link do meu projeto:
https://github.com/marcelleama/Lista-3_AD_Marcelle

#link da resolução da lista:
https://github.com/marcelleama/Lista-3_AD_Marcelle/blob/master/Resolu%C3%A7%C3%A3o%20de%20Exerc%C3%ADcios_L3_AD.R

#Exercício número 2:

#declare duas variáveis
x <- 
  
y <- 
  
# atribua valores maiores que 1

x <- 2

y <- 4

# atribua a soma das 2 variáveis a variável z
z <- sum(x,y)

#multiple o valor de z pelo número de seu CPF
z*527786764

#[1] 3166720584 # resposta final

# Exercício número 3:

head(mtcars)

# Uma descrição dos tipos de variáveis da base
str(mtcars)

# O número de dimensões da base
dim(mtcars)

# Imprima a terceira coluna
print.data.frame(mtcars, ncol(3))
mtcars[3,]

# Imprima a segunda linha
print.data.frame (mtcars, nrow (2))
mtcars[,2]

# O quarto elemento presente na variável "cyl"
mtcars$cyl[4]

#Um resumo descritivo da base que apresente as principais informações
# descritivas nas variáveis
summary(mtcars)

#Exercício número 4

# carregando o pacote
require(ffbase)

#definindo diretório
getwd()
setwd("C:/Users/celle/Documents/R/dados_encontro_1_ufpe/dados_encontro_1_ufpe")

#carregando a base de dados
turmas <- read.csv2.ffdf(file = "TURMAS.csv", sep = "|", first.rows=100000)

#filtre os registros referentes a PE
turmas_pe <- subset(turmas, CO_UF == 26)

#verificando estrutura da base
dim(turmas_pe)
names(turmas_pe)
table.ff(turmas_pe$CO_UF)

class(turmas_pe)

#transforme o objeto em um data.frame
turmas_pe <- as.data.frame(turmas_pe)

class (turmas_pe)

#salve a nova base de dados em RData
save(turmas_pe, file ="turmas_pe.RData")

getwd()
load("turmas_pe.RData")
head(turmas_pe)

#Exercício número 5

# carregue a base de dados TURMAS de PE
getwd()
load("turmas_pe.RData")

# apresente a média do número de matrículas por
# turma

names(turmas_pe)
mean(turmas_pe$NU_MATRICULAS)
# [1] 23.07089 # resposta final

#Exercício número 6

#confirmando o local do diretório
getwd()

# carregando a base de dados
docentes_ne <- read.csv2.ffdf(file = "DOCENTES_NORDESTE.csv", sep = "|", first.rows=100000)

#filtrando
docentes_pe <- subset(docentes_ne, CO_UF == "26")

# salvando nova base
save(docentes_pe, file = "docentes_pe.RData")

#transformando em data frame
docentes_pe <- as.data.frame(docentes_pe)
class (docentes_pe)
dim (docentes_pe)
#[1] 412663    132

#carregando pacotes
library(tidyverse)
getwd()

names(docentes_pe)

#consulta-se  Dicionários das Variáveis do Censo da Educação Básica 2016: TABELA DE DOCENTE 

#TP_COR_RACA	Cor/raça	
#Num	

#0 - Não declarada
#1 - Branca
#2 - Preta
#3 - Parda
#4 - Amarela
#5 - Indígena"

# o percentual de docentes de PE que não declarou cor ou raça no 
# no censo de 2016

#percentual = docentes_pe_selecao/docentes_pe

docentes_pe_selecao <- docentes_pe %>% filter(TP_COR_RACA == 0)

dim(docentes_pe_selecao)
#[1] 181573    132

# docentes_pe_selecao / docentes_pe
181573/412663

#[1] 0.4400031 
# aproximadamente 44% # resposta final

# o percentual de docentes de PE que se declararam pretos ou 
# pardos no censo de 2016

docentes_pe_pr <- docentes_pe %>% filter (TP_COR_RACA == 2)

dim (docentes_pe_pr)

#[1] 14710   132

docentes_pe_pd <- docentes_pe %>% filter (TP_COR_RACA == 3)
dim (docentes_pe_pd)

dim(docentes_pe_prpd)
#[1] 114718    132   

# nº docentes_pe_pr + nº docentes_pe_pd/ docentes_pe
#14710 + 114718

129428 / 412663

#[1] 0.3136409 

# aproximadamente 31% # resposta final

#OU

#conferindo os resultados
table(docentes_pe$TP_COR_RACA)

0      1      2      3      4      5 
181573  98141  14710 114718   1419   2102 

#OU

docentes_pe.freq = table(docentes_pe$TP_COR_RACA)

0      1      2      3      4      5 
181573  98141  14710 114718   1419   2102 

library(MASS)

COR_RACA = docentes_pe$TP_COR_RACA

COR_RACA.freq = table(COR_RACA)

COR_RACA.relfreq = COR_RACA.freq/ nrow(docentes_pe)

#COR_RACA.relfreq 'table' num [1:6(1d)] 0.44 0.23782 0.03565 0.27799 0.00344 0,0050 (...)

# para 0, ou seja, não declaram cor, reposta igual a 0.44 ou 44%
# para 2 ou 3, 0.03565 + 0.27799 

0.03565 + 0.27799 = 0.31364
# resposta final igual a 31%