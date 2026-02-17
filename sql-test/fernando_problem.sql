create database test2;
use test2;
-- Tabla de Usuarios
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_registro DATE,
    es_premium BOOLEAN
);

-- Tabla de Transacciones
CREATE TABLE transacciones (
    transaccion_id SERIAL PRIMARY KEY,
    usuario_id INT,
    monto DECIMAL(10, 2),
    fecha_pago TIMESTAMP,
    metodo_pago VARCHAR(20) -- 'tarjeta', 'paypal', 'crypto'
);

-- Datos de prueba
INSERT INTO usuarios (nombre, fecha_registro, es_premium) VALUES 
('Alice', '2023-01-01', true),
('Bob', '2023-01-05', false),
('Charlie', '2023-02-10', true),
('David', '2023-03-01', false);

INSERT INTO transacciones (usuario_id, monto, fecha_pago, metodo_pago) VALUES 
(1, 50.00, '2023-01-02 10:00:00', 'tarjeta'),
(1, 150.00, '2023-01-15 12:00:00', 'tarjeta'),
(2, 20.00, '2023-01-10 09:00:00', 'paypal'),
(3, 300.00, '2023-02-11 15:00:00', 'crypto'),
(3, 50.00, '2023-03-01 11:00:00', 'tarjeta'),
(4, 10.00, '2023-03-05 14:00:00', 'paypal');


-- For each PREMIUM user, please calculate their average ticket and the total amount spent. 
-- Additionally identify the payment method used in their first transaction?

-- nombre  |  sum   |             avg            |    total   
-- -----------+--------+----------------------+--------- 
-- Alice   | 200.00 | 100.0000000000000000 | tarjeta 
-- Charlie | 350.00 | 175.0000000000000000 | crypto 


SELECT 
  (SELECT nombre FROM usuarios u WHERE u.usuario_id=mq.uid) as nombre,
  mq.sum,
  mq.avg,
  (SELECT metodo_pago FROM transacciones t WHERE t.usuario_id=mq.uid ORDER BY fecha_pago ASC LIMIT 1) as total
FROM (
  SELECT
    u.usuario_id as uid,
    SUM(t.monto) as sum,
    AVG(t.monto) as avg
  FROM transacciones t
  INNER JOIN usuarios u ON t.usuario_id = u.usuario_id
  WHERE es_premium IS TRUE
  GROUP BY u.usuario_id
) mq;

WITH calculos AS (
    SELECT 
        usuario_id,
        monto,
        metodo_pago,
        -- Calculamos agregados y ranking en un solo paso
        SUM(monto) OVER(PARTITION BY usuario_id) as total_gastado,
        AVG(monto) OVER(PARTITION BY usuario_id) as ticket_promedio,
        ROW_NUMBER() OVER(PARTITION BY usuario_id ORDER BY fecha_pago ASC) as rank
    FROM transacciones
)
SELECT 
    u.nombre, 
    c.total_gastado, 
    c.ticket_promedio, 
    c.metodo_pago as primer_metodo
FROM usuarios u
JOIN calculos c ON u.usuario_id = c.usuario_id
WHERE u.es_premium = True AND c.rank = 1;