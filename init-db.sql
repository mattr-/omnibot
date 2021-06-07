CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "message" (
  id varchar(255) UNIQUE NOT NULL,
  author varchar(100) NOT NULL,
  body varchar(2000),
  channel varchar(100),
  guild varchar(100),
  reactions varchar(100) [],
  "created_at" timestamp with time zone NOT NULL,
  "updated_at" timestamp with time zone NOT NULL
);

CREATE TABLE "command" (
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
  name varchar(100),
  "created_at" timestamp with time zone NOT NULL,
  "updated_at" timestamp with time zone NOT NULL,
  "message_id" varchar(255)
);

CREATE TABLE "command_data" (
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
  key varchar(100),
  value varchar(2000),
  "created_at" timestamp with time zone NOT NULL,
  "updated_at" timestamp with time zone NOT NULL,
  "command_id" uuid
);

CREATE TABLE "warning" (
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
  member varchar(100) NOT NULL,
  message varchar(2000) NOT NULL,
  "created_at" timestamp with time zone NOT NULL,
  "updated_at" timestamp with time zone NOT NULL
);

CREATE TABLE "reminder" (
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
  author varchar(100) NOT NULL,
  index integer NOT NULL,
  message varchar(2000) NOT NULL,
  "reminder_date" timestamp with time zone NOT NULL,
  "created_at" timestamp with time zone NOT NULL,
  "updated_at" timestamp with time zone NOT NULL
);

ALTER TABLE ONLY "command_data"
  ADD CONSTRAINT "command_data_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY "command"
  ADD CONSTRAINT "command_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY "message"
  ADD CONSTRAINT "message_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY "warning"
  ADD CONSTRAINT "warning_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY "reminder"
  ADD CONSTRAINT "remindder_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY "command_data"
  ADD CONSTRAINT "command_data_command_id_fkey" FOREIGN KEY ("command_id") REFERENCES "command"(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "command"
  ADD CONSTRAINT "command_message_id_fkey" FOREIGN KEY ("message_id") REFERENCES "message"(id) ON UPDATE CASCADE ON DELETE SET NULL;
