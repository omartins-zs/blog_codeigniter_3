# Como Executar Localmente — Blog CodeIgniter 3

Guia para rodar **sem Docker**, no **Laragon**, **XAMPP** ou com o servidor embutido do PHP (`php -S`).

> **Não quer instalar PHP, Composer ou MySQL?** Use [COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md) — basta Docker Desktop, em qualquer Windows, Mac ou Linux.

---

## Requisitos

Para rodar localmente, você **não precisa** de uma versão específica do Laragon.

O essencial é **Composer** + **PHP** compatível. Laragon, XAMPP ou `php -S` são apenas formas de subir o ambiente.

| Ferramenta | Obrigatório? | Versão mínima |
| --- | --- | --- |
| **Composer** | Sim | 2.x |
| **PHP** | Sim | 7.4+ |
| **MySQL** | Sim | 8.0+ |

Extensões PHP necessárias: `mysqli`, `pdo_mysql`, `mbstring`, `intl`.

### Ambiente de referência (máquina de desenvolvimento)

Stack usada na elaboração deste projeto — **não é requisito fixo**, só referência do que já foi testado:

| Ferramenta | Versão |
| --- | --- |
| **Laragon** | **6.0.0** |
| PHP (via Laragon) | 8.4.6 |
| Composer | 2.8.12 |
| CodeIgniter | 3.1.x |

Para conferir no seu computador:

```bash
php -v
composer --version
```

---

## 1) Preparar ambiente

### 1.1 Clonar ou acessar o projeto

```bash
cd c:/laragon/www/blog_codeigniter_3
```

### 1.2 Copiar variáveis de ambiente

```bash
cp .env.example .env
```

No PowerShell:

```powershell
Copy-Item .env.example .env
```

### 1.3 Ativar o ambiente local

Deixe o bloco `LOCAL` ativo e o bloco `DOCKER` comentado no `.env`.

Mostrar o bloco real do projeto seguindo este formato:

```env
# LOCAL
APP_URL=http://127.0.0.1:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=blog_codeigniter
DB_USERNAME=root
DB_PASSWORD=

# DOCKER
# APP_URL=http://localhost:8080
#
# DB_CONNECTION=mysql
# DB_HOST=mysql
# DB_PORT=3306
# DB_DATABASE=blog_codeigniter
# DB_USERNAME=blog_user
# DB_PASSWORD=blog_password
```

### 1.4 Criar o banco de dados

Crie o banco pelo HeidiSQL, PHPMyAdmin ou execute:

```sql
CREATE DATABASE blog_codeigniter
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

Em seguida, importe o arquivo de dump: `blog_codeigniter.sql`.

> No ambiente local, utilizar MySQL na porta **3307**, usuário `root` e senha vazia.

---

## 2) Instalar dependências

```bash
composer install
```

---

## 3) Rodar aplicação

Se não estiver rodando sob Apache no Laragon (onde a URL já seria `http://localhost/blog_codeigniter_3`), você pode iniciar via PHP built-in server:

```bash
php -S 127.0.0.1:8000
```

Aplicação:

http://127.0.0.1:8000

---

## 4) Acessos

| Recurso | URL |
| --- | --- |
| Página inicial | http://127.0.0.1:8000 |
| Login Administrativo | http://127.0.0.1:8000/login |
| Painel administrativo | http://127.0.0.1:8000/admin |

### Credenciais de teste

```txt
Painel de Administração
URL de login: http://127.0.0.1:8000/login
E-mail: admin@admin.com
Senha: 123456
```

---

## 5) Problemas comuns

### Banco não conecta

```env
DB_HOST=127.0.0.1
DB_PORT=3307
```

### Página em branco (Falta do vlucas/phpdotenv)
Certifique-se de ter rodado:
```bash
composer install
```

---

## Próximo passo

Para ambiente containerizado, consulte [COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md).
