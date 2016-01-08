#!/bin/bash 
echo "Seu nome de usuário é:"
whoami
echo "Info de hora atual e tempo que o computador está ligado:"
uptime
echo "O script está executando do diretório:"
pwd  
echo "Qual o nome do repositório?"
read nome;
echo "Selecionado: $nome"
echo "Qual o dominio?"
read dominio;
echo "Selecionado: $dominio"
echo "Iniciando"
case $dominio in
   "bitbucket") diretorio="https://pedradanamente@bitbucket.org/pedradanamente/${nome}.git";;
   "github") echo "github selecionado!" ; diretorio="https://github.com/pedradanamente/${nome}.git";;
   *) echo "Domínio não encontrado!" ; exit;;
esac 
cd ~/public_html/${dominio}/${nome}/
git init
git remote rm origin
git remote add origin ${diretorio}
echo "GIT REMOTO ORIGIN ADICIONADO"
echo "Diretório: ${diretorio}"
git add *
git commit -m "alteracoes pelo script automatico"
echo "ALTERAÇÕES FORAM CARREGADAS, CONFIRMA ? Tecle 1 p/ Sim"
read confirmacao;
if [ $confirmacao = "1" ]; then
	trickle -u 40 git push -u origin master
	echo "Enviado!"
else
	echo "Negado confirmação!"
fi  

