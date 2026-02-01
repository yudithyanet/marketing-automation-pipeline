
CREATE TABLE fact_marketing_performance AS
SELECT
    fecha,
    canal,
    campaña,
    impresiones,
    clicks,
    conversiones,
    costo,
    ingresos,

    clicks / NULLIF(impresiones, 0) AS ctr,
    costo / NULLIF(clicks, 0) AS cpc,
    costo / NULLIF(conversiones, 0) AS cpa,
    (ingresos - costo) / NULLIF(costo, 0) AS roi
FROM marketing_campaigns_raw;

CREATE TABLE dim_canal AS
SELECT DISTINCT
    canal
FROM marketing_campaigns_raw;


CREATE TABLE dim_campaña AS
SELECT DISTINCT
    campaña,
    canal
FROM marketing_campaigns_raw;

CREATE TABLE dim_fecha1 AS
SELECT DISTINCT
    fecha,
    YEAR(fecha) AS anio,
    MONTH(fecha) AS mes
FROM marketing_campaigns_raw;
