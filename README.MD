# Análise Espacial da Pesquisa ELLAS no Brasil para a Implantação de Centros de Desenvolvimento de Líderes em STEM

Este repositório contém os arquivos e códigos utilizados na análise espacial dos dados da pesquisa ELLAS no Brasil, com o objetivo de identificar a localização ideal para a implantação de um centro de desenvolvimento de líderes em STEM, considerando a proximidade com as participantes da pesquisa, a localização das instituições de ensino superior e a acessibilidade via aeroportos.

**Descrição do Projeto:**

O projeto ELLAS (Equality in Leadership for Latin American STEM) visa promover a igualdade de gênero em áreas de Ciência, Tecnologia, Engenharia e Matemática (STEM) na América Latina. Este estudo foca nos dados da pesquisa ELLAS no Brasil, buscando identificar o estado ideal para a implantação de um centro de desenvolvimento de líderes em STEM. A partir da análise espacial dos dados, buscamos contribuir para a formulação de estratégias e políticas que promovam a igualdade de gênero e a inclusão de mulheres em áreas de STEM no Brasil.

**Estrutura de Arquivos:**

```
├── SURVEY_ELLAS
│   ├── Data
│   │   └── results.csv
│   ├── Images
│   │   └── results_in_map.png
│   │   └── results_in_table.png
│   │   └── tablet_used_resum.png
│   └── Source
│   │   ├── get_lat_long_by_address.ipynb
│   │   ├── view_geo_data.qgs
│   ├── SQL
│   │   ├── query.sql
│   │   ├── table_airports.sql
│   │   ├── table_ies.sql
│   │   ├── table_states.sql
│   │   └── table_survey.sql
│   └── Dictionary_survey.xlsx
```

**Descrição dos Arquivos:**

- `/SURVEY_ELLAS/Data`: Contém os dados utilizados na análise.
  - `results.csv`: Resultados da consulta SQL que identifica as 10 IES mais próximas aos aeroportos no estado selecionado.
- `/SURVEY_ELLAS/Images`: Contém imagens geradas durante a análise.
  - `results_in_map.png`: Imagem do mapa gerado no QGIS, mostrando os resultados da análise espacial.
  - `results_in_table.png`: Imagem da tabela com os resultados da análise espacial.
  - `tablet_used_resum.png`: Imagem do resumo dos tabelas utilizadas na análise.
- `/SURVEY_ELLAS/Source`: Contém os códigos e scripts utilizados na análise.
  - `get_lat_long_by_address.ipynb`: Notebook Jupyter com o script Python para geocodificar os endereços das instituições de ensino superior, utilizando a API Nominatim do OpenStreetMap.
  - `view_geo_data.qgs`: Arquivo do QGIS com o mapa da análise espacial.
- `/SQL`: Contém os scripts SQL para criação das tabelas e execução das consultas.
  - `query.sql`: Script SQL com a consulta principal para a análise espacial, utilizando as funções do PostGIS.
  - `table_airports.sql`: Script SQL para criar a tabela `MESTRADO_MARLOS_AIRPORTS`.
  - `table_ies.sql`: Script SQL para criar a tabela `MESTRADO_MARLOS_IES`.
  - `table_states.sql`: Script SQL para criar a tabela `MESTRADO_MARLOS_STATES`.
  - `table_survey.sql`: Script SQL para criar a tabela `MESTRADO_MARLOS_SURVEY_ELLAS`.
- `Dictionary_survey.xlsx`: Dicionário de dados da pesquisa ELLAS e da tabela `MESTRADO_MARLOS_SURVEY_IES`.
- `README.md`: Arquivo com a descrição do projeto e da estrutura de arquivos.

**Etapas da Análise:**

1.  Geocodificação dos endereços das IES, utilizando o script Python no notebook `get_lat_long_by_address.ipynb` para obter as coordenadas geográficas (latitude e longitude) das instituições de ensino superior.
2.  União dos dados geocodificados com os dados das IES.
3.  Criação das tabelas no banco de dados PostgreSQL, utilizando os scripts SQL na pasta `/Source/SQL`.
4.  Execução da consulta SQL `query.sql` para a análise espacial.
5.  Visualização dos resultados no QGIS e geração do mapa `results_in_map.png`.

**Resultados:**

- O estado selecionado para a implantação do centro de desenvolvimento foi o **Pará**.
- As 10 instituições de ensino superior mais adequadas para sediar o centro foram identificadas e estão listadas no arquivo `results.csv`.
- O mapa `results_in_map.png` mostra a distribuição espacial dos participantes da pesquisa ELLAS, das IES e dos aeroportos, assim como a localização das IES selecionadas.

**Conclusões:**
Este trabalho explorou os dados da pesquisa realizada pelo projeto ELLAS, combinando-os com informações geográficas de instituições de ensino e aeroportos, para analisar a distribuição de líderes em STEM no Brasil e propor a localização ideal para um centro de desenvolvimento de líderes na área. Através da análise espacial e do geoprocessamento com o PostGIS, identificamos o estado do Pará como o local mais estratégico para a implantação do centro, devido à sua posição equidistante dos estados com menor densidade de líderes. Além disso, o estudo identificou as 10 instituições de ensino superior mais próximas a aeroportos no Pará, facilitando o acesso e minimizando custos de deslocamento para as participantes. A metodologia utilizada demonstra o potencial da análise espacial para a tomada de decisão em políticas públicas, especialmente na área de educação e igualdade de gênero. Acreditamos que este estudo contribui para o desenvolvimento de estratégias que promovam a inclusão e a participação de mulheres em áreas de STEM no Brasil.

**Contribuições:**

- Este trabalho contribui para a análise da distribuição espacial de líderes em STEM no Brasil e para a formulação de estratégias que promovam a igualdade de gênero na área.

**Autor:**

- Marlos Vinicius S. Piccinelli

**Referências:**

- Maciel, C., Guzman, I., Berardi, R., Caballero, B. B., Rodriguez, N., Frigo, L., Salgado, L., Jimenez, E., Bim, S. A. and Tapia, P. C. (2023) “Open Data Platform to Promote Gender Equality Policies in STEM”, In Proceedings of the Western Decision Sciences Institute (WDSI). April 2023. Portland Oregon, EUA.

- Berardi, R., Auceli, P., Maciel, C., Davila, G., Guzman, I., & Mendes, L. (2023). ELLAS: Uma plataforma de dados abertos com foco em lideranças femininas em STEM no contexto da América Latina. In Anais do XVII Women in Information Technology, (pp. 124-135). Porto Alegre: SBC. doi:10.5753/wit.2023.230764
