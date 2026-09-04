-- Migration number: 0002

CREATE TABLE stats (
    id INTEGER PRIMARY KEY CHECK (id = 1),
    total_replays INTEGER NOT NULL DEFAULT 0,
    total_bytes INTEGER NOT NULL DEFAULT 0
);

INSERT INTO stats (id, total_replays, total_bytes)
SELECT 1, COUNT(*), COALESCE(SUM(size_bytes), 0)
FROM replays;
