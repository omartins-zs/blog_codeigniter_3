## 🎯 Padronização de Ambiente Local e Docker com Dotenv e Documentação

### 🔗 Link para a tarefa no ClickUp  
- [Task no ClickUp](#) *(Não se aplica)*

---

## 📖 Contexto  
O sistema possuía configurações mistas e hardcoded para a conexão de banco de dados e URLs base, o que dificultava o deploy rápido, o versionamento seguro e a alternância entre times rodando em modo Local (Laragon/XAMPP) ou via Docker. O objetivo desta mudança foi padronizar 100% o ambiente de execução e a documentação técnica (seguindo um padrão mestre) focado em centralizar as variáveis em um único ponto configurável (`.env`), eliminando o atrito no setup do projeto para novos desenvolvedores e garantindo persistência isolada no Docker.

---

## ❌ Problema  
- **Vulnerabilidade e Engessamento**: O `docker-compose.yml` possuía senhas expostas diretamente no arquivo e mapeamentos de portas genéricos.
- **Dificuldade no Setup Local**: No CodeIgniter 3 nativo, o ambiente local não suportava a leitura direta de variáveis de ambiente de um arquivo `.env` sem depender de fallbacks configurados no Apache ou variáveis hardcoded no PHP, quebrando a padronização.
- **Falta de Documentação Oficial**: Inexistência de um guia robusto que separasse as necessidades do time de infraestrutura (Docker) do time de front/back local (XAMPP/Laragon).

---

## 🛠 Solução  
- **Isolamento de Variáveis**: Centralizamos as credenciais e configurações (como `APP_URL`, `DB_HOST`, `DB_PORT`) no `.env`, através do padrão oficial com blocos distintos para `# LOCAL` e `# DOCKER`.
- **Injeção de Dependência Dotenv**: Instalamos o pacote `vlucas/phpdotenv` pelo Composer para dotar o CodeIgniter 3 da capacidade moderna de interpretar arquivos `.env` tanto localmente quanto no contêiner.
- **Mapeamento Exato de Portas Docker**: Refatoramos o Compose para que o `nginx` atue na porta 8080, o `mysql` libere o host na 3308, e o `phpmyadmin` opere na 8085, tudo atrelado estritamente à leitura do `env_file`.
- **Guias Especializados**: Criamos três arquivos estritos na pasta `docs/` ensinando passo a passo como subir o banco, configurar as credenciais e evitar quebras de cache.

---

## ✅ O que foi feito  
- Remoção completa do diretório legado `versaoWeb1.0/` (quase 600 arquivos redundantes) para limpeza do repositório.
- Atualizado o arquivo raiz `index.php` para acionar a leitura do Dotenv logo na inicialização global.
- Atualizado o `config.php` para carregar a `base_url` a partir do `APP_URL` do `.env`.
- Atualizado o `database.php` para resolver primariamente através do `$_ENV`.
- Atualizado o `docker-compose.yml` para consumir variáveis dinâmicas com fallbacks (`${DB_PASSWORD:-rootpassword}`).
- Adicionado `vlucas/phpdotenv` à camada `composer.json` (e o respectivo `.lock`).
- Atualizado `Dockerfile` para ter o executável do Composer embutido e possibilitar instalação autônoma no contêiner.
- Atualizado `.env.example` e adicionado `.env` ao escopo seguro do `.gitignore`.
- Construção estruturada dos documentos: `COMO_EXECUTAR.md`, `COMO_EXECUTAR_DOCKER.md` e `COMO_EXECUTAR_LOCAL.md`.

---

## 🎨 Controle da Estilização Premium e Dark Mode
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

## Tipo de mudança

- [ ] 🐛 Bug fix
- [x] ✨ Nova feature
- [x] ♻️ Refatoração
- [ ] ⚡ Performance
- [x] 🔧 Infraestrutura / configuração
- [x] 📝 Documentação

---

## Checklist

### Geral
- [ ] Testes unitários passando (`php vendor/bin/pest --configuration phpunit.ci.xml`) *(Não se aplica)*
- [ ] Adicionado algum codigo de debug (`dd`, `dump`, `var_dump`)
- [ ] CHANGELOG.md atualizado (se relevante) *(Não se aplica)*

---

## 🧪 Como testar  

### Opção 1 – Validação do fluxo principal (Docker)
- Apague as antigas instâncias caso existam (`docker compose down -v`).
- Configure o `.env` com as regras ativas do bloco DOCKER.
- Execute `docker compose up -d --build`.
- Verifique se a aplicação roda adequadamente via `http://localhost:8080` (confirmando o pareamento dinâmico da rede interna com o banco).

### Opção 2 – Validação de cenário Local (Laragon/XAMPP)
- Garanta que a sua porta local do DB está definida como `3307` e habilite o bloco `# LOCAL` no `.env`.
- Execute um `composer install`.
- Abra a URL local no host correspondente e verifique que o projeto responde perfeitamente sem hardcodes nos arquivos originais do CodeIgniter.

---

## 🚀 Resultado esperado  
Espera-se que a infraestrutura esteja cega e amarrada unicamente ao `.env`. A aplicação será 100% capaz de rodar sem conflitos entre diferentes desenvolvedores independentemente de seus ambientes baseados em contêiner ou hosts clássicos, mantendo os dados sigilosos ocultos no controle de versão.

---

## 🖼 Screenshots (se aplicável)  
*(Não se aplica)*

---

## 📝 Arquivos modificados  
- `.env.example`
- `.gitignore`
- `Dockerfile`
- `application/config/config.php`
- `application/config/database.php`
- `composer.json`
- `composer.lock`
- `docker-compose.yml`
- `index.php`
- `docs/COMO_EXECUTAR.md`
- `docs/COMO_EXECUTAR_DOCKER.md`
- `docs/COMO_EXECUTAR_LOCAL.md`

---

## 🔍 Observações Técnicas  
O CodeIgniter 3 (framework legado não-composer-first) exigiu que o `$dotenv->load()` fosse injetado diretamente no core `index.php` após validar o `vendor/autoload.php`. Devido a restrições nativas, utilizou-se `$_ENV` como preferência direta no `database.php`, porém o fallback de `getenv()` e valores-raiz hardcoded foram inteiramente preservados para prevenir falha crítica caso o mantenedor não baixe a pasta `vendor` em um deploy abrupto.
