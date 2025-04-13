
# 🛠️ Projeto de Pipeline de Dados com BigQuery + dbt + Colab

Este projeto simula um pipeline de dados moderno utilizando **Google BigQuery**, **dbt** e **Python no Google Colab**. A estrutura é composta por cinco etapas principais — desde o upload dos dados até validações de segurança.

## 🔍 Objetivo

Criar um fluxo completo de ingestão, transformação e validação de dados para simular um ambiente analítico de Marketing Mix Modeling (MMM), garantindo qualidade, rastreabilidade e segurança no processo.

---

## 🗂️ Estrutura do Projeto

### `1_upload_base_bigquery.ipynb`
Notebook responsável por:
- Fazer upload dos arquivos de dados.
- Carregar os dados brutos no BigQuery em tabelas staging.

### `2_transformacoes_dbt.ipynb`
Executa o pipeline dbt com a seguinte lógica de camadas:
- `bronze`: remoção de duplicatas simples.
- `silver`: remoção de datas duplicadas priorizando menos nulos.
- `gold`: interpolação de vendas, substituição de nulos e renomeação de colunas.
- Testes implementados via dbt para checar integridade dos dados.

### `3_grafo_projeto_dbt.ipynb`
Cria e exibe o grafo do projeto dbt com dependências entre os modelos.
- Importa os arquivos gerados no drive.
- Funciona independentemente de onde o pipeline foi rodado.

### `4_validacao_bq_tabelas_gold.ipynb`
- Lê diretamente as tabelas `gold` do BigQuery.
- Realiza validações de integridade como:
  - `sales` e colunas de investimento > 0.
  - `holiday` contendo apenas valores binários.
  - Tipagem correta: `date` como `datetime`, `holiday` como `int`.
- Faz o join entre todas as tabelas gold.

### `5_validacao_seguranca_notebooks.ipynb`
Executa uma varredura nos arquivos `.ipynb` enviados para:
- Identificar possíveis tokens ou credenciais expostas.
- Verificar menções explícitas a `project_id`.
- Informar nome do arquivo e número da célula onde algo sensível foi detectado.

---

## ✅ Requisitos

- Conta Google com acesso ao BigQuery
- dbt CLI configurado (versão 1.9.4)
- Python 3.10+ com bibliotecas:
  - `pandas`
  - `google-cloud-bigquery`
  - `dbt-core`, `dbt-bigquery`
  - `re`, `json`, `colab.files`

---

## 🚧 Melhorias Futuras

- Adicionar camada de visualização automatizada (ex: Looker Studio).
- Implementar upload automatizado dos arquivos `.sql` para um repositório Git.
- Criar testes adicionais para valores extremos ou tendências anômalas.
