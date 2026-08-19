# Como Executar com Docker — Blog CodeIgniter 3

Guia para executar o sistema utilizando Docker Desktop.

---

## Stack e containers

| Container | Função | Porta |
| --- | --- | --- |
| nginx | Servidor web | 8080 |
| app | CodeIgniter 3 com Apache/PHP 7.4 | Interna |
| mysql | Banco de dados | 3308 |
| phpmyadmin | Administração do banco | 8085 |

---

## 1) Preparar ambiente

```bash
cp .env.example .env
```

Deixe o bloco `DOCKER` ativo e o bloco `LOCAL` comentado:

```env
# LOCAL
# APP_URL=http://127.0.0.1:8000
#
# DB_CONNECTION=mysql
# DB_HOST=127.0.0.1
# DB_PORT=3307
# DB_DATABASE=blog_codeigniter
# DB_USERNAME=root
# DB_PASSWORD=

# DOCKER
APP_URL=http://localhost:8080

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=blog_codeigniter
DB_USERNAME=blog_user
DB_PASSWORD=blog_password
```

> Dentro do Docker, utilizar `DB_HOST=mysql` e `DB_PORT=3306`. A porta `3308` é somente para acesso pelo computador host.

---

## 2) Subir containers

```bash
docker compose up -d --build
docker compose ps
```

---

## 3) Inicialização do Banco
O arquivo `blog_codeigniter.sql` já será importado automaticamente na inicialização do MySQL pelo script presente em `/docker-entrypoint-initdb.d/`. Você também precisará rodar o composer dentro do container para instalar as dependências de biblioteca:

```bash
docker compose exec app composer install
```

---

## 4) Acessos

| Recurso | URL |
| --- | --- |
| Aplicação | http://localhost:8080 |
| Painel administrativo | http://localhost:8080/admin |
| PHPMyAdmin | http://localhost:8085 |

### Credenciais de teste

```txt
Painel de Administração
URL de login: http://localhost:8080/login
E-mail: admin@admin.com
Senha: 123456
```

### PHPMyAdmin

```txt
URL: http://localhost:8085
Servidor: mysql
Usuário: blog_user
Senha: blog_password
```

---

## 5) Logs e diagnóstico

```bash
docker compose logs -f
docker compose logs -f app
```

---

## 6) Parar ou reconstruir

```bash
docker compose down
docker compose up -d --build
```

Para apagar também os volumes:

```bash
docker compose down -v
```

> O comando `docker compose down -v` pode apagar os dados do banco.
