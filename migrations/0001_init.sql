-- Migration number: 0001 	 2026-09-03T15:55:16.205Z

CREATE TABLE uploaders (
    token TEXT PRIMARY KEY,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    successful_uploads INTEGER NOT NULL DEFAULT 0,
    duplicate_uploads INTEGER NOT NULL DEFAULT 0,
    invalid_uploads INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE replays (
    verified_hash TEXT PRIMARY KEY,
    storage_key TEXT NOT NULL,
    uploader_token TEXT NOT NULL REFERENCES uploaders(token),
    size_bytes INTEGER NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
