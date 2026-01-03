# Store - Sistema de Gerenciamento de Produtos

Uma aplicação Rails moderna para gerenciamento de produtos com sistema de notificações por email quando produtos voltam ao estoque.

## 📋 Índice

- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Funcionalidades Implementadas](#funcionalidades-implementadas)
- [Configuração e Instalação](#configuração-e-instalação)
- [Estrutura da Aplicação](#estrutura-da-aplicação)
- [Melhorias Futuras](#melhorias-futuras)

## 🛠 Tecnologias Utilizadas

### Framework e Linguagem

- **Ruby on Rails 8.1.1** - Framework web moderno
- **Ruby** - Linguagem de programação

### Banco de Dados

- **SQLite3** - Banco de dados relacional (desenvolvimento/teste)

### Autenticação e Segurança

- **bcrypt** - Hash de senhas seguro
- Sistema de sessões customizado com cookies assinados

### Frontend e Assets

- **Propshaft** - Pipeline de assets moderno
- **Importmap Rails** - Gerenciamento de JavaScript via ESM
- **Turbo Rails** - Aceleração de páginas estilo SPA
- **Stimulus Rails** - Framework JavaScript modesto

### Armazenamento e Conteúdo

- **Active Storage** - Upload e gerenciamento de arquivos
- **Action Text** - Editor de texto rico para descrições
- **image_processing** - Processamento de imagens

### Background Jobs e Cache

- **Solid Queue** - Sistema de filas para jobs em background
- **Solid Cache** - Cache baseado em banco de dados
- **Solid Cable** - Action Cable baseado em banco de dados

### Servidor e Deploy

- **Puma** - Servidor web de alta performance
- **Kamal** - Deploy containerizado
- **Thruster** - Aceleração HTTP para Puma

### Ferramentas de Desenvolvimento

- **Debug** - Debugger interativo
- **Bundler Audit** - Auditoria de segurança de gems
- **Brakeman** - Análise estática de segurança
- **Rubocop Rails Omakase** - Linter e formatação de código

### Testes

- **Capybara** - Testes de sistema
- **Selenium WebDriver** - Automação de navegador

## ✨ Funcionalidades Implementadas

### 1. Sistema de Autenticação

- Login e logout de usuários
- Gerenciamento de sessões com cookies seguros
- Proteção de rotas com autenticação
- Redirecionamento após login para URL original
- Rastreamento de IP e User Agent nas sessões

### 2. Gerenciamento de Produtos (CRUD)

- **Listagem** - Visualização de todos os produtos (público)
- **Visualização** - Detalhes do produto (público)
- **Criação** - Adicionar novos produtos (autenticado)
- **Edição** - Atualizar produtos existentes (autenticado)
- **Exclusão** - Remover produtos (autenticado)
- Validações de nome e quantidade de estoque

### 3. Sistema de Estoque

- Controle de inventário por produto
- Exibição de status "Em estoque" ou "Fora de estoque"
- Contador de itens disponíveis

### 4. Sistema de Notificações por Email

- **Inscrição** - Usuários podem se inscrever para receber notificações quando um produto voltar ao estoque
- **Notificação Automática** - Emails enviados automaticamente quando produto volta ao estoque (de 0 para >0)
- **Desinscrição** - Link seguro com token para cancelar inscrições
- Jobs em background para envio de emails assíncrono

### 5. Upload de Imagens

- Upload de imagem destacada para produtos via Active Storage
- Processamento e otimização de imagens

### 6. Descrições Ricas

- Editor de texto rico (Action Text) para descrições de produtos
- Suporte a formatação, links e outros elementos HTML

### 7. Progressive Web App (PWA)

- Manifest.json configurado
- Service Worker para funcionalidades offline

### 8. Recuperação de Senha

- Sistema de reset de senha via email
- Tokens seguros para redefinição

## 🚀 Configuração e Instalação

### Pré-requisitos

- Ruby 3.x
- Bundler
- Node.js (para assets JavaScript)

### Passos para Instalação

1. **Clone o repositório**

   ```bash
   git clone <url-do-repositorio>
   cd store_
   ```

2. **Instale as dependências**

   ```bash
   bundle install
   ```

3. **Configure o banco de dados**

   ```bash
   bin/rails db:create
   bin/rails db:migrate
   ```

4. **Inicie o servidor**

   ```bash
   bin/dev
   ```

   Ou use:

   ```bash
   bin/rails server
   ```

5. **Acesse a aplicação**
   - Abra `http://localhost:3000` no navegador

### Executar Testes

```bash
bin/rails test
```

### Ferramentas de Qualidade

```bash
# Análise de segurança
bin/brakeman
bin/bundler-audit

# Linter
bin/rubocop
```

## 📁 Estrutura da Aplicação

### Modelos Principais

- **User** - Usuários do sistema com autenticação
- **Product** - Produtos da loja
- **Subscriber** - Inscrições para notificações
- **Session** - Sessões de usuários

### Controllers

- `ProductsController` - CRUD de produtos
- `SessionsController` - Autenticação
- `PasswordsController` - Recuperação de senha
- `SubscribersController` - Inscrições de notificações
- `UnsubscribesController` - Cancelamento de inscrições

### Concerns

- `Authentication` - Lógica de autenticação reutilizável
- `Product::Notifications` - Sistema de notificações de produtos

### Mailers

- `ProductMailer` - Emails de notificação de estoque

## 🔮 Melhorias Futuras

### Funcionalidades

- [ ] **Sistema de Categorias** - Organizar produtos por categorias
- [ ] **Busca e Filtros** - Buscar produtos por nome, categoria, preço
- [ ] **Sistema de Preços** - Adicionar preços aos produtos e histórico de preços
- [ ] **Carrinho de Compras** - Adicionar produtos ao carrinho
- [ ] **Checkout e Pagamento** - Processar pedidos e pagamentos
- [ ] **Avaliações e Comentários** - Permitir que clientes avaliem produtos
- [ ] **Wishlist** - Lista de desejos para usuários
- [ ] **Histórico de Pedidos** - Visualizar pedidos anteriores
- [ ] **Dashboard Administrativo** - Painel com estatísticas e métricas
- [ ] **Relatórios** - Relatórios de vendas, produtos mais vendidos, etc.

### Técnicas

- [ ] **Migração para PostgreSQL** - Banco mais robusto para produção
- [ ] **API REST/GraphQL** - Endpoints para integração com mobile/frontend
- [ ] **Testes de Sistema** - Testes end-to-end com Capybara
- [ ] **Internacionalização (i18n)** - Suporte a múltiplos idiomas
- [ ] **Paginação** - Paginar listagens de produtos
- [ ] **Cache de Consultas** - Otimizar performance de queries frequentes
- [ ] **Upload para Cloud Storage** - S3, Cloudinary ou similar para imagens
- [ ] **CDN** - Distribuição de assets estáticos
- [ ] **Rate Limiting** - Proteção contra abuso de API
- [ ] **Logging e Monitoramento** - Integração com serviços como Sentry, LogRocket

### Segurança

- [ ] **Autenticação de Dois Fatores (2FA)** - Segurança adicional
- [ ] **CSRF Protection** - Verificação adicional de tokens
- [ ] **Sanitização de Inputs** - Proteção contra XSS
- [ ] **Validação de Email** - Verificar emails válidos na inscrição
- [ ] **Limite de Tentativas de Login** - Proteção contra brute force

### UX/UI

- [ ] **Design Responsivo Melhorado** - Otimização para mobile
- [ ] **Loading States** - Indicadores de carregamento
- [ ] **Notificações em Tempo Real** - WebSockets para atualizações
- [ ] **Modo Escuro** - Tema dark/light
- [ ] **Acessibilidade (a11y)** - Melhorar navegação por teclado e screen readers

### Performance

- [ ] **Otimização de Imagens** - Lazy loading, WebP, tamanhos responsivos
- [ ] **Compressão de Assets** - Minificação e compressão
- [ ] **Database Indexing** - Índices para queries frequentes
- [ ] **Background Job Monitoring** - Dashboard para monitorar filas
- [ ] **Caching Strategy** - Cache de páginas e fragmentos

### DevOps

- [ ] **CI/CD Pipeline** - Automação de testes e deploy
- [ ] **Docker Compose** - Ambiente de desenvolvimento containerizado
- [ ] **Health Checks** - Endpoints para monitoramento
- [ ] **Backup Automatizado** - Sistema de backup do banco de dados
- [ ] **Staging Environment** - Ambiente de homologação

## 📝 Notas

- A aplicação utiliza **Solid Queue** para processar jobs em background. Certifique-se de que o worker está rodando:

  ```bash
  bin/jobs
  ```

- Para desenvolvimento, o sistema de emails pode ser visualizado usando ferramentas como **Letter Opener** ou **MailCatcher**.

- Em produção, configure adequadamente as variáveis de ambiente para SMTP e outros serviços externos.

## 📄 Licença

Este projeto é privado e de uso interno.
