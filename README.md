# Rośliny

---

### Serwer bazy danych roślin miododajnych

Aby uruchomić serwer potrzebujesz

1. [`deno`]("https://deno.land/")

2. [`mysql`]("https://www.mysql.com")

---

## Uruchamianie lokalnie

Aby uruchmić server lokalnie wpisz:

```bash
deno run --allow-net=0.0.0.0:3000 --allow-env=MYSQL_ROOT_PASSWORD --allow-read=/ server.ts
```
