CREATE TABLE users (
  username VARCHAR(50) PRIMARY KEY,
  password TEXT NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  location INTEGER NOT NULL,
  hobbies TEXT NOT NULL,
  interests TEXT NOT NULL,
  img_url TEXT,
  email TEXT
    CHECK (position('@' IN email) > 1),
  is_admin BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE potential_matches (
  match_id SERIAL PRIMARY KEY,
  user_username_1 VARCHAR(50)
    REFERENCES users ON DELETE CASCADE,
  user_username_2 VARCHAR(50)
    REFERENCES users ON DELETE CASCADE,
 match_date DATE DEFAULT NULL
);

CREATE TABLE successful_matches (
  match_id SERIAL PRIMARY KEY,
  user_username_1 VARCHAR(50)
    REFERENCES users ON DELETE CASCADE,
  user_username_2 VARCHAR(50)
    REFERENCES users ON DELETE CASCADE,
  match_date DATE DEFAULT CURRENT_DATE NOT NULL
);

CREATE TABLE messages (
  message_id SERIAL PRIMARY KEY,
  receiver_username VARCHAR(50)
    REFERENCES users ON DELETE CASCADE,
  sender_username VARCHAR(50)
    REFERENCES users ON DELETE CASCADE,
  message_text TEXT NOT NULL,
  message_date DATE DEFAULT CURRENT_DATE NOT NULL

);
