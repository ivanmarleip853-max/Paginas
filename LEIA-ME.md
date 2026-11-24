# Catálogo Lucas Phone

Site em 2 páginas, sem instalação de nada:
- `index.html` — catálogo que os clientes veem.
- `admin.html` — painel do Lucas (login), onde ele cadastra produtos e fotos.

Os produtos e as fotos ficam no **Supabase** (gratuito). O site fica na **Vercel** (gratuito).

## 1. Criar o banco (Supabase)
1. Crie uma conta em supabase.com e um projeto novo (anote a senha do banco; guarde em lugar seguro).
2. No menu **SQL Editor > New query**, cole todo o conteúdo de `schema.sql` e clique em **Run**.
3. Em **Authentication > Sign In / Providers**, **desligue** "Allow new users to sign up" (assim só o usuário que você criar consegue entrar).
4. Em **Authentication > Users > Add user**, crie o usuário do Lucas (e-mail e senha) e marque como confirmado.
5. Em **Project Settings > API**, copie a **Project URL** e a chave **Publishable key** (começa com `sb_publishable_`; se pedir, clique em "Create new API Keys").

## 2. Configurar
Abra `config.js` e cole a URL e a chave nos lugares indicados. Confira o número de WhatsApp.

## 3. Publicar (Vercel)
1. Suba esta pasta para um repositório no GitHub.
2. Em vercel.com, **Add New > Project**, escolha o repositório e clique em **Deploy** (não precisa de nenhuma configuração).
3. O catálogo fica no endereço que a Vercel der (coloque na bio do Instagram) e o painel em `/admin.html`.

## Como o Lucas usa
Entra em `seu-site.vercel.app/admin.html`, faz login e usa **+ Novo** para cadastrar nome, tipo, preço, categoria, marca, especificação, descrição e fotos (a primeira é a capa). Em cada produto há **Editar**, **Ocultar** (tira do catálogo sem apagar, bom para vendido) e **Excluir**. Marcar "Oportunidades" ou "Destaque" coloca o produto no carrossel do topo.

## Observações
- Projetos gratuitos do Supabase podem ser pausados após cerca de uma semana sem uso. Se acontecer, é só reativar no painel do Supabase.
- As fotos são reduzidas automaticamente (máx. 1200 px) para o catálogo carregar rápido.
