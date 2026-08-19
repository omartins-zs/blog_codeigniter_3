<div align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/php/php-original.svg" width="50" height="50" alt="PHP" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/codeigniter/codeigniter-plain-wordmark.svg" width="50" height="50" alt="CodeIgniter" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg" width="50" height="50" alt="MySQL" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="50" height="50" alt="Docker" />
</div>

<h1 align="center">Blog CodeIgniter 3 — Premium Edition</h1>

<div align="center">
  <cite>Um sistema de blog completo com painel administrativo, desenvolvido para demonstrar arquitetura MVC sólida, modo escuro nativo e infraestrutura pronta para Docker.</cite>
</div>

<br>

<h4 align="center"> ✅ Blog CodeIgniter 3 🚀 Concluído / Em evolução ⚙️ </h4>

---

## 🏗️ ARQUITETURA DO PROJETO

**Tipo:** Monólito (Backend + Frontend)

A aplicação utiliza o padrão MVC (Model-View-Controller) fornecido pelo framework CodeIgniter 3. O painel administrativo e a área pública do blog são entregues pelo mesmo núcleo monolítico de PHP, renderizando views alimentadas de forma dinâmica e estruturada.

---

## 🔥 PRÉ-REQUISITOS

Para rodar este projeto, você precisará ter instalado:

- **PHP 7.4+**
- **Composer 2.x+**
- **MySQL 8.0+**
- *(Opcional)* **Docker Desktop** para rodar via contêineres isolados.

---

## 🚀 TECNOLOGIAS UTILIZADAS

- **Linguagem:** PHP 7.4
- **Framework:** CodeIgniter 3.1.x
- **Banco de Dados:** MySQL 8.0
- **Frontend / UI:** Bootstrap 3, FontAwesome, SB Admin 2 (Painel Admin)
- **Pacotes / Libs:** `vlucas/phpdotenv` (Gerenciamento de Variáveis de Ambiente)
- **Infraestrutura:** Docker & Docker Compose (Nginx, PHP-FPM, MySQL, PHPMyAdmin)
- **Padrões:** MVC, Clean Code, Variáveis CSS nativas (Dark Mode)

---

## 🔨 FUNCIONALIDADES

- **Área Pública (Frontend):**
  - Listagem de publicações dinâmicas (com paginação otimizada).
  - Leitura de artigos completos e navegação por Categorias.
  - Alternador responsivo de Tema (Claro / Escuro) mantido via LocalStorage.
  - Barra lateral com categorias dinâmicas e sobre o autor.
- **Painel Administrativo (Backend - SB Admin 2):**
  - Autenticação de Usuários (Login/Sessão).
  - Gerenciamento completo (CRUD) de Usuários, Categorias e Postagens.
  - Tema escuro implementado globalmente sem quebrar o framework base.
- **Infraestrutura e DevOps:**
  - Carregamento estrito de variáveis seguras via `.env`.
  - Orquestração total do ambiente local por Docker Compose (com PHPMyAdmin embutido).

---

## 🎨 CONTROLE DA ESTILIZAÇÃO PREMIUM

A nova estilização moderna (Glassmorphism, Dark Mode, botões arredondados e sombras suaves) é controlada de forma modular. Para ativá-la ou desativá-la (retornando ao visual clássico), basta comentar ou descomentar a importação do `premium-theme.css` nos arquivos principais:

**No Frontend (Blog):**
Arquivo: `application/views/frontend/template/html-header.php`
```html
<link href="<?php echo base_url('assets/frontend/css/premium-theme.css') ?>" rel="stylesheet">
```

**No Backend (Painel Admin):**
Arquivo: `application/views/backend/template/html-header.php`
```html
<link href="<?php echo base_url('assets/frontend/css/premium-theme.css') ?>" rel="stylesheet">
```

---

## 🎯 SOBRE O PROJETO

Sistema desenvolvido demonstrando boas práticas de desenvolvimento, arquitetura limpa e organização de código, com foco em escalabilidade e manutenção. O projeto apresenta o balanço ideal entre o uso de um framework consolidado (CI3) e implementações de design e infraestrutura modernas (Glassmorphism, Docker, e Dotenv).

---

## 📸 PREVIEW DO PROJETO

🚧 Preview visual automatizado não disponível no diretório raiz do projeto.

> *Dica: Explore o projeto localmente para ver em tempo real as animações de layout premium e o toggle do Dark Mode!*

---

## 📊 DOCUMENTAÇÃO DO PROJETO

### 📁 Documentos e Manuais

O projeto possui guias exclusivos e estritos para infraestrutura e operações. Eles estão organizados na pasta `docs/`:

- `docs/COMO_EXECUTAR.md` — O guia mestre com URLs e sumário.
- `docs/COMO_EXECUTAR_LOCAL.md` — Manual para rodar nativo no Laragon/XAMPP.
- `docs/COMO_EXECUTAR_DOCKER.md` — Instruções para orquestração Docker.
- `docs/ACESSOS_TESTES.md` — Repositório de credenciais seguras para fins de QA e teste.

> 🚧 O projeto não possui documentação automatizada (Swagger/Postman) por se tratar de um Monólito clássico e não uma API headless.

---

## 💻 COMANDOS

Para executar o projeto de forma rápida e segura na sua máquina:

### Execução via Docker (Recomendado):

```bash
cp .env.example .env
# (Alterne os comentários dentro do arquivo .env para o bloco "# DOCKER")
docker compose up -d --build
docker compose exec app composer install
```
Acesse a aplicação via: `http://localhost:8080`

### Execução Local (Laragon/PHP Embutido):

```bash
cp .env.example .env
# (Alterne os comentários dentro do arquivo .env para o bloco "# LOCAL")
composer install
php -S 127.0.0.1:8000
```
*(Importe manualmente o arquivo `blog_codeigniter.sql` na sua porta 3307 ou correspondente).*

> ⚠️ Estes são comandos básicos. Verifique no projeto arquivos como:
> `docs/COMO_EXECUTAR.md` para instruções completas e dicas de acesso.

---

## 🧱 ESTRUTURA DO PROJETO

```text
📁 blog_codeigniter_3
├── 📁 application/       # Camada MVC (Controllers, Models, Views) e Configs
├── 📁 assets/            # CSS Premium, JS modular, FontAwesome e imagens
├── 📁 docker/            # Configurações do Nginx e Inis do PHP 
├── 📁 docs/              # Guias de execução local, docker e acessos
├── 📁 system/            # Core nativo do framework CodeIgniter 3
├── 📄 .env.example       # Modelo restrito de variáveis de ambiente
├── 📄 docker-compose.yml # Receita de orquestração local (App, DB, PMA)
├── 📄 Dockerfile         # Blueprint da imagem Apache/PHP com extensões e Composer
├── 📄 index.php          # Ponto central de entrada e boot do Dotenv
└── 📄 blog_codeigniter.sql # Dump do banco para inicialização
```

---

## 📝 MELHORIAS FUTURAS

- [ ] Migrar o sistema de Assets para um empacotador web moderno (Vite ou Webpack).
- [ ] Refatorar lógicas de Models utilizando camadas genéricas de Repository.
- [ ] Implementar Testes Unitários e E2E (Ex: Pest / Cypress).

---

## 🖋️ DICAS

Para forçar a recriação limpa do ambiente no Docker caso você mude portas do `.env`, utilize:
`docker compose down -v && docker compose up -d --build`

---

<div align="center">

Feito com ❤️ por Gabriel Martins 🚀

</div>
