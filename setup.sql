-- Death Committee: Supabase SQL Editor mein yeh poora paste kar ke "Run" dabayein
create table if not exists public.records (
  id text primary key,
  kind text not null,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz default now()
);
create index if not exists records_kind_idx on public.records(kind);

alter table public.records enable row level security;

-- Sirf login wale log data dekh / likh sakein
drop policy if exists "login users full access" on public.records;
create policy "login users full access" on public.records
  for all to authenticated using (true) with check (true);
