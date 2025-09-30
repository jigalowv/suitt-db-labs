CREATE TYPE order_status AS ENUM (
    'new', 
    'in_progress', 
    'completed',
    'canceled');

CREATE TYPE request_status AS ENUM (
    'pending', 
    'viewed', 
    'accepted',
    'rejected');

CREATE TYPE comment_type AS ENUM (
    'positive', 
    'neutral', 
    'negative');