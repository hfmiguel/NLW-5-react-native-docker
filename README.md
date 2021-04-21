# node-js-docker
### Simples container para usar aplicações react em docker.

### Atalhos: 
#### Reiniciar container : ./restart.sh
#### Rebuildar o container : ./rebuild.sh
#### Acessar o container: ./container.sh
### Para iniciar o projeto , rode no terminal o arquivo ./firstRun.sh
#### Ele ira buildar o container , criar um projeto de nome "PlantManager" dentro da pasta Projetos
#### Caso queira alterar o nome do seu projeto , troque todas as ocorrencias de "PlantManager" no aquivo Dockerfile
#### Caso de algum erro , crie na raiz da pasta, uma pasta nome "Projetos" , inicia o server expo em modo web

## EXPO START - Iniciando o servidor.
#### Como é um container , você deverá alterar o IP do seu expo para poder acessar com seu celular , ou passar o parametro -w que inicia o expo em modo web ( ai basta acessar seu ip:19006 )
#### Para alterar o IP do seu expo server , execute o comando abaixo conectado ao container
##### export REACT_NATIVE_PACKAGER_HOSTNAME=SEU_IP
