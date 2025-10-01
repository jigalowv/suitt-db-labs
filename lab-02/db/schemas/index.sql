CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE member (
    m_id UUID DEFAULT uuid_generate_v4(),
    m_login VARCHAR(255) NOT NULL,
    m_email VARCHAR(255) NOT NULL,
    m_phc CHAR(128) NOT NULL,
    m_registration_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_member PRIMARY KEY(m_id),
    CONSTRAINT uq_login UNIQUE(m_login),
    CONSTRAINT uq_email UNIQUE(m_email),
    CONSTRAINT uq_phc UNIQUE(m_phc),
    CONSTRAINT ck_email CHECK (m_email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    CONSTRAINT ck_login CHECK (char_length(m_login) >= 3),
    CONSTRAINT ck_registration_dt CHECK (m_registration_dt <= CURRENT_TIMESTAMP)
);

CREATE TABLE contact_type (
    ct_id SERIAL,
    ct_title VARCHAR(255) NOT NULL,

    CONSTRAINT pk_contact_type PRIMARY KEY(ct_id),
    CONSTRAINT uq_ct_title UNIQUE(ct_title)
);

CREATE TABLE contact (
    c_id BIGSERIAL,
    member_id UUID NOT NULL,
    contact_type_id INT NOT NULL,
    c_value VARCHAR(255) NOT NULL,

    CONSTRAINT pk_contact PRIMARY KEY(c_id),
    CONSTRAINT fk_contact_member 
        FOREIGN KEY(member_id) 
        REFERENCES member(m_id) ON DELETE CASCADE,
    CONSTRAINT fk_contact_contact_type
        FOREIGN KEY(contact_type_id)
        REFERENCES contact_type(ct_id) ON DELETE CASCADE
);

CREATE TABLE customer (
    member_id UUID NOT NULL,

    CONSTRAINT pk_customer PRIMARY KEY(member_id),
    CONSTRAINT fk_customer_member
        FOREIGN KEY(member_id)
        REFERENCES member(m_id) ON DELETE CASCADE
);

CREATE TABLE income_range (
    ir_id BIGSERIAL,
    ir_max DECIMAL(12,2) NOT NULL,
    ir_min DECIMAL(12,2) NOT NULL,

    CONSTRAINT pk_income_range PRIMARY KEY(ir_id),
    CONSTRAINT ck_ir_max_positive CHECK (ir_max > 0),
    CONSTRAINT ck_ir_min_positive CHECK (ir_min >= 0),
    CONSTRAINT ck_ir_max_greater_min CHECK (ir_max > ir_min)
);

CREATE TABLE performer (
    member_id UUID NOT NULL,
    expected_income_id BIGINT NOT NULL,
    p_experience INT NOT NULL,
    p_resume TEXT NOT NULL,
    p_promoted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_performer PRIMARY KEY(member_id),
    CONSTRAINT fk_performer_member
        FOREIGN KEY(member_id)
        REFERENCES member(m_id) ON DELETE CASCADE,
    CONSTRAINT fk_performer_income_range
        FOREIGN KEY(expected_income_id)
        REFERENCES income_range(ir_id) ON DELETE RESTRICT,
    CONSTRAINT ck_p_experience_positive CHECK (p_experience >= 0),
    CONSTRAINT ck_p_promoted_at CHECK (p_promoted_at <= CURRENT_TIMESTAMP)
);

CREATE TABLE customer_order (
    o_id BIGSERIAL,
    customer_id UUID NOT NULL,
    income_range_id BIGINT NOT NULL,
    o_title VARCHAR(255) NOT NULL,
    o_description TEXT NOT NULL,
    o_status order_status NOT NULL DEFAULT 'new',
    o_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    o_updated_at TIMESTAMP,
    o_deadline TIMESTAMP NOT NULL,
    o_promoted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_order PRIMARY KEY(o_id),
    CONSTRAINT fk_order_customer
        FOREIGN KEY(customer_id)
        REFERENCES customer(member_id) ON DELETE CASCADE,
    CONSTRAINT fk_order_income_range
        FOREIGN KEY(income_range_id)
        REFERENCES income_range(ir_id) ON DELETE RESTRICT,
    CONSTRAINT ck_o_title CHECK (char_length(o_title) >= 3),
    CONSTRAINT ck_o_created_at CHECK (o_created_at <= CURRENT_TIMESTAMP),
    CONSTRAINT ck_o_updated_at CHECK (o_updated_at <= CURRENT_TIMESTAMP),
    CONSTRAINT ck_o_deadline CHECK (o_deadline > o_created_at),
    CONSTRAINT ck_o_promoted_at CHECK (o_promoted_at <= CURRENT_TIMESTAMP)
);

CREATE TABLE skill (
    s_id SERIAL,
    s_title VARCHAR(255) NOT NULL,

    CONSTRAINT pk_skill PRIMARY KEY(s_id),
    CONSTRAINT uq_s_title UNIQUE(s_title)
);

CREATE TABLE performer_skill (
    ps_id BIGSERIAL,
    performer_id UUID NOT NULL,
    skill_id INT NOT NULL,

    CONSTRAINT pk_performer_skill PRIMARY KEY(ps_id),
    CONSTRAINT fk_performer_skill_performer
        FOREIGN KEY(performer_id)
        REFERENCES performer(member_id) ON DELETE CASCADE,
    CONSTRAINT fk_performer_skill_skill
        FOREIGN KEY(skill_id)
        REFERENCES skill(s_id) ON DELETE CASCADE,
    CONSTRAINT uq_performer_skill UNIQUE(performer_id, skill_id)
);

CREATE TABLE required_skill (
    rs_id BIGSERIAL,
    order_id BIGINT NOT NULL,
    skill_id INT NOT NULL,

    CONSTRAINT pk_required_skill PRIMARY KEY(rs_id),
    CONSTRAINT fk_required_skill_order
        FOREIGN KEY(order_id)
        REFERENCES customer_order(o_id) ON DELETE CASCADE,
    CONSTRAINT fk_required_skill_skill
        FOREIGN KEY(skill_id)
        REFERENCES skill(s_id) ON DELETE CASCADE,
    CONSTRAINT uq_required_skill UNIQUE(order_id, skill_id)
);

CREATE TABLE perform_request (
    pr_id BIGSERIAL,
    order_id BIGINT NOT NULL,
    performer_id UUID NOT NULL,
    pr_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    pr_status request_status NOT NULL DEFAULT 'pending',

    CONSTRAINT pk_perform_request PRIMARY KEY(pr_id),
    CONSTRAINT fk_perform_request_order
        FOREIGN KEY(order_id)
        REFERENCES customer_order(o_id) ON DELETE CASCADE,
    CONSTRAINT fk_perform_request_performer
        FOREIGN KEY(performer_id)
        REFERENCES performer(member_id) ON DELETE CASCADE,
    CONSTRAINT uq_perform_request UNIQUE(order_id, performer_id),
    CONSTRAINT ck_pr_created_at CHECK (pr_created_at <= CURRENT_TIMESTAMP)
);

CREATE TABLE comment (
    c_id BIGSERIAL,
    finished_order_id BIGINT NOT NULL,
    c_from UUID NOT NULL,
    c_to UUID NOT NULL,
    c_content TEXT NOT NULL,
    c_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    c_type comment_type NOT NULL,

    CONSTRAINT pk_comment PRIMARY KEY(c_id),
    CONSTRAINT fk_comment_finished_order
        FOREIGN KEY(finished_order_id)
        REFERENCES customer_order(o_id) ON DELETE CASCADE,
    CONSTRAINT fk_comment_from_member
        FOREIGN KEY(c_from)
        REFERENCES member(m_id) ON DELETE CASCADE,
    CONSTRAINT fk_comment_to_member
        FOREIGN KEY(c_to)
        REFERENCES member(m_id) ON DELETE CASCADE,
    CONSTRAINT ck_c_created_at CHECK (c_created_at <= CURRENT_TIMESTAMP)
);  