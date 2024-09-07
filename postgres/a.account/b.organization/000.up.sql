-- Define ENUM for type of organization
CREATE TYPE organization_mode AS ENUM ('self', 'mult');

-- Create account.organization table
CREATE TABLE IF NOT EXISTS account.organization (
    cac UUID PRIMARY KEY,
    orgname VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    mode organization_mode NOT NULL DEFAULT 'mult',  -- 'self' for to own all members, 'mult' for members to belong to other orgs
    is_root BOOLEAN NOT NULL DEFAULT FALSE,  -- Indicates if the organization is a root organization (can have other organizations chained to it)
    chained_to UUID REFERENCES account.organization (cac),  -- References another organization if chained
    email_domain_restricted BOOLEAN NOT NULL DEFAULT FALSE,  -- If true, all members must have emails from the same domain
    creator UUID NOT NULL REFERENCES account.user (cac),  -- References the user who created the organization
    description TEXT NOT NULL,  -- Organization description
    is_active BOOLEAN NOT NULL DEFAULT TRUE,  -- Indicates if the organization is active
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),  -- Timestamp for when the organization was created
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),  -- Timestamp for when the organization was last updated

    -- Add a check constraint for chaining
    CONSTRAINT chk_chained_to_root CHECK (chained_to IS NULL OR is_root = FALSE)
);

-- Indexes for quick lookups
CREATE INDEX idx_org_chained_to ON account.organization (chained_to);