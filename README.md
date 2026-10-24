# classification-folha-sao-paulo

Projeto de estudos de aprendizado de máquina em Python, com foco em **classificação**. Contém a implementação de um classificador de notícias da Folha de São Paulo e exercícios dos capítulos 3 e 4 do livro *Mãos à Obra: Aprendizado de Máquina com Scikit-Learn, Keras & TensorFlow* (Aurélien Géron).

## Conteúdo

- **Classificação de notícias** (`notebooks/classification/`): projeto principal. O notebook `main.ipynb` transforma os textos das notícias em representações numéricas com *bag-of-words*/TF-IDF (implementados manualmente com NumPy e SciPy) e treina modelos para prever a categoria de cada artigo. O dataset `articles.csv` contém cerca de 175 mil notícias com título, texto, data, categoria e link.
- **Capítulo 3 — Classificação** (`notebooks/chapter-three-classification/`): exercícios de classificação com o dataset MNIST (dígitos manuscritos), incluindo métricas como precisão, revocação e matriz de confusão.
- **Capítulo 4** (`notebooks/chapter-four/`): regressão linear e gradiente descendente implementados do zero.

## Tecnologias

- Python >= 3.12, com gerenciamento de dependências via [uv](https://docs.astral.sh/uv/)
- JupyterLab
- NumPy, Pandas e SciPy
- scikit-learn
- Matplotlib e Seaborn

## Estrutura do projeto

```
.
├── notebooks/
│   ├── classification/            # Projeto principal: classificação de notícias
│   ├── chapter-three-classification/  # Exercícios MNIST (cap. 3)
│   ├── chapter-four/              # Regressão linear e gradiente descendente
│   ├── images/                    # Figuras geradas pelos notebooks
│   └── figuras/
├── data/                          # Espaço reservado para datasets
├── src/                           # Espaço reservado para código-fonte
├── pyproject.toml
├── uv.lock
├── Dockerfile
└── docker-compose.yml
```

## Como executar

### Opção 1 — com uv (recomendado)

```bash
uv sync
uv run jupyter lab
```

### Opção 2 — com Docker

```bash
docker compose up --build
```

O JupyterLab fica disponível em `http://localhost:8003`. O token de acesso definido no `docker-compose.yml` é `minhasenha123` (altere conforme necessário).

Os diretórios `notebooks/`, `data/` e `src/` são montados no container, então as alterações feitas pelos notebooks são persistidas no repositório.
