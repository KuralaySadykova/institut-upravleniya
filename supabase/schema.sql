create table if not exists public.learning_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  progress jsonb not null default '{"topics": {}, "courses": {}, "scores": {}}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.learning_progress enable row level security;
revoke all on table public.learning_progress from anon, public;
grant select, insert, update on table public.learning_progress to authenticated;

drop policy if exists "Users manage their own learning progress" on public.learning_progress;
create policy "Users manage their own learning progress"
on public.learning_progress
for all
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);
