CREATE SCHEMA IF NOT EXISTS auth


--* Sign up
CREATE OR REPLACE FUNCTION sign_up(
    cac UUID,
    username TEXT,
    password TEXT,
    email TEXT,
    first_name TEXT,
    last_name TEXT
)
RETURNS VOID AS $$
BEGIN
    -- Check if the username already exists
    IF EXISTS (SELECT 1 FROM users WHERE username = username) THEN
        RAISE NOTICE 'Username % already exists.', username;
        RETURN;
    END IF;

    -- Check if the email already exists
    IF EXISTS (SELECT 1 FROM users WHERE email = email) THEN
        RAISE NOTICE 'Email % already exists.', email;
        RETURN;
    END IF;

    -- Validate that both first_name and last_name are at least 2 letters long
    IF LENGTH(first_name) < 2 THEN
        RAISE NOTICE 'First name must be at least 2 letters long.';
        RETURN;
    END IF;

    IF LENGTH(last_name) < 2 THEN
        RAISE NOTICE 'Last name must be at least 2 letters long.';
        RETURN;
    END IF;

    -- Insert a new user into the users table
    INSERT INTO users (cac, username, password_hash, email, first_name, last_name)
    VALUES (cac, username, crypt(password, gen_salt('bf')), email, first_name, last_name);
END;
$$ LANGUAGE plpgsql;


--* Sign in
CREATE OR REPLACE FUNCTION sign_in(username_or_email TEXT, password TEXT)
RETURNS UUID AS $$
DECLARE
    user_id INTEGER;
    session_id UUID;
BEGIN
    -- Check if user exists and password matches for either username or email
    SELECT id INTO user_id
    FROM users
    WHERE (username = username_or_email OR email = username_or_email)
      AND password_hash = crypt(password, password_hash);

    IF FOUND THEN
        -- Create a new session
        INSERT INTO sessions (user_id)
        VALUES (user_id)
        RETURNING session_id INTO session_id;

        RETURN session_id;
    ELSE
        RAISE NOTICE 'Invalid username, email, or password.';
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;

--* Sign out
CREATE OR REPLACE FUNCTION sign_out(session_id UUID)
RETURNS VOID AS $$
BEGIN
    -- Delete the session from the sessions table
    DELETE FROM sessions
    WHERE session_id = session_id;
END;
$$ LANGUAGE plpgsql;
