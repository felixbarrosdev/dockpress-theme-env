# DockPress Theme Env

Entorno Docker genérico para desarrollar themes personalizados de WordPress con herramientas modernas como Composer, TailwindCSS y WP-CLI.

## 🚀 Requisitos

- Docker y Docker Compose
- Node.js (si vas a compilar fuera del contenedor)

## ⚙️ Setup

1. Copia el archivo `.env.example` a `.env` y ajusta tus variables.
2. Clona o monta tu theme en `wp/wp-content/themes`.
3. Levanta el entorno:

```bash
make up
```

4. Instala WordPress:

```bash
make install-wp
make activate-theme
```

5. Instala dependencias del theme:

```bash
make composer-install
make npm-install
```

6. Compila assets:

```bash
make npm-dev
```

## 📦 Comandos disponibles

- `make up / down / logs / bash`
- `make install-wp / activate-theme`
- `make composer-install / npm-install / npm-dev / npm-build`
