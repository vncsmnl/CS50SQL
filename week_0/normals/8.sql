SELECT latitude, longitude, "0m" AS surface_temperature
FROM normals
ORDER BY "0m" ASC, latitude ASC
LIMIT 10;
