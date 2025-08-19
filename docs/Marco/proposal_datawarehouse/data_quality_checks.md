# Data Quality Checks (DQ)

**Claves & Referencias**
- [ ] nk_incidente, nk_usuario, nk_categoria NO nulas
- [ ] FKs del hecho existen en dimensiones

**Dominios & Reglas**
- [ ] estado ∈ {pendiente, en_revision, atendido, descartado}
- [ ] latitud [-90, 90], longitud [-180, 180]

**Consistencia**
- [ ] num_comentarios = conteo real
- [ ] No duplicados en nk_incidente

**Completitud**
- [ ] % de nulos bajo umbral aceptable
