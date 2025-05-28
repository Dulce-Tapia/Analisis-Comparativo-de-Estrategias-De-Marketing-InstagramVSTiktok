--Análisis comparativo de estrategias de Marketing de Instagram vs TikTok
 
-- Seleccionar unicamente la plataforma de instagram y tiktok 
SELECT * FROM `redessociales-461215.MSM.viral_data` 
WHERE Platform IN ('Instagram','TikTok');

-- Engagement promedio por plataforma 
SELECT
  Platform, 
  COUNT(*) AS Post_ID,
  ROUND(AVG((Likes + Comments + Shares) / NULLIF(Views,0)),2) AS avg_engagement
FROM `redessociales-461215.MSM.clean_viral_data` 
GROUP BY Platform;

-- Engagement por categoría y plataforma
SELECT
  Platform,
  Hashtag,
  COUNT(*) AS Post_ID,
  ROUND(AVG((Likes + Comments + shares) / NULLIF(views, 0)), 2) AS avg_engagement
FROM `redessociales-461215.MSM.clean_viral_data` 
GROUP BY Platform, Hashtag
ORDER BY platform, avg_engagement DESC;

-- Evaluación temporal del volumen de publicaciones 
SELECT
  Platform,
  DATE_TRUNC(Post_Date,month) AS month,
  COUNT(*) AS Post_ID,
  ROUND(AVG((Likes + Comments + shares) / NULLIF(views, 0)), 2) AS avg_engagement
FROM `redessociales-461215.MSM.clean_viral_data` 
GROUP BY Platform, month
ORDER BY month;

-- Engagement maximo por publicación 
SELECT
  Platform,
  Hashtag,
  Views,
  Likes,
  Comments,
  Shares,
  ROUND((Likes + Comments + Shares) / NULLIF(Views, 0), 2) AS engagement_rate
FROM `redessociales-461215.MSM.clean_viral_data` 
ORDER BY engagement_rate DESC;