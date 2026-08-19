# Como Executar — Blog CodeIgniter 3

Escolha **um** guia conforme seu ambiente:

| Guia | Quando usar | Requisitos no PC |
| --- | --- | --- |
| **[COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md)** | Executar em qualquer máquina com containers | Docker Desktop |
| **[COMO_EXECUTAR_LOCAL.md](COMO_EXECUTAR_LOCAL.md)** | Desenvolver com Laragon, XAMPP ou servidor embutido | PHP, Composer e MySQL |
| [ACESSOS_TESTES.md](ACESSOS_TESTES.md) | Logins, URLs e fluxos de teste | Somente se existir |

---

## Início rápido

### Local — Laragon ou XAMPP

Ative o bloco `LOCAL` no `.env` e execute:

```bash
cp .env.example .env
composer install
```
*(Importe o arquivo `blog_codeigniter.sql` no seu banco de dados local `blog_codeigniter`)*

Aplicação:

http://127.0.0.1:8000

### Docker

Ative o bloco `DOCKER` no `.env` e execute:

```bash
cp .env.example .env
docker compose up -d --build
```

Aplicação:

http://localhost:8080

---

## Logins demo

| Perfil | E-mail | Senha |
| --- | --- | --- |
| Administrador | admin@admin.com | 123456 |
| Autor | autor@autor.com | 123456 |
| Usuário | user@user.com | 123456 |

> *(Senhas contidas no arquivo `blog_codeigniter.sql` para testes)*

---

## URLs principais

| Área | Local | Docker |
| --- | --- | --- |
| Página inicial | http://127.0.0.1:8000 | http://localhost:8080 |
| Painel administrativo | http://127.0.0.1:8000/admin | http://localhost:8080/admin |
| PHPMyAdmin | — | http://localhost:8085 |

---

## Outros documentos

- [ACESSOS_TESTES.md](ACESSOS_TESTES.md) — Credenciais e fluxos de teste
