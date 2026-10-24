FROM python:3.12-slim

# Copia o binário do uv da imagem oficial (fixe uma versão em produção)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV PYTHONUNBUFFERED=1 \
    UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    PATH="/app/.venv/bin:$PATH"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia só os arquivos de dependência (aproveita o cache)
COPY pyproject.toml uv.lock ./

# Instala exatamente o que está no lockfile
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-install-project

ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} jupyter \
    && useradd -m -u ${UID} -g ${GID} jupyter \
    && chown -R jupyter:jupyter /app

USER jupyter

EXPOSE 8003

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8003", "--no-browser"]
