-- Define ENUM type for roles
CREATE TYPE member_role AS ENUM ('creator', 'owner', 'director', 'manager', 'admin', 'staff');

-- Create account.member table with inline foreign key constraints
CREATE TABLE IF NOT EXISTS account.member (
    user_cac UUID NOT NULL REFERENCES account.user (cac),
    organization_cac UUID NOT NULL REFERENCES account.organization (cac),
    unit_id INTEGER NOT NULL DEFAULT 0 REFERENCES account.unit (id)
    role member_role NOT NULL,
    billet SERIAL NOT NULL REFERENCES account.billet (id),
    is_active BOOLEAN NOT NULL DEFAULT FALSE
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (user_cac, organization_cac)
);

-- Indexes for quick lookups
CREATE INDEX idx_member_user_organization ON account.member (user_cac, organization_cac);
CREATE INDEX idx_member_organization_user ON account.member (organization_cac, user_cac);

--* BREAK
CREATE TABLE IF NOT EXISTS account.billet (
    organization UUID NOT NULL UNIQUE,
    unit SERIAL NOT NULL UNIQUE,
    id SERIAL NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL UNIQUE,
    value VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    description TEXT,
)