# 🛒 Sistema de Vendas

Um sistema completo de gerenciamento de vendas desenvolvido em **Delphi**, utilizando **Zeos Library** para conexão e persistência de dados e **Fortes Report** para geração de relatórios gerenciais.

---

## 📌 Objetivos do Projeto

- [x] **Tela Base (Modelo):** Padronização visual e de comportamento reaproveitada em todo o sistema.
- [x] **Autenticação:** Tela de Login para controle de acesso.
- [x] **Cadastros (CRUD):**
  - Usuários
  - Clientes
  - Produtos
- [x] **Automação de Banco de Dados:**
  - Criação automática de tabelas ao entrar no sistema.
  - Atualização/migração automática de tabelas ao inicializar.
- [x] **Módulo de Vendas:** Tela dedicada para registro e lançamento de vendas.
- [x] **Relatórios (Fortes Report):**
  - Relatório de Clientes
  - Relatório de Produtos
  - Relatório de Vendas por Período / Data
- [x] **Conexão com Banco:** Acesso a dados via **Zeos Library**.

---

## 🛠️ Tecnologias e Componentes

| Tecnologia / Componente | Função no Projeto |
| :--- | :--- |
| **Delphi** | Linguagem e ambiente de desenvolvimento |
| **Zeos Library (ZeosDBO)** | Componentes para conexão e manipulação do banco de dados |
| **Fortes Report Pro** | Gerador e emissor de relatórios |
| **Banco de Dados** | *Firebird* |

---

## 🚀 Funcionalidades Detalhadas

### 🔒 Tela de Login e Controle de Acesso
- Validação de usuários antes de permitir o acesso às demais rotinas do sistema.

### ⚙️ Auto-Migration (Banco de Dados)
- O sistema gerencia a estrutura do banco de dados de forma autônoma: ao ser executado, cria as tabelas necessárias ou aplica atualizações pendentes sem depender de scripts manuais.

### 📋 Padronização com Form Base
- Todas as telas do sistema herdam de um formulário modelo, garantindo consistência no layout e reaproveitamento de código.

### 📊 Relatórios Gerenciais
- Emissão visual de dados sobre clientes, catálogo de produtos e vendas filtradas por intervalo de datas.

---

## Status

🚧 Em andamento

## Autor

Rafael Alves

- GitHub: https://github.com/RafaelAlves-git
