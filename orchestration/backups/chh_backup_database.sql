--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: about_page; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE about_page (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    slug character varying(50) NOT NULL,
    content text NOT NULL,
    image character varying(100),
    height_field integer NOT NULL,
    width_field integer NOT NULL,
    create_date timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.about_page OWNER TO chh_db_user;

--
-- Name: about_ourboard_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE about_ourboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_ourboard_id_seq OWNER TO chh_db_user;

--
-- Name: about_ourboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE about_ourboard_id_seq OWNED BY about_page.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO chh_db_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO chh_db_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO chh_db_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO chh_db_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO chh_db_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO chh_db_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO chh_db_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO chh_db_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO chh_db_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO chh_db_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO chh_db_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO chh_db_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: contact_contact; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE contact_contact (
    id integer NOT NULL,
    full_name character varying(64) NOT NULL,
    email character varying(254) NOT NULL,
    message text NOT NULL,
    time_send timestamp with time zone NOT NULL,
    subject character varying(64) NOT NULL
);


ALTER TABLE public.contact_contact OWNER TO chh_db_user;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE contact_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_contact_id_seq OWNER TO chh_db_user;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE contact_contact_id_seq OWNED BY contact_contact.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO chh_db_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO chh_db_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO chh_db_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO chh_db_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO chh_db_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO chh_db_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO chh_db_user;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO chh_db_user;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO chh_db_user;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: post_post; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE post_post (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    slug character varying(50) NOT NULL,
    image character varying(100),
    height_field integer NOT NULL,
    width_field integer NOT NULL,
    content text NOT NULL,
    create_date timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.post_post OWNER TO chh_db_user;

--
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE post_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_post_id_seq OWNER TO chh_db_user;

--
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE post_post_id_seq OWNED BY post_post.id;


--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    user_id integer NOT NULL,
    activated boolean NOT NULL
);


ALTER TABLE public.registration_registrationprofile OWNER TO chh_db_user;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: chh_db_user
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_registrationprofile_id_seq OWNER TO chh_db_user;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chh_db_user
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY about_page ALTER COLUMN id SET DEFAULT nextval('about_ourboard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY contact_contact ALTER COLUMN id SET DEFAULT nextval('contact_contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY post_post ALTER COLUMN id SET DEFAULT nextval('post_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


--
-- Name: about_ourboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('about_ourboard_id_seq', 1, true);


--
-- Data for Name: about_page; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY about_page (id, title, slug, content, image, height_field, width_field, create_date, updated, user_id) FROM stdin;
1	What We Do	test	test		0	0	2016-11-02 20:41:31.997299+00	2016-11-02 20:38:04.740134+00	\N
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add page	8	add_page
23	Can change page	8	change_page
24	Can delete page	8	delete_page
25	Can add contact	9	add_contact
26	Can change contact	9	change_contact
27	Can delete contact	9	delete_contact
28	Can add post	10	add_post
29	Can change post	10	change_post
30	Can delete post	10	delete_post
31	Can add registration profile	11	add_registrationprofile
32	Can change registration profile	11	change_registrationprofile
33	Can delete registration profile	11	delete_registrationprofile
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('auth_permission_id_seq', 33, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$24000$FhQuCqe1mRJl$b8vpXkCtKXEQsV71NziSzeer2unTC7zOU3Q/6aA7li8=	2016-11-02 20:37:04.060231+00	t	dilshad				t	t	2016-11-02 20:36:43.547354+00
1	pbkdf2_sha256$24000$rTzzaYfTEw5q$gGWQGCC33gB5KJNBZzF+pklqkzkpoKB4P39IuA6/+mg=	2016-11-02 20:41:17.527986+00	t	nherriot			Nicholas.Herriot@gmail.com	t	t	2016-11-01 10:40:44.255017+00
3	pbkdf2_sha256$24000$CrxTGyO7yN4k$KE7y1/tNjlwzeNAGWA2rWxm581Uo8hXbS4uaVXOwwaM=	\N	f	aaron				f	t	2016-11-02 20:42:32.383125+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: contact_contact; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY contact_contact (id, full_name, email, message, time_send, subject) FROM stdin;
\.


--
-- Name: contact_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('contact_contact_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-11-02 20:38:04.744431+00	1	Test	1	Added.	8	2
2	2016-11-02 20:39:50.073308+00	1	nherriot	2	Changed password.	4	2
3	2016-11-02 20:42:32.596377+00	3	aaron	1	Added.	4	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 3, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	about	page
9	contact	contact
10	post	post
11	registration	registrationprofile
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('django_content_type_id_seq', 11, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-11-01 10:40:07.106127+00
2	auth	0001_initial	2016-11-01 10:40:07.348372+00
3	about	0001_initial	2016-11-01 10:40:07.374019+00
4	about	0002_auto_20161008_2240	2016-11-01 10:40:07.463419+00
5	about	0003_auto_20161008_2312	2016-11-01 10:40:07.538395+00
6	about	0004_ourboard_ourteam_volunteriing	2016-11-01 10:40:07.738159+00
7	about	0005_auto_20161012_2355	2016-11-01 10:40:07.807216+00
8	about	0006_auto_20161021_1616	2016-11-01 10:40:08.195374+00
9	admin	0001_initial	2016-11-01 10:40:08.233541+00
10	admin	0002_logentry_remove_auto_add	2016-11-01 10:40:08.270417+00
11	contenttypes	0002_remove_content_type_name	2016-11-01 10:40:08.402664+00
12	auth	0002_alter_permission_name_max_length	2016-11-01 10:40:08.495479+00
13	auth	0003_alter_user_email_max_length	2016-11-01 10:40:08.535405+00
14	auth	0004_alter_user_username_opts	2016-11-01 10:40:08.573769+00
15	auth	0005_alter_user_last_login_null	2016-11-01 10:40:08.631616+00
16	auth	0006_require_contenttypes_0002	2016-11-01 10:40:08.637137+00
17	auth	0007_alter_validators_add_error_messages	2016-11-01 10:40:08.676172+00
18	contact	0001_initial	2016-11-01 10:40:08.701583+00
19	contact	0002_contact_subject	2016-11-01 10:40:08.735937+00
20	post	0001_initial	2016-11-01 10:40:08.772762+00
21	post	0002_post_user	2016-11-01 10:40:08.826488+00
22	registration	0001_initial	2016-11-01 10:40:08.908464+00
23	registration	0002_registrationprofile_activated	2016-11-01 10:40:08.979274+00
24	registration	0003_migrate_activatedstatus	2016-11-01 10:40:08.992365+00
25	sessions	0001_initial	2016-11-01 10:40:09.023707+00
26	sites	0001_initial	2016-11-01 10:40:09.054988+00
27	sites	0002_alter_domain_unique	2016-11-01 10:40:09.082771+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('django_migrations_id_seq', 27, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
jpbhuq0mxuxt08hefp47oa5y5ybnuptv	MjVhNGNiZWY5ZTJkYzVlOTZhOWYxZThjNjEwMzU0NTQyODU4OTlkOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4MjM1ZjE5YWRkMTQ1MDhmNWE5ZWRlYTVmZDg5MzJkOWRiNjk5M2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-11-16 20:37:04.066003+00
s3tlad6q3lvy0xgognl6fmrluczfhha4	MjJmZjVmNjg3MmMxNjE5MmEwZWEzNWQ2YzVlMmNkNGJhYzkwYzMyNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlZTAyYzY2MWFjMWNhMmQzMWRjZDg4MWQyZjdlZjkzNmQ3N2RlMWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-11-16 20:41:17.532377+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: post_post; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY post_post (id, title, slug, image, height_field, width_field, content, create_date, updated, user_id) FROM stdin;
\.


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('post_post_id_seq', 1, false);


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: chh_db_user
--

COPY registration_registrationprofile (id, activation_key, user_id, activated) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chh_db_user
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 1, false);


--
-- Name: about_ourboard_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY about_page
    ADD CONSTRAINT about_ourboard_pkey PRIMARY KEY (id);


--
-- Name: about_ourboard_slug_key; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY about_page
    ADD CONSTRAINT about_ourboard_slug_key UNIQUE (slug);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: contact_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY contact_contact
    ADD CONSTRAINT contact_contact_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: post_post_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY post_post
    ADD CONSTRAINT post_post_pkey PRIMARY KEY (id);


--
-- Name: post_post_slug_key; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY post_post
    ADD CONSTRAINT post_post_slug_key UNIQUE (slug);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: chh_db_user; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: about_ourboard_e8701ad4; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX about_ourboard_e8701ad4 ON about_page USING btree (user_id);


--
-- Name: about_ourboard_slug_2661b0cf_like; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX about_ourboard_slug_2661b0cf_like ON about_page USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: post_post_e8701ad4; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX post_post_e8701ad4 ON post_post USING btree (user_id);


--
-- Name: post_post_slug_56a89051_like; Type: INDEX; Schema: public; Owner: chh_db_user; Tablespace: 
--

CREATE INDEX post_post_slug_56a89051_like ON post_post USING btree (slug varchar_pattern_ops);


--
-- Name: about_ourboard_user_id_fe2ccb78_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY about_page
    ADD CONSTRAINT about_ourboard_user_id_fe2ccb78_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_post_user_id_b9c97aef_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY post_post
    ADD CONSTRAINT post_post_user_id_b9c97aef_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: chh_db_user
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

