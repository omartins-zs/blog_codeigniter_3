# Acessos e Ambientes de Teste

Este documento lista os acessos configurados no banco de dados padrão (`blog_codeigniter.sql`) e as URLs de teste para o ambiente.

---

## 🌐 URLs do Sistema (Ambiente Docker)

| Área | URL |
|---|---|
| **Blog (Frontend Público)** | [http://localhost:8090/](http://localhost:8090/) |
| **Painel de Controle (Backend)** | [http://localhost:8090/admin](http://localhost:8090/admin) |
| **Tela de Login** | [http://localhost:8090/admin/login](http://localhost:8090/admin/login) |
| **Banco de Dados (PHPMyAdmin)** | [http://localhost:8086](http://localhost:8086) |

---

## 🔐 Credenciais de Acesso ao Painel Admin

O sistema utiliza a tabela `usuario` com senhas criptografadas em MD5. Abaixo estão os usuários configurados na carga inicial do banco:

| Nome | Usuário (Login) | Senha |
|---|---|---|
| Emerson Carvalho | `emerson` | `123` |
| Ana Clara | `anaclara` | `123` |
| Jose Francisco da Silva | `francisco2` | *(Hash md5 no banco, recomenda-se usar `emerson`)* |
| Gabriel Martins | `gabriel` | *(Hash md5 no banco, recomenda-se usar `emerson`)* |

> **Dica de Teste:** Recomendamos o uso do usuário `emerson` e senha `123` para validar todas as funcionalidades do painel.

---

## 🗄️ Acesso ao Banco de Dados

Caso precise realizar consultas direto no banco ou gerenciar tabelas via interface gráfica.

- **URL:** [http://localhost:8086](http://localhost:8086)
- **Servidor (Host):** `mysql`
- **Usuário:** `root`
- **Senha:** `rootpassword`
- **Database:** `blog_codeigniter`

---

## 🛠️ Como Resetar os Dados

Caso você modifique dados ou apague algo importante e queira restaurar o banco ao estado original, execute o seguinte comando no terminal na raiz do projeto:

```bash
docker exec -i blog_ci3_mysql mysql -u root -prootpassword blog_codeigniter < blog_codeigniter.sql
```

Isso recriará as tabelas e usuários conforme o arquivo padrão.
