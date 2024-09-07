-- account.user definition
CREATE TABLE IF NOT EXISTS account.user (
    cac UUID PRIMARY KEY,
    aud VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) CHECK ( email ~* '^.+@.+\..+$' ),
    phone VARCHAR(255),
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    is_anonymous BOOLEAN NOT NULL,

    -- authentication info contains information related to user authentication.
    password TEXT,
    login_at TIMESTAMPTZ, -- last time login

    -- Contact info contains information related to user contact details.
    phone_confirmed_at TIMESTAMPTZ,
    email_confirmed_at TIMESTAMPTZ,
    invited_at TIMESTAMPTZ,
    confirmation_token TEXT NOT NULL,
    confirmation_sent_at TIMESTAMPTZ,
    confirmed_at TIMESTAMPTZ,
    recovery_token TEXT NOT NULL,
    recovery_sent_at TIMESTAMPTZ,

    -- email change info contains information related to user email change requests.
    email_change_token_current TEXT NOT NULL,
    email_change_token_new TEXT NOT NULL,
    email_change VARCHAR(255),
    email_change_sent_at TIMESTAMPTZ,
    email_change_confirm_status INT NOT NULL,

    -- phone change info contains information related to user phone change requests.
    phone_change_token TEXT NOT NULL,
    phone_change VARCHAR(255),
    phone_change_sent_at TIMESTAMPTZ,

    -- reauthentication info contains information related to user reauthentication requests.
    reauthentication_token TEXT NOT NULL,
    reauthentication_sent_at TIMESTAMPTZ,

    -- metadata and timestamps
    app_metadata JSONB,
    user_metadata JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    banned_until TIMESTAMPTZ,
    deleted_at TIMESTAMPTZ,
    instance_id UUID NOT NULL
);

-- indexes for quick lookups
CREATE INDEX idx_on_user_cac ON account.user(cac);
CREATE INDEX idx_on_user_username ON account.user(username);
CREATE INDEX idx_on_user_email ON account.user(email);
