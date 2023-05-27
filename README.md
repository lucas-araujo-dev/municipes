# Municipes

Controle de cadastro de Municipes.

## Feito com
![Rails][Rails]![Twilio][Twilio]![Docker][Docker]![PostgreSQL][PostgreSQL]![Tailwind][Tailwind]![Elasticsearch][Elasticsearch]

## Descrição
Pequeno CRUD(sem destroy) de Municipes, com notificacao via email e SMS ao criar e atualizar

## Passos iniciais
```
copiar o .env_template para .env e adicionar as informações

OBS: para rodar os testes no docker, utilizar env.test

```


### Dependências

* Docker
* Twilio(Conta e Credenciais)
* Elasticsearch

### Instalação
```
docker-compose up --build
```

### Links
* [http://localhost:3000](http://localhost:3000) - Aplicação
* [http://localhost:1080](http://localhost:1080) - Mailcatcher


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Rails]: https://img.shields.io/badge/Rails-a40000?style=for-the-badge&logo=RubyonRails&logoColor=white
[Docker]: https://img.shields.io/badge/Docker-0092E6?style=for-the-badge&logo=Docker&logoColor=white
[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-2F6792?style=for-the-badge&logo=PostgreSQL&logoColor=white
[Tailwind]: https://img.shields.io/badge/Tailwind-38B2AC?style=for-the-badge&logo=TailwindCSS&logoColor=white
[Twilio]: https://img.shields.io/badge/Twilio-121C2D?style=for-the-badge&logo=Twilio&logoColor=white
[Elasticsearch]: https://img.shields.io/badge/Elasticsearch-005571?style=for-the-badge&logo=Elasticsearch&logoColor=white
