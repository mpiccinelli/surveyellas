WITH DensidadeLideres AS (
    SELECT
        ms.state,
        COUNT(se.survey_id) AS num_lideres,
        ST_Area(ms.geom, true) AS area_estado,
        COUNT(se.survey_id) / ST_Area(ms.geom, true) AS densidade_lideres,
        ST_Centroid(ms.geom) AS centroide_estado
    FROM "MESTRADO_MARLOS_STATES" ms
    LEFT JOIN "MESTRADO_MARLOS_SURVEY_ELLAS" se ON ms.state = se.state
    WHERE se.organizational_leader = 'Sim'
       OR se.unit_leader = 'Sim'
       OR se.group_leader = 'Sim'
    GROUP BY ms.state, ms.geom
),
DezMenoresDensidades AS (
    SELECT state, densidade_lideres
    FROM DensidadeLideres
    ORDER BY densidade_lideres
    LIMIT 10
),
CentroideMenoresDensidades AS (
    SELECT ST_Centroid(ST_Collect(centroide_estado)) AS centroide_menores_densidades
    FROM DezMenoresDensidades dmd
    JOIN DensidadeLideres dl ON dmd.state = dl.state
),
EstadoMaisProximo AS (
    SELECT ms.state
    FROM "MESTRADO_MARLOS_STATES" ms, CentroideMenoresDensidades cmd 
    WHERE ST_Contains(ms.geom, cmd.centroide_menores_densidades)
),
AeroportosNoEstado AS (
    SELECT
		ap."ID",
		ap.name,
		ap.city,
		ap.geom
    FROM "MESTRADO_MARLOS_AIRPORTS" ap, EstadoMaisProximo emp, "MESTRADO_MARLOS_STATES" ms
    WHERE ST_Contains(ms.geom, ap.geom) AND emp.state = ms.state
),
InstituicoesNoEstado AS (
    SELECT
		ies."NO_MUNICIPIO_IES",
	    ies."TP_ORGANIZACAO_ACADEMICA",
	    ies."TP_REDE",
	    ies."NO_IES",
		emp.state,
	    ies."DS_ENDERECO_IES",
	    ies."DS_NUMERO_ENDERECO_IES",
	    ies."NO_BAIRRO_IES",
		ies.geom
    FROM "MESTRADO_MARLOS_IES" ies, EstadoMaisProximo emp, "MESTRADO_MARLOS_STATES" ms
    WHERE ST_Contains(ms.geom, ies.geom) AND emp.state = ms.state
)
SELECT
    ine."NO_IES" AS NOME_DA_IES,
	ine.state AS ESTADO_DA_IES,
	ine."NO_MUNICIPIO_IES" AS CIDADE_IES,
	ine."TP_ORGANIZACAO_ACADEMICA" AS ORGANIZACAO_ACADEMICA,
	ine."TP_REDE" AS TIPO_ORGANIZACAO,
	ine."DS_ENDERECO_IES" AS ENDERECO_IES,
	ine."DS_NUMERO_ENDERECO_IES" AS NUMERO_IES,
	ine."NO_BAIRRO_IES" AS BAIRRO_IES,
	ine.geom AS GEOM_IES,
    ane.name AS NOME_AEROPORTO,
	ane.city AS CIDADE_AEROPORTO,
    ST_Distance(ine.geom, ane.geom) AS distancia_aeroporto,
	ane.geom AS GEOM_AEROPORTO
FROM InstituicoesNoEstado ine, AeroportosNoEstado ane
ORDER BY distancia_aeroporto
LIMIT 10;