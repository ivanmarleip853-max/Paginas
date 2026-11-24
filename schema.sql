-- Cole tudo isto no Supabase: SQL Editor > New query > Run

create table produtos (
  id bigint generated always as identity primary key,
  nome text not null,
  tipo text not null check (tipo in ('Novo','Seminovo','Acessório')),
  cat text not null default '',
  marca text not null default '',
  spec text not null default '',
  descricao text not null default '',
  preco numeric(10,2) not null,
  fotos text[] not null default '{}',
  destaque boolean not null default false,
  oportunidade boolean not null default false,
  ativo boolean not null default true,
  ordem int not null default 0,
  criado_em timestamptz not null default now()
);

alter table produtos enable row level security;

-- Qualquer pessoa vê os produtos visíveis; só o dono logado vê e altera todos.
create policy "leitura publica" on produtos for select
  using (ativo = true or auth.role() = 'authenticated');
create policy "dono altera" on produtos for all to authenticated
  using (true) with check (true);

-- Pasta de fotos (pública para leitura, só o dono envia e apaga)
insert into storage.buckets (id, name, public) values ('produtos','produtos',true)
  on conflict (id) do nothing;
create policy "fotos publicas" on storage.objects for select
  using (bucket_id = 'produtos');
create policy "dono envia fotos" on storage.objects for insert to authenticated
  with check (bucket_id = 'produtos');
create policy "dono apaga fotos" on storage.objects for delete to authenticated
  using (bucket_id = 'produtos');
