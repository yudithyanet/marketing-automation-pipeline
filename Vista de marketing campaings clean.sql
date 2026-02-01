USE worldanalysis;

SELECT * 
FROM marketing_campaigns_raw
LIMIT 10;
vw_marketing_campaigns_clean
CREATE VIEW vw_marketing_campaigns_clean AS
SELECT
    fecha,
    canal,
    campaña,
    impresiones,
    clicks,
    conversiones,
    costo,
    ingresos
FROM marketing_campaigns_raw
WHERE impresiones >= 0
  AND clicks >= 0
  AND conversiones >= 0
  AND costo >= 0;
