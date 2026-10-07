# Supabase setup

1. In Supabase, enable Email sign-in.
2. Add the published site URL to Authentication → URL Configuration → Redirect URLs.
3. In SQL Editor, run the contents of schema.sql once. Row level security limits each account to its own progress row.

The site uses email/password accounts and syncs learning progress to Supabase. The browser publishable key is public by design; never put a service_role key in the site.
