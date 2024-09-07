CREATE TABLE IF NOT EXISTS account.unit (
    organization_cac UUID NOT NULL REFERENCES account.organization (cac),
    id INTEGER,
    unitname VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,  -- Organization description
    parent_id INTEGER NOT NULL DEFAULT 0 REFERENCES account.unit (id),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,  -- Indicates if the organization is active
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (organization_cac, id)
);

-- Indexes for quick lookups
CREATE INDEX idx_on_unit ON account.unit (organization_cac, id);

-- BREAK
CREATE TABLE IF NOT EXISTS account.team (
    organization UUID NOT NULL,
    unit INTEGER NOT NULL,
    id SERIAL NOT NULL,
    name VARCHAR(255),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
)