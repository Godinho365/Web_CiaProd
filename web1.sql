PGDMP  #                
    |            web1    15.2    16.4 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    160787    web1    DATABASE     {   CREATE DATABASE web1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE web1;
                postgres    false            �            1259    160814 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    160813    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    221                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    220            �            1259    160823    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    160822    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    223                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    222            �            1259    160807    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    160806    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    219            	           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    218            �            1259    160830 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    160839    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    160838    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    227            
           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    226            �            1259    160829    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    225                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    224            �            1259    160846    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    160845 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    229                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    228            �            1259    160905    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    160904    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    231                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    230            �            1259    160798    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    160797    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    217                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    216            �            1259    160789    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    160788    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    215                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    214            �            1259    161089    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    160935    doc_category    TABLE     �  CREATE TABLE public.doc_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    "order" integer NOT NULL,
    imagem character varying(100),
    section_id bigint NOT NULL,
    content text,
    author_id integer,
    created_at timestamp with time zone NOT NULL,
    view_count integer NOT NULL,
    CONSTRAINT doc_category_order_check CHECK (("order" >= 0))
);
     DROP TABLE public.doc_category;
       public         heap    postgres    false            �            1259    160934    doc_category_id_seq    SEQUENCE     |   CREATE SEQUENCE public.doc_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.doc_category_id_seq;
       public          postgres    false    233                       0    0    doc_category_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.doc_category_id_seq OWNED BY public.doc_category.id;
          public          postgres    false    232            �            1259    160974    doc_instruction    TABLE       CREATE TABLE public.doc_instruction (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    created_at timestamp with time zone NOT NULL,
    view_count integer NOT NULL,
    author_id integer,
    category_id bigint NOT NULL,
    section_id bigint NOT NULL,
    subcategory_id bigint NOT NULL,
    subfase character varying(100),
    "order" integer NOT NULL,
    topic_id bigint NOT NULL,
    subtopic_id bigint,
    CONSTRAINT doc_instruction_view_count_check CHECK ((view_count >= 0))
);
 #   DROP TABLE public.doc_instruction;
       public         heap    postgres    false            �            1259    160973    doc_instruction_id_seq    SEQUENCE        CREATE SEQUENCE public.doc_instruction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.doc_instruction_id_seq;
       public          postgres    false    241                       0    0    doc_instruction_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.doc_instruction_id_seq OWNED BY public.doc_instruction.id;
          public          postgres    false    240            �            1259    160984    doc_instruction_tags    TABLE     �   CREATE TABLE public.doc_instruction_tags (
    id integer NOT NULL,
    instruction_id bigint NOT NULL,
    tag_id bigint NOT NULL
);
 (   DROP TABLE public.doc_instruction_tags;
       public         heap    postgres    false            �            1259    160983    doc_instruction_tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.doc_instruction_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.doc_instruction_tags_id_seq;
       public          postgres    false    243                       0    0    doc_instruction_tags_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.doc_instruction_tags_id_seq OWNED BY public.doc_instruction_tags.id;
          public          postgres    false    242            �            1259    160945    doc_section    TABLE     �  CREATE TABLE public.doc_section (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    "order" integer NOT NULL,
    imagem character varying(100),
    author_id integer,
    created_at timestamp with time zone NOT NULL,
    view_count integer NOT NULL,
    CONSTRAINT doc_section_order_check CHECK (("order" >= 0)),
    CONSTRAINT doc_section_view_count_check CHECK ((view_count >= 0))
);
    DROP TABLE public.doc_section;
       public         heap    postgres    false            �            1259    160944    doc_section_id_seq    SEQUENCE     {   CREATE SEQUENCE public.doc_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.doc_section_id_seq;
       public          postgres    false    235                       0    0    doc_section_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.doc_section_id_seq OWNED BY public.doc_section.id;
          public          postgres    false    234            �            1259    160966    doc_subcategory    TABLE     �  CREATE TABLE public.doc_subcategory (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    "order" integer NOT NULL,
    imagem character varying(100),
    category_id bigint NOT NULL,
    section_id bigint NOT NULL,
    content text,
    author_id integer,
    created_at timestamp with time zone NOT NULL,
    view_count integer NOT NULL,
    CONSTRAINT doc_subcategory_order_check CHECK (("order" >= 0)),
    CONSTRAINT doc_subcategory_view_count_check CHECK ((view_count >= 0))
);
 #   DROP TABLE public.doc_subcategory;
       public         heap    postgres    false            �            1259    160965    doc_subcategory_id_seq    SEQUENCE        CREATE SEQUENCE public.doc_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.doc_subcategory_id_seq;
       public          postgres    false    239                       0    0    doc_subcategory_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.doc_subcategory_id_seq OWNED BY public.doc_subcategory.id;
          public          postgres    false    238            �            1259    161099    doc_subtopic    TABLE     �  CREATE TABLE public.doc_subtopic (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    content text,
    "order" integer NOT NULL,
    imagem character varying(100),
    topic_id bigint NOT NULL,
    author_id integer,
    created_at timestamp with time zone NOT NULL,
    view_count integer NOT NULL,
    CONSTRAINT doc_subtopic_order_check CHECK (("order" >= 0)),
    CONSTRAINT doc_subtopic_view_count_check CHECK ((view_count >= 0))
);
     DROP TABLE public.doc_subtopic;
       public         heap    postgres    false            �            1259    161098    doc_subtopic_id_seq    SEQUENCE     |   CREATE SEQUENCE public.doc_subtopic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.doc_subtopic_id_seq;
       public          postgres    false    248                       0    0    doc_subtopic_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.doc_subtopic_id_seq OWNED BY public.doc_subtopic.id;
          public          postgres    false    247            �            1259    160957    doc_tag    TABLE     a   CREATE TABLE public.doc_tag (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.doc_tag;
       public         heap    postgres    false            �            1259    160956    doc_tag_id_seq    SEQUENCE     w   CREATE SEQUENCE public.doc_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.doc_tag_id_seq;
       public          postgres    false    237                       0    0    doc_tag_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.doc_tag_id_seq OWNED BY public.doc_tag.id;
          public          postgres    false    236            �            1259    161055 	   doc_topic    TABLE       CREATE TABLE public.doc_topic (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    content text,
    "order" integer NOT NULL,
    imagem character varying(100),
    category_id bigint NOT NULL,
    section_id bigint NOT NULL,
    subcategory_id bigint NOT NULL,
    author_id integer,
    created_at timestamp with time zone NOT NULL,
    view_count integer NOT NULL,
    CONSTRAINT doc_topic_order_check CHECK (("order" >= 0)),
    CONSTRAINT doc_topic_view_count_check CHECK ((view_count >= 0))
);
    DROP TABLE public.doc_topic;
       public         heap    postgres    false            �            1259    161054    doc_topic_id_seq    SEQUENCE     y   CREATE SEQUENCE public.doc_topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.doc_topic_id_seq;
       public          postgres    false    245                       0    0    doc_topic_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.doc_topic_id_seq OWNED BY public.doc_topic.id;
          public          postgres    false    244            �           2604    160817    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    160826    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    160810    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    160833    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    160842    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    160849    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    160908    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    160801    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    160792    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    160938    doc_category id    DEFAULT     r   ALTER TABLE ONLY public.doc_category ALTER COLUMN id SET DEFAULT nextval('public.doc_category_id_seq'::regclass);
 >   ALTER TABLE public.doc_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    160977    doc_instruction id    DEFAULT     x   ALTER TABLE ONLY public.doc_instruction ALTER COLUMN id SET DEFAULT nextval('public.doc_instruction_id_seq'::regclass);
 A   ALTER TABLE public.doc_instruction ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    160987    doc_instruction_tags id    DEFAULT     �   ALTER TABLE ONLY public.doc_instruction_tags ALTER COLUMN id SET DEFAULT nextval('public.doc_instruction_tags_id_seq'::regclass);
 F   ALTER TABLE public.doc_instruction_tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    160948    doc_section id    DEFAULT     p   ALTER TABLE ONLY public.doc_section ALTER COLUMN id SET DEFAULT nextval('public.doc_section_id_seq'::regclass);
 =   ALTER TABLE public.doc_section ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    160969    doc_subcategory id    DEFAULT     x   ALTER TABLE ONLY public.doc_subcategory ALTER COLUMN id SET DEFAULT nextval('public.doc_subcategory_id_seq'::regclass);
 A   ALTER TABLE public.doc_subcategory ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    161102    doc_subtopic id    DEFAULT     r   ALTER TABLE ONLY public.doc_subtopic ALTER COLUMN id SET DEFAULT nextval('public.doc_subtopic_id_seq'::regclass);
 >   ALTER TABLE public.doc_subtopic ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            �           2604    160960 
   doc_tag id    DEFAULT     h   ALTER TABLE ONLY public.doc_tag ALTER COLUMN id SET DEFAULT nextval('public.doc_tag_id_seq'::regclass);
 9   ALTER TABLE public.doc_tag ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    161058    doc_topic id    DEFAULT     l   ALTER TABLE ONLY public.doc_topic ALTER COLUMN id SET DEFAULT nextval('public.doc_topic_id_seq'::regclass);
 ;   ALTER TABLE public.doc_topic ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244    245            �          0    160814 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    221   �      �          0    160823    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    223   �      �          0    160807    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    219   �      �          0    160830 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    225   �      �          0    160839    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    227   �      �          0    160846    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    229   �      �          0    160905    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    231   �      �          0    160798    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    217         �          0    160789    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    215   �      �          0    161089    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    246   J      �          0    160935    doc_category 
   TABLE DATA           y   COPY public.doc_category (id, name, "order", imagem, section_id, content, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    233         �          0    160974    doc_instruction 
   TABLE DATA           �   COPY public.doc_instruction (id, title, content, created_at, view_count, author_id, category_id, section_id, subcategory_id, subfase, "order", topic_id, subtopic_id) FROM stdin;
    public          postgres    false    241   �(      �          0    160984    doc_instruction_tags 
   TABLE DATA           J   COPY public.doc_instruction_tags (id, instruction_id, tag_id) FROM stdin;
    public          postgres    false    243   �=      �          0    160945    doc_section 
   TABLE DATA           m   COPY public.doc_section (id, title, content, "order", imagem, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    235   �=      �          0    160966    doc_subcategory 
   TABLE DATA           �   COPY public.doc_subcategory (id, name, "order", imagem, category_id, section_id, content, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    239   a>                 0    161099    doc_subtopic 
   TABLE DATA           w   COPY public.doc_subtopic (id, name, content, "order", imagem, topic_id, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    248   SU      �          0    160957    doc_tag 
   TABLE DATA           +   COPY public.doc_tag (id, name) FROM stdin;
    public          postgres    false    237   �      �          0    161055 	   doc_topic 
   TABLE DATA           �   COPY public.doc_topic (id, name, content, "order", imagem, category_id, section_id, subcategory_id, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    245   ��                 0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    220                       0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    222                       0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);
          public          postgres    false    218                       0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    226                       0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    224                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    228                       0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    230                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);
          public          postgres    false    216                        0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);
          public          postgres    false    214            !           0    0    doc_category_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.doc_category_id_seq', 2, true);
          public          postgres    false    232            "           0    0    doc_instruction_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.doc_instruction_id_seq', 15, true);
          public          postgres    false    240            #           0    0    doc_instruction_tags_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.doc_instruction_tags_id_seq', 1, false);
          public          postgres    false    242            $           0    0    doc_section_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.doc_section_id_seq', 1, true);
          public          postgres    false    234            %           0    0    doc_subcategory_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.doc_subcategory_id_seq', 6, true);
          public          postgres    false    238            &           0    0    doc_subtopic_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.doc_subtopic_id_seq', 9, true);
          public          postgres    false    247            '           0    0    doc_tag_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.doc_tag_id_seq', 1, false);
          public          postgres    false    236            (           0    0    doc_topic_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.doc_topic_id_seq', 10, true);
          public          postgres    false    244            �           2606    160932    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    221            �           2606    160862 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    223    223            �           2606    160828 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    223            �           2606    160819    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    221            �           2606    160853 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    219    219            �           2606    160812 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    219            �           2606    160844 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    227            �           2606    160877 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    227    227            �           2606    160835    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    225            �           2606    160851 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    229            �           2606    160891 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    229    229            �           2606    160927     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    225            �           2606    160913 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    231            �           2606    160805 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    217    217            �           2606    160803 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    217            �           2606    160796 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    215            -           2606    161095 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    246                       2606    160943 "   doc_category doc_category_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.doc_category
    ADD CONSTRAINT doc_category_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.doc_category DROP CONSTRAINT doc_category_name_key;
       public            postgres    false    233                       2606    160941    doc_category doc_category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.doc_category
    ADD CONSTRAINT doc_category_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.doc_category DROP CONSTRAINT doc_category_pkey;
       public            postgres    false    233                       2606    160982 $   doc_instruction doc_instruction_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_pkey;
       public            postgres    false    241            !           2606    161035 M   doc_instruction_tags doc_instruction_tags_instruction_id_tag_id_78eea241_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction_tags
    ADD CONSTRAINT doc_instruction_tags_instruction_id_tag_id_78eea241_uniq UNIQUE (instruction_id, tag_id);
 w   ALTER TABLE ONLY public.doc_instruction_tags DROP CONSTRAINT doc_instruction_tags_instruction_id_tag_id_78eea241_uniq;
       public            postgres    false    243    243            #           2606    160989 .   doc_instruction_tags doc_instruction_tags_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.doc_instruction_tags
    ADD CONSTRAINT doc_instruction_tags_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.doc_instruction_tags DROP CONSTRAINT doc_instruction_tags_pkey;
       public            postgres    false    243            	           2606    160953    doc_section doc_section_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.doc_section
    ADD CONSTRAINT doc_section_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.doc_section DROP CONSTRAINT doc_section_pkey;
       public            postgres    false    235                       2606    160955 !   doc_section doc_section_title_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.doc_section
    ADD CONSTRAINT doc_section_title_key UNIQUE (title);
 K   ALTER TABLE ONLY public.doc_section DROP CONSTRAINT doc_section_title_key;
       public            postgres    false    235                       2606    160972 $   doc_subcategory doc_subcategory_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.doc_subcategory
    ADD CONSTRAINT doc_subcategory_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.doc_subcategory DROP CONSTRAINT doc_subcategory_pkey;
       public            postgres    false    239            1           2606    161107    doc_subtopic doc_subtopic_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.doc_subtopic
    ADD CONSTRAINT doc_subtopic_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.doc_subtopic DROP CONSTRAINT doc_subtopic_pkey;
       public            postgres    false    248                       2606    160964    doc_tag doc_tag_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.doc_tag
    ADD CONSTRAINT doc_tag_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.doc_tag DROP CONSTRAINT doc_tag_name_key;
       public            postgres    false    237                       2606    160962    doc_tag doc_tag_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.doc_tag
    ADD CONSTRAINT doc_tag_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.doc_tag DROP CONSTRAINT doc_tag_pkey;
       public            postgres    false    237            (           2606    161063    doc_topic doc_topic_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_pkey;
       public            postgres    false    245            �           1259    160933    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    221            �           1259    160873 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    223            �           1259    160874 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    223            �           1259    160859 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    219            �           1259    160889 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    227            �           1259    160888 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    227            �           1259    160903 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    229            �           1259    160902 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    229            �           1259    160928     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    225            �           1259    160924 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    231            �           1259    160925 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    231            +           1259    161097 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    246            .           1259    161096 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    246                        1259    162577    doc_category_author_id_14915432    INDEX     ]   CREATE INDEX doc_category_author_id_14915432 ON public.doc_category USING btree (author_id);
 3   DROP INDEX public.doc_category_author_id_14915432;
       public            postgres    false    233                       1259    160995    doc_category_name_e57ef481_like    INDEX     l   CREATE INDEX doc_category_name_e57ef481_like ON public.doc_category USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.doc_category_name_e57ef481_like;
       public            postgres    false    233                       1259    161048     doc_category_section_id_e277dbaa    INDEX     _   CREATE INDEX doc_category_section_id_e277dbaa ON public.doc_category USING btree (section_id);
 4   DROP INDEX public.doc_category_section_id_e277dbaa;
       public            postgres    false    233                       1259    161030 "   doc_instruction_author_id_9d326ce1    INDEX     c   CREATE INDEX doc_instruction_author_id_9d326ce1 ON public.doc_instruction USING btree (author_id);
 6   DROP INDEX public.doc_instruction_author_id_9d326ce1;
       public            postgres    false    241                       1259    161031 $   doc_instruction_category_id_372bba45    INDEX     g   CREATE INDEX doc_instruction_category_id_372bba45 ON public.doc_instruction USING btree (category_id);
 8   DROP INDEX public.doc_instruction_category_id_372bba45;
       public            postgres    false    241                       1259    161032 #   doc_instruction_section_id_4d31ba3b    INDEX     e   CREATE INDEX doc_instruction_section_id_4d31ba3b ON public.doc_instruction USING btree (section_id);
 7   DROP INDEX public.doc_instruction_section_id_4d31ba3b;
       public            postgres    false    241                       1259    161033 '   doc_instruction_subcategory_id_3897c6bd    INDEX     m   CREATE INDEX doc_instruction_subcategory_id_3897c6bd ON public.doc_instruction USING btree (subcategory_id);
 ;   DROP INDEX public.doc_instruction_subcategory_id_3897c6bd;
       public            postgres    false    241                       1259    161119 $   doc_instruction_subtopic_id_0d36bbc0    INDEX     g   CREATE INDEX doc_instruction_subtopic_id_0d36bbc0 ON public.doc_instruction USING btree (subtopic_id);
 8   DROP INDEX public.doc_instruction_subtopic_id_0d36bbc0;
       public            postgres    false    241                       1259    161046 ,   doc_instruction_tags_instruction_id_7ffb48dc    INDEX     w   CREATE INDEX doc_instruction_tags_instruction_id_7ffb48dc ON public.doc_instruction_tags USING btree (instruction_id);
 @   DROP INDEX public.doc_instruction_tags_instruction_id_7ffb48dc;
       public            postgres    false    243            $           1259    161047 $   doc_instruction_tags_tag_id_e0683c9e    INDEX     g   CREATE INDEX doc_instruction_tags_tag_id_e0683c9e ON public.doc_instruction_tags USING btree (tag_id);
 8   DROP INDEX public.doc_instruction_tags_tag_id_e0683c9e;
       public            postgres    false    243                       1259    161088 !   doc_instruction_topic_id_52f83461    INDEX     a   CREATE INDEX doc_instruction_topic_id_52f83461 ON public.doc_instruction USING btree (topic_id);
 5   DROP INDEX public.doc_instruction_topic_id_52f83461;
       public            postgres    false    241                       1259    162568    doc_section_author_id_49e168bb    INDEX     [   CREATE INDEX doc_section_author_id_49e168bb ON public.doc_section USING btree (author_id);
 2   DROP INDEX public.doc_section_author_id_49e168bb;
       public            postgres    false    235            
           1259    160996    doc_section_title_0a0a84d7_like    INDEX     l   CREATE INDEX doc_section_title_0a0a84d7_like ON public.doc_section USING btree (title varchar_pattern_ops);
 3   DROP INDEX public.doc_section_title_0a0a84d7_like;
       public            postgres    false    235                       1259    162586 "   doc_subcategory_author_id_f3a72298    INDEX     c   CREATE INDEX doc_subcategory_author_id_f3a72298 ON public.doc_subcategory USING btree (author_id);
 6   DROP INDEX public.doc_subcategory_author_id_f3a72298;
       public            postgres    false    239                       1259    161008 $   doc_subcategory_category_id_4db416f9    INDEX     g   CREATE INDEX doc_subcategory_category_id_4db416f9 ON public.doc_subcategory USING btree (category_id);
 8   DROP INDEX public.doc_subcategory_category_id_4db416f9;
       public            postgres    false    239                       1259    161009 #   doc_subcategory_section_id_6a27e72c    INDEX     e   CREATE INDEX doc_subcategory_section_id_6a27e72c ON public.doc_subcategory USING btree (section_id);
 7   DROP INDEX public.doc_subcategory_section_id_6a27e72c;
       public            postgres    false    239            /           1259    162604    doc_subtopic_author_id_e9fe6f8c    INDEX     ]   CREATE INDEX doc_subtopic_author_id_e9fe6f8c ON public.doc_subtopic USING btree (author_id);
 3   DROP INDEX public.doc_subtopic_author_id_e9fe6f8c;
       public            postgres    false    248            2           1259    161113    doc_subtopic_topic_id_ab0394bc    INDEX     [   CREATE INDEX doc_subtopic_topic_id_ab0394bc ON public.doc_subtopic USING btree (topic_id);
 2   DROP INDEX public.doc_subtopic_topic_id_ab0394bc;
       public            postgres    false    248                       1259    160997    doc_tag_name_d4b3bfd4_like    INDEX     b   CREATE INDEX doc_tag_name_d4b3bfd4_like ON public.doc_tag USING btree (name varchar_pattern_ops);
 .   DROP INDEX public.doc_tag_name_d4b3bfd4_like;
       public            postgres    false    237            %           1259    162595    doc_topic_author_id_64cda73d    INDEX     W   CREATE INDEX doc_topic_author_id_64cda73d ON public.doc_topic USING btree (author_id);
 0   DROP INDEX public.doc_topic_author_id_64cda73d;
       public            postgres    false    245            &           1259    161085    doc_topic_category_id_b26febbd    INDEX     [   CREATE INDEX doc_topic_category_id_b26febbd ON public.doc_topic USING btree (category_id);
 2   DROP INDEX public.doc_topic_category_id_b26febbd;
       public            postgres    false    245            )           1259    161086    doc_topic_section_id_88060ef4    INDEX     Y   CREATE INDEX doc_topic_section_id_88060ef4 ON public.doc_topic USING btree (section_id);
 1   DROP INDEX public.doc_topic_section_id_88060ef4;
       public            postgres    false    245            *           1259    161087 !   doc_topic_subcategory_id_403e45a2    INDEX     a   CREATE INDEX doc_topic_subcategory_id_403e45a2 ON public.doc_topic USING btree (subcategory_id);
 5   DROP INDEX public.doc_topic_subcategory_id_403e45a2;
       public            postgres    false    245            4           2606    160868 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    223    219    3295            5           2606    160863 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    223    3300    221            3           2606    160854 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    217    3290    219            6           2606    160883 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    3300    221    227            7           2606    160878 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3308    227    225            8           2606    160897 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    229    219    3295            9           2606    160892 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    225    3308    229            :           2606    160914 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    217    3290    231            ;           2606    160919 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    225    3308    231            <           2606    162569 <   doc_category doc_category_author_id_14915432_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_category
    ADD CONSTRAINT doc_category_author_id_14915432_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.doc_category DROP CONSTRAINT doc_category_author_id_14915432_fk_auth_user_id;
       public          postgres    false    3308    233    225            =           2606    160990 ?   doc_category doc_category_section_id_e277dbaa_fk_doc_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_category
    ADD CONSTRAINT doc_category_section_id_e277dbaa_fk_doc_section_id FOREIGN KEY (section_id) REFERENCES public.doc_section(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.doc_category DROP CONSTRAINT doc_category_section_id_e277dbaa_fk_doc_section_id;
       public          postgres    false    233    235    3337            B           2606    161010 B   doc_instruction doc_instruction_author_id_9d326ce1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_author_id_9d326ce1_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_author_id_9d326ce1_fk_auth_user_id;
       public          postgres    false    241    3308    225            C           2606    161015 G   doc_instruction doc_instruction_category_id_372bba45_fk_doc_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_category_id_372bba45_fk_doc_category_id FOREIGN KEY (category_id) REFERENCES public.doc_category(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_category_id_372bba45_fk_doc_category_id;
       public          postgres    false    233    3333    241            D           2606    161020 E   doc_instruction doc_instruction_section_id_4d31ba3b_fk_doc_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_section_id_4d31ba3b_fk_doc_section_id FOREIGN KEY (section_id) REFERENCES public.doc_section(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_section_id_4d31ba3b_fk_doc_section_id;
       public          postgres    false    235    241    3337            E           2606    161025 M   doc_instruction doc_instruction_subcategory_id_3897c6bd_fk_doc_subcategory_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_subcategory_id_3897c6bd_fk_doc_subcategory_id FOREIGN KEY (subcategory_id) REFERENCES public.doc_subcategory(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_subcategory_id_3897c6bd_fk_doc_subcategory_id;
       public          postgres    false    3349    241    239            F           2606    161114 G   doc_instruction doc_instruction_subtopic_id_0d36bbc0_fk_doc_subtopic_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_subtopic_id_0d36bbc0_fk_doc_subtopic_id FOREIGN KEY (subtopic_id) REFERENCES public.doc_subtopic(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_subtopic_id_0d36bbc0_fk_doc_subtopic_id;
       public          postgres    false    3377    248    241            H           2606    161036 N   doc_instruction_tags doc_instruction_tags_instruction_id_7ffb48dc_fk_doc_instr    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction_tags
    ADD CONSTRAINT doc_instruction_tags_instruction_id_7ffb48dc_fk_doc_instr FOREIGN KEY (instruction_id) REFERENCES public.doc_instruction(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.doc_instruction_tags DROP CONSTRAINT doc_instruction_tags_instruction_id_7ffb48dc_fk_doc_instr;
       public          postgres    false    3354    241    243            I           2606    161041 G   doc_instruction_tags doc_instruction_tags_tag_id_e0683c9e_fk_doc_tag_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction_tags
    ADD CONSTRAINT doc_instruction_tags_tag_id_e0683c9e_fk_doc_tag_id FOREIGN KEY (tag_id) REFERENCES public.doc_tag(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.doc_instruction_tags DROP CONSTRAINT doc_instruction_tags_tag_id_e0683c9e_fk_doc_tag_id;
       public          postgres    false    243    3345    237            G           2606    161065 A   doc_instruction doc_instruction_topic_id_52f83461_fk_doc_topic_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_topic_id_52f83461_fk_doc_topic_id FOREIGN KEY (topic_id) REFERENCES public.doc_topic(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_topic_id_52f83461_fk_doc_topic_id;
       public          postgres    false    3368    245    241            >           2606    162560 :   doc_section doc_section_author_id_49e168bb_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_section
    ADD CONSTRAINT doc_section_author_id_49e168bb_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.doc_section DROP CONSTRAINT doc_section_author_id_49e168bb_fk_auth_user_id;
       public          postgres    false    235    225    3308            ?           2606    162578 B   doc_subcategory doc_subcategory_author_id_f3a72298_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subcategory
    ADD CONSTRAINT doc_subcategory_author_id_f3a72298_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.doc_subcategory DROP CONSTRAINT doc_subcategory_author_id_f3a72298_fk_auth_user_id;
       public          postgres    false    3308    225    239            @           2606    160998 G   doc_subcategory doc_subcategory_category_id_4db416f9_fk_doc_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subcategory
    ADD CONSTRAINT doc_subcategory_category_id_4db416f9_fk_doc_category_id FOREIGN KEY (category_id) REFERENCES public.doc_category(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.doc_subcategory DROP CONSTRAINT doc_subcategory_category_id_4db416f9_fk_doc_category_id;
       public          postgres    false    239    233    3333            A           2606    161003 E   doc_subcategory doc_subcategory_section_id_6a27e72c_fk_doc_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subcategory
    ADD CONSTRAINT doc_subcategory_section_id_6a27e72c_fk_doc_section_id FOREIGN KEY (section_id) REFERENCES public.doc_section(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.doc_subcategory DROP CONSTRAINT doc_subcategory_section_id_6a27e72c_fk_doc_section_id;
       public          postgres    false    235    3337    239            N           2606    162596 <   doc_subtopic doc_subtopic_author_id_e9fe6f8c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subtopic
    ADD CONSTRAINT doc_subtopic_author_id_e9fe6f8c_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.doc_subtopic DROP CONSTRAINT doc_subtopic_author_id_e9fe6f8c_fk_auth_user_id;
       public          postgres    false    3308    248    225            O           2606    161108 ;   doc_subtopic doc_subtopic_topic_id_ab0394bc_fk_doc_topic_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subtopic
    ADD CONSTRAINT doc_subtopic_topic_id_ab0394bc_fk_doc_topic_id FOREIGN KEY (topic_id) REFERENCES public.doc_topic(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.doc_subtopic DROP CONSTRAINT doc_subtopic_topic_id_ab0394bc_fk_doc_topic_id;
       public          postgres    false    248    3368    245            J           2606    162587 6   doc_topic doc_topic_author_id_64cda73d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_author_id_64cda73d_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_author_id_64cda73d_fk_auth_user_id;
       public          postgres    false    3308    245    225            K           2606    161070 ;   doc_topic doc_topic_category_id_b26febbd_fk_doc_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_category_id_b26febbd_fk_doc_category_id FOREIGN KEY (category_id) REFERENCES public.doc_category(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_category_id_b26febbd_fk_doc_category_id;
       public          postgres    false    245    3333    233            L           2606    161075 9   doc_topic doc_topic_section_id_88060ef4_fk_doc_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_section_id_88060ef4_fk_doc_section_id FOREIGN KEY (section_id) REFERENCES public.doc_section(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_section_id_88060ef4_fk_doc_section_id;
       public          postgres    false    235    3337    245            M           2606    161080 A   doc_topic doc_topic_subcategory_id_403e45a2_fk_doc_subcategory_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_subcategory_id_403e45a2_fk_doc_subcategory_id FOREIGN KEY (subcategory_id) REFERENCES public.doc_subcategory(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_subcategory_id_403e45a2_fk_doc_subcategory_id;
       public          postgres    false    245    239    3349            �      x������ � �      �      x������ � �      �   �  x�]��n�0�����L��{�I�Cꠂ��o?j;>�ğ�O��{�Cw���p�SZ�.�������+@��n���J��[��dA���w�{]tb�G\~�u��U�&���Hv��h?Ò�b��hHpT\˖�2oW� |�p�r�N^���!����k6�ָ�^�>4�?U�='ݝ j��YzSZc��yJ������t����E
���j��'?�WG�,h�5l`�5�V� L'_��C����Fz���V�H��.�a��gHG_��+*�A�q�1��0C��U�^�W��|}���ϊ�`g�1�a��U�hV�H�S7�l�/_��c�,�l��e�e�s,BW(I���G��m�\�ڤ���D4oR^�y4�oT�g�YI�8�i�p����7&�Lֆ7�/x�6�z ֆ�����ػ��{8��<�1�g&�}&p�Xo�Ɖ��9�]3&�&2[fRVLde��\^.Ro���l��      �   �   x�-�O�0@��Sx�&���iS"�M��(1S��4�>~��;<E��)Jx�+	�c�CV�pT�$��>��xi�l�e��Ǜ��,RذM�B����6N�s�a��M�o��qu��=J1u9g�"M詊��B?ã,�RS'��[�� �
�&̀��^�vǚ�}V�4�      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�M�K� D��a���{�n(�(R�6�ܾ)V���f���������8�o��BuI"�3N��ʭ�٠	U�@ଛ�k!9^A�۲x���y�s�(�W>:���+��?u�G)��f{7��%tӮ?O��W�G�      �   �  x���Y��0���)r� Wy�,#YBg�fXz�o?^b��_x�������v�����=4SA����ڮ@�� �j�b��d�*�����=�5���=���="��B�]4�;����fl��1~}g��� ��
~uЫ�s��s�z��ٓ�����	l�4��Oqa���	oLo�Ͷ�Ҙ�\�Cc���Ќ�v�m���tM�_m��R<�Ԫ��2�Gs�m��¸1%�Zح%<�v�0����4(��~���4��[��{q�\*ʢV����]�q7�nBh/$J�x�Z��O۵G;�q�wߌ�͹�&{zu킩T�@W��L�]�Rʘ2�U��"��I��ځg���4�e��F�� V�e�	5f���MA��G3y����oO�ю?=���JGW�R괸���>��	+ ,��$��/7��F´����v+P�ť2�e�0���nA�0����~��2�iߴ���ݼ�Ji_�if���G����WD�+ ��<N<���	���H**�_)"�qusJ j�����B�/��F��+3��a�늈� {s%��x�<���+��t�\T�)�`��
�$R�ۦ�� �`N`N¶����h�)�Ӽ�-yr����6��$\��΁ᚁ��!������v����      �   �  x����r�@  �s�
 ���%�m��ʢ�f��b���3��|C���$ƛ��$*��+�j�N��r�l���Uz���0�Нsz۠\߹�TNl�:��_�Ne� 5꠿�a�s��;&��}���9@����~���Z�����9y�/��vt�t5#	��R�N_Sތ�>�;'\���D��	�e&۹y���|D�ï;nX�-6��aE� �Gk�컆��i����� 7���6���i�g3f�$

PZBI�@�
)��D x!S�b���8�%I�R��W<U��K��R<�k-��}C��%���}t�~k���c���r�0��K4�5QY T��}�	e2�G	U�`���)`u�d���8�.��h��K�9���(ig}[�}W�zѫS�ܮ�����o�%��4W¿�=�{�X,� Du      �   �
  x��Yo����� ؀,����,� G����M!���)�evI�ͷ�g��]��D9v�������̛73ohoo�u��L�*����R�|o���L�JKa�2�HL�WI&�df~:���}3�|��~�n�K�p��;Oǝda��y?ҟ�{����'�VA��}�h�ᙌ1R�}\�nLǷ,��2ŬO�]	ͥa�b�<<���K���ù�gb�I_Η_-�+�;�%	�L��#n��On�L��!��rv0���p߰<挧.l��I�ߑ�ga|ry��� -�Y�E�����,C�ƥ�@r�,�c����{�D&tl͚�`"��[���F�N�r\��8ba&_ ��s�r)�^��>�/ϴ\�G��tv4E,]���'�2-=ir�/$��5w�����d�[�H:��wM�+",�S��게ǋ��'ʢ�A�p'
��jK�ҾT	g2Y*�e/�j�n�� ��q���@2Pm�w�A��x�q�:<�|��d������!�%m.�52^�H���ɈB���^
����(�qբ�\.A�6����W]��jrW��ҧrb׳��n�:��,�q����c�b*��0Rx��P6<-�W 4�n�m�'��|��%�
5BX�L��;f�Sfܕj�yN���)N��F"^���1�
8VmE���y3�u���QF<��F�@x�/|�^JmHKc䊙쟑�e���Z�����3bh0楏�����?H4��gop�����ڡ��]��-������_�Db`+����.�5<��K�ZHm��~>y��Q�i	r�G��G� az�������/a`��rv�GL߉:����<�cW�g ��Y����z���p\}�ԥ��go�О^�
|m꣩t�D��ݟP��^�\Λ=x���ڐ䵫��FDQ"xLշ*�6T���T*���D�L�C!("fG�m)Ff9:$Ư�y�H�B�~�u��"��~��?��h|h�7����kT'2�9���2)���ud+ӧKTh��f'm6Q*e�&�Sg�T���R�5��]��B�i�k�$}��"&Q�$���{�T�ܛ��Y�g�J��
�RL����Ny%9�f�7�
�I�*4��)B�\N��`���f� uI�d��*���!��.���FvR%A��ѓ�w3qC��C�`�
W�F���Iy���
s�d���i78kLy=����j(��I/�p�)j�u�c7v��ܶ�r�3Y����.+�VW�tK�x�����A�ygo�'o`?��n?n�T7��MB{)�բ��L��0�l
��a-��0&�q �Z���f���P`�*dw
���X�:�@A?��]�����Y WӇ��]����ߝ�����ӏvD���zZQJ�BD�ĩ-K2jRK ��1��B|��
��
�}��~]g�b�YZU.�j��*�d�On`��K��Q��Qئ!e���k�����	N�2�U}��~�.V��-�7�Y�U �@�J�i��Z[�vmJ�L�'�B�XxԈ��\$�3w'r#�;�'Љ�����:*��;�h�{��K%���lA��H�!6u��S��g��xX,X��q�e�]�O��N�*�pU����Pח����+f�:�d����Q�����> Qm�-����������tSSO�!�����0�^�K��?�mc4��4��րF�ށ�6�]{:%[pZ.]�{;R(�_��Ґ�A�(ral���bJB"F�	\���e�cz?�7%�b��KNT	v�~���}�k)�L�8t�[ϞZݒsN���������<(To��T�WW���[�9�h��v8����k��ڗK��L�����M�Ƴ��Z=M�ݿ��-L'�'p�Q�ijۼ���V�,���k �[Oc��m_Va
��i/�|M�;��(�{vKaӻ���㓷�P.�>�Q����A�V��,�On�퉦ɕ�/Td�������hC�bi 5S�װ>�dV��+�E\ijby�����p|���FM)7���r�%�����Qcŏy��LKѾ�%�е��zBZ�b?f���-6�O�pū��1�촬U1M�؊.�"����wè��i/��� Ӷw�ըM(��L���J٭��0��Wg��.�/@)�p�[i�`����6�B��kASZ��*���vj�L����f�����S
t��L��F��]iI8��B۽cX��1+Y�Sv7����䜳-���?dYj���E�ǞX��;���Td<��8��E����>z=̇���w�K����<r@OI�P��N�K�낁�ܾNa�����y��7^k�@<7��o���ٜ���9,��Hģ28>^���>X��z\�ֺ��0-s����B3�y5����c,�\�/P�+t��]��l?�����ν���$N
�l��l	�o/=��S�Z�=bS���������`���=>b�����&��¿�o����2	D/T+�x���+o���λ;��Ҿv����؂m���~��8O����@�.
�$�����Ho�ꖀ�ߗo����=���@�&��<Á�_��`,	��=�þ�ߞp��(�k��1
�<^sg�+Fȇ-9����!_�0p�f:-�ĺb�K�u��9Lh�Gk�$q�#�s�~��������[폻qiB���ǥ��q[�E�(�����}?�N�ާ���`x|�yG�k6������睜x�G��{ޫO�W�^���)=      �      x��\�n�ƒ��<E����$y9V(�� �<��4-��Q�$�a�����̏�5O����&�\E�[2�H:��U��U�'B{���~�o�|Ύ��`�`o�P�*K�HRA<8�Z�1[�'|<��|�|�����5�5���0�ZF͹�E�\|�uʽ,�Y��pvz��۝��[�	�T��ɖ�d�=�<��1x0VɊ��P"�xz���]\���f���,�l�(M�e�*]�T�\��Ue*_^�4Q�氠���~r0��[v���4��-yt�4{�%�"6��F�q"ؑ�[&��~#؏*�����Zl��2��i}�-UG��[�d��==�!Rl�a/[�޷	��Ȼ����18�Gڕ������I*�,��Ѝ͝&	<r��,j~y~	+]��Uf�v���r��b�h�`�g������t����޳G����g���g���}��������v���oD8\��c�0"���.|����n��2M�>�P�>��c�`��у8M]���L3$*�J�"�T�|--c/=�k�=q|�e�q�� [��QQ7]ND� '������Q�ep�1JTp��A0g�H�x}̧��E~�/�n�Ƈ����TӞ���χ���=�J$���$b�]��Vɀ���)�D�e�+�}����ӗL����Sq�>��@��Í'O��~0K�Y�O����!���C��c�-��95��N����I4�g06��!���wĶC0��?x&������_Xz��Ѵ��C�qd��'�,�����BO�q����ӑ��\��"�~��J;� �k9�^��:�)G��b���O�֪�l!��{���ǐ�9Ck�!FDZ���tP'�������7�|��-^:A!���Drp���*a�e���B�k~���@!|����8�����Crsy��C�錓�D��b���Z����'儉 WY�w�ɵ�V,�g2'�t�7����N�7^ٍ�vc��h}�I�ʳH�Ԩ_T!��@#��3w�z��8�Zg � @?dkn&$��(�$�	rw��W�۷
E��������u0-b];��;]��µ���Q�����UQ{��R��F���
�J�?��*I�F�OU�J<,�A��E��De���e�NX��9�DP��[���K �G�Q����eU@��H>b��IdU-�!��ݲ�|�����b������x���P+��H"��I����L�K�Ga�lM�4��HW���2��'k���e[���#q{o^"�%���:?�'ͬ"x����nՁ�|&;r �Ӊ����L2��~�f��T��9�����$ou�b[���劽3��x��8��S��q;: DV$5��l2b_E�d'�,U��3�D����y��c��N��[���i�0�զ"`�qDs�Jpe��5�ͤ�~4�6����z��0F��J��ç5���/�Ϟ�_m�K3��bx�H��uZ�˥�����6Oʹ��o�oY�Lv)�Y�������r�<׵|�<4�VSΔ�ZN���pR��M��j��kk�����)��a:wA�u$�+T����WXzV
Q�;��)QpL�B�o���~<=���|j��[��hw7�]��6��`�t�~����E4#dԯEb-$P��T�c�=��,��k1�c�ZL=���	CMx��OD���'��"Ng�'7�)����sV������|�D�s��	���$�a�+J���D�?�?:��S��5+�ԎUOa<]-ӽ��g�e#��ؤ0��Sh��'-����)�C��}�l���	�@�j\��r��$��lvt��h0�=���]47�+�����=��������ڝ��OD���?���*b
]9��77㼐��a�"Z���v�#��b���0=r�-���+��r�w����ˀ��Z[��]F�G���#*����o9ؓ󤉓Qy����Z���-�@��\�)B�'\	ͬ��t�T �zId��9��0������I���6����|�?��^������ݠ*Z��Y	;x�{0+�u˽����L�.�,w��^O(Vz��Q1F:OQM��	9��V�o��i	�L!esLS�v���S���{�bT�(�_(���3�q	n�-�8A$1h�����,G9�FK�Xx�*�U�ޣ�c4�i5��j,�g��W*?�"��b%|F� J���dD>',�f�+�9�wA�@SU ʵW�O����9TS�����@=�n#���f�Hς�|4�L$��Zl@m��Dkc�r�&��������@2d$���bFv�I�܁�
K�� M���;�:6XO8[���8�����ݢe��'t?H&�2�֤6о�y
k���BO@�r3*v��)�/�"����;�Պ�� ��݂�@�=�<I�7��	d(�L.H
/|��_ypK_T��'��k�ڒl�ߵ��P0(;�߃X�bB�K�<���Q"$��]KpTl�da�n�Ǆ���Bl2g���P�͂��qW�M�Ss!B��x8���4�d��l¼9�K����|8f�?�-lD�E`<�>�cm�͋h�P���;p+6�F�*_�~�s�	��"�fd��
���p�3��ÆX�ж��	Νb�Vm�<�)��։\g=pͫA�	$�#F�Z�{`� �����.�5\��Q1�|Y�ܿ+����,#BD\E��#P�2��>�֩�]��Z�G:�Z���N|y���(6�s�iY�P���5L4��h7 �k'ʔ�]&+,#/ȴ$N�Г�%a�E&�����8�ʛt��l*B�h�/�2��E�r.��ؠ_�y��B��`�w0q�<Eo���F��Od~�&�o��v����P���M��S���l�YrR�3W��Lm�*�D���fK�17����\r-0�����n�~(��0���݁H&�&6zd�$��Ʉ-x2_��5l�}5���}�B ��>�n:��	�)��<]���/�K�"�h��Ҧm�T�Z=O��z�Q�)N�s){;�	�Ҍ��tϝ��m�BC&Q{�x <W߱;(V�-�AJ�@��<���%?��}�֋�J|ͩ���N!��R���&����V���P7�S�zr�S1N��d,wW����|ow�q#
_���;ci�������G��.�a���7h���)�b&L�����du��h��Ɣ3��>��֎�۵�Ϲ
A\���S�<b�X��ù�OhAb�e0	`����=\�H��`;�����H��a"�7��AXiJ�nB�n_������fLmO�)@���=�Ѐu���DAS�	��g�QH��9��J�'k�n���Y	J�͙%�To92齒��\��K�A�V]�h�bX��,�9�K
T�������|V��%S��~��g��H�Pw`��G��bܨ`��I-����p\s�Ж��M�q���+x'����ӣ3�}6;�i���K��ʴ�o��U��j��j��6ehBﴧް�߲���$��LKE��@B�����ll/���`��������6~���m�WMS��=߳�������w;�a���0���:#yG�	/�I��9dl�����0�k�k�A��Ç2����*�"��m�]+�Y�2�́P!����OjU�|����Ϫze�U㥯�)���b_�hr-���3�S���ԕo`z�)0gG&��Um6#�������L��M,q[n�`���K�.��h���f�F�IZ�,8�ꛈ�'������6}*�.rʊ,�%����0Wm��3��POW�SY�iL�yE��AD�&�>{_#tB�	5�`���~XIGG���:�4�`���<�E�Ԫ���/�>�L�B��$Tz���̿�L��KЩ�L����
�߇�;"���Ys:�� dT�a'2�Yّⲥct�Ԋ��m���6����V�0�H��r9�g7�+.�cx�ʧ����icj	Q����}�m�8�J����Wi �  �f3p��`,�N��[�g����ɋ��<=��gb�3_oR�r�Y~%���ÿ#�F�F*��\��f������&�بx
=�s�Z�P���Tj��U�`z��b��	�'y�b^��t6�#���M;s;�O���fȯ9^��e�țL�.�ņPvE��ꖴ��jo�\>~���HK,MZbѝ�8΋B�~��kOL����7OM��Dy��H�r��j��y���~U��������P�k���V��MO]QQ�����4�E�򏯱^H�4%�����ζ��b�`m>}{��u.9ɫ�M��Iy��4�9�-F�%�F�
m=���G2����D-_b�7D\��!�����^z�(���n��Cb|�y�+3e8x�%��l�Uj�G�~��:��r;c����߾��ćG�u�8z�|��U��8��K�Dn@�Jz�4�mu=`��c�R�g�{��4�!��u�H��`�
.	�7n�
�B�[�fyM�s��Xx�)�Q-��iZӞ� `,���7
H:'�6����8��5�Թ�EI���OiBl�)��j-*�7[g���>��u?��,�,B���3Q�(�܁>DgY��Ukb?������U��_!�q��ǝ4�=!�	qO�{B|�wD��8����"��x�/ I�[��\�!&T@����Έ�lvg+��o:��M �nk�c��[�ə��
�ƚij��{�����_��p�����g�@a� 
�݀�k�$�#�9xP��ю4�z�9��^$_�i��˱��;�9fxpa������(��"Zɇ�{l����\}\��KPF2���"�|�]��-=o�ǜH~�. ��4F"(^�X�8�{�:��3�=�}f&�3�ꯎUu�����F�j,�5r�����^����:���r�M.�UJ?,�:3�m���e�H����@y����^��N��Ē��E��њ�� ���zn�T5�|B\����	�$)���Z3��J�C�V�V�"\X�( j����|�Ʋ��f��2F���DL��ԓ����[^?C�m\�u:�=p�[�?e'�%C�x�˅�-l��E:��eX۰�N	,Q�)44`k��ݿ��H~t�&]˲�0���_�0�sH�jv������6@G3�,J3`��TtEq!u6�=p�ړ��E�"*�U�.��L���	��YF�HIT��V�b}�q#x�Z�M��g{O��>�N����u�ch      �      x������ � �      �   v   x�3�t��-H���LTHIU(�O)=����|�?N������������Լb��<D�������4�<���'�U� /�����D��P��X��������@������\���Ӏ+F��� _�#      �      x��<�n�ƕ�3_Qp �Z-�.�hI3���ю4�ƆPM�Ze�,���	�5yȇ����S�b���������Ūs�W�xS�O���j��Ńbg�o?��}a�e��R�/w��+Q��Z�L��s�ݸ�w��_���?�u�z���?일�-a[ξ�������ۭ,�,^m�F�x��w`����
��o��{YɰN�u���'��go��U�Qs��:�e�b �ϢAT3B�%7���3a2^���JVs��3��W�h4|����B�>u;����2Y�UC�*8�3����ۈW��VFfRU����1����1-
@��Ah�l| d�4�Kd@z�u�٭��*�}/3���p4$e�K-N��%�)�d�\1 l�md��cW\���t�ﴶ+���6oq<b^Z�:�}Vu�6v)v}q戌x�Ŝ���{�K>�Vr����$F�pͲ��LBBd<G6� �#|U��'QօbǢ<���U�+���,���T�e���)��n���+������ouZ4�wR(��}�u���u�Cma?7ǅ<�0�*P��|�V��w��n��'�@�%�9S����]<5BW*,;��:�`�Sv�������H�d-�մ���V��K�����âT���.)���_F�J`�ϥ"�s������xh����d��.�p�NnV
tJ�bǟR�/N��gv�sݳ<�7o�w��P�O�0�� J�t��`z�0fF:f����R�g@g��
5ԑ�`�>���s�^���@���ljۂ�X3T����4��B���#�f9��(9�u.L�2�C8~z�U2D�������4�w�^���]GYo�{�l�rU��$*�2�*m� ے���g7���s��q #�i�Z��6�g`qq�"=��ȥ,$�%E[����P��XC�^�r	L{���GqL���@�JR2�v=٬�eR�<��^$�6����%��Z�~�R���W�i.��R��8T=ؒ�|��sq�����{���=\|;���/N���y�_#	���gD�3���I[��xc��ⵐ�o���
X�Z�\�x ]�&@���f�{{ƫ�����B��]x�d�ߘZU������(?KgN�Z�/say����30hP5�_R���Z�_[i0F�xݤw�@/�
�i	���G���R|4 ӯ���G��m�Ԁpm	
�*�bv"����q�"������XT�0�[��G� ��ޣ�Lw
��`i�IVl)��
�C�W!W)��B�	AL��a`,�����ɴu������j�ĩ�5cCE8����::��W��u�R?�eGg)	�7���:���#���ۋ'"ȋx���w��Xl/�����`q�w0���oۻ�//�_�A��A)���?��w5�����w���{��Q*�8In����Ǯ3�^����p}c��M���U�:E_@�dgՂ���<��-ၩ�n��xݠ���+�6��!bW�n��$>�r���s�N�(ض��u����೦�A��D|��p����K��x��e��;�ӿ���N�fu��w�}������Q��o�>��m��j�~:�q���lQ��EGRԙ���%����y���|� Q���{XԠ[�gB?t'Bt����g���B�/)�Ŵ�u��=�l��jT�����N�x�2�^۴0>�V��� ��IҮ.�SB5}z����՘'�ڐ���c�$����Bё��8�1P���
��� ���7���d!ݪ.����;��م����4n:	�(}���H�t@H&��������E����p{�n.߿=�n����|\?���3��!�kdm��V���.�
��P��h r w�4F����4�����"fx��Z������ĩg��O=}��� &�Ngd&D�S��T�Jp��s�{@��3�+�(Qs�w��RL�O����PC�%�O`��U[�����Z@Ӯ��c~<vJS�P�1���|�\_�2�
������Q�%M��e�Egv����bwwZ�E=g�*kF�}�І���\h��\-�]��1�d�p�;���;Tѻ�p�eIQ��������]��:�����4λ��y\�q_��@�w����̻��w���E��<t��&v�{�jFtr�z����}�{���8\G�G�E��
�/t�(̒�>�:�`H��ށC�	��A�mqr%�2�uؾ����9�ţ磒��$H7�'��u�2e֔ݧ�ka�0bk͊�#���X�@ÒLi��u! �򁗝i�t��MO�y�~��p*X�T�ǘ��� �4��Jf]�S5:{2��#K���Z<&� ����:��"N��T� �]��Q�J,�Q�棤s���
��Ec9��m�)m�����d1)���Fc�d`�q�ގ29��J`9,�w�A�D��_����z��%��hTq��p��f�*��m�T�����)�D���~��� �U�O�A46�4�s�~
�+��`��'[6S�X�!d����sR{*@���-� �d	��Q]����Rh���pύH<���[n:C�m=,]�!
�bN��U���^W�핦�v�ʯ�����+b�XH���*�|\v	�#�)H��G���+pXT[ɉ+��L�B���%�~Yi�V�џ��[*<8Z�O�(�}�����E�<����-v�/b7ؼ�3{X��	a�d,{�y�,��pv/�mjq[���s= ��������a]4�t�	�u4O�d��`9)Ez��,z�N4[���ʧ�C
�w2*�b �e��a����T��o�Asl��&�7g��~�hd�$Ⱥ�ea�t�+�b��W��!���,�w@z"��2��{�uԸ�#��/-&�%Nϳt�<t�G�LjzaMcۺ�ȓ���`����~G��A�q��$��9�`�b������ؤ�حŒ�����aq���Ѡ��Ñoɩ�%\�,��le?J>���ڭ����:���E��sn;���=Lm��[>c�5f�߸{��ӬV�Z��&`֙��m;v0���&��@��5�9��u;�F��H�������m�彮��$���T���߄�׻�h�Aɠ ���
J��Aۦ���y��7�ʣ�o��,�2��Z#6A���l�)˱�w1��5 �D&������u�]�Tz����P�\2Jo�k�w\]�y�S�k0�xH[	_�C�|/!��������kE�V�8�3)|�݋�V��Έ���&��o�d�mLj�x�=!�F�l�&do��5�R�{�����)3s3)��AS�ևx©�	4Z�X�4Psvj��� ˚�Ì>i���|
����>lBS�
a�	?�f��Cf}��F��~��c"�{���?�G��@޿���ӱ���g�,<�.���i`J��q\&B�#�^_��j ��`�q1��=fFLH��D��!K�"���Ɗh�7��r�/j��u�0���	Դ�/��S�c�څfY$+Q���6O���E�'Ѵ��ce��u���ęZ!z����;�qG�z���/��6�.�1�E�c�0^�j�M릇�Ȉ����`8�s?�3�h�_��M�L�����5Vhp��*���$yp<���@�-����Q����K73l�޸¸A ���;���362HmT$�r-|�Ji"�
\�uA��=��Z��2�/s���`H1f���2��0)i�[�mJ'ؙ�2Re���(A�Ȟ�ע���;JU�F���1��*U����j����S� �.*��LD�rS����=�n``�s9e���i-rg8>>�54 ȊnB+Xh ��!]3��(k�xWn��vJ$Itl�+���5< ���~A�7TΌ�̀n������x�.�EZ�SK	�E$�n�ތ�C����X�sS���nw��u���e+���(>�����+
�yIV��t��=F̔A�\Q������$�g�ƍ��0b��I^& �  Fh�T�7���̧V`pw���R8���\���$YA�[����'�l==%� �H�H� /l?�t�B'!�f��1� ��E��~a3GW'�;@5�!��*����^��_3���EܮOC��D=��R�D}��JR+�D�k�d$�� �+�U )�2o�(0)Z�A��AU����Ќ3ŸC�P����\��-鷋�Q C�%�4h��}!r�*��t��lpǺ�	D�Qw9�J	�fi)�Ժ��Al��Q�m�@�4�;�~���,Ք���~ȍ��� 5g[�F�6�X�Q�GU<R��7JU�~�M�:uI����9w�:q�U��Y�Ά�r�4H�N����mم$! �D�La�;ʩc�x�7H���;�ˤl`;0V��oP��B��l�كc�;�����<�6�8	4�Uz��6=E�A���S�aӉq.�B'��'_�=�5�v���SH2��:=m̾�9��j*@��-r�Sb0L�i���cx ?��֣��l��ꈽ�3�L6F\���,���m�~�5̑]����}��.�@[�{�q���G�e]�4�BR ��)�
6�m�X���b,�=J;wY!9��jW �1s��d���C�)Ё�V��3,���3�aTҵ�	R�<�4����R���BBOY�&��Ӹ~��Gzҋ����V��HM�I��ʆ-�c�_J��_*k�ղ+0�l0"��,��Fm�XfE��^p
�թ�Bo~bfC%^F)WG�ɬX��"��G��2�C:��z@B�>F�(�+\t�����o+{��I��-k-�� �
�5U�:��=U�d�Xq>�.��8雩�ױzR{
H����"��=�ѠN����������%=w�1Y �a�L�~��4�2M�Q��F��"� ��5y������t�l�^.�rG�30�$t֘��g4�lT$�T`<�e}�QK�F�U%j��R�rF�p��=B �ϥ��M��q�
Ư�.�z�:6"�۞M��.��5�����0:�u�х�hS]�D?@�ZZ���Ƌ����/yS�'��|�/���҈�Pq�*�k��=��t �BI�\Z��+z�`!�~V�e6�$�Z���v2 �'�E�@���R$�Tɻ#����sR�k�$
�����ttk��>{f��F�ǀ�&x��W��󴎒�%��@�7�e�{������.���2���6Z
U#w���;��vw���V�܌�>�R-�Uĳ�(��Rz��޷L��S�-�3��
�7���д�1���L�ƍ����6�w>�##b�/��ƿjJ�6���z+%&�ި���`�7����s����G*��a������n�w��^>Ǆ�G���!�����3T� .�Z�~7��i�~T(��[k��KQ"H�_����#����M��G�z�Z��հ-�Ae�t�/x�ҭ�^YIk93��O���O��������óO�?x@��?Mt���ŧ�}z������<�l{{kռb�	P��A��:'8�_t���u�9P�Q��4����2���p���!�N^N�l ������#ׄ�$�ԟ���9K^N�6�d�+�K'�#8�Df��Ћ�ëV���D�֦�:�)w�H&������Tsm���P?r#˥��э��e/h�V�%[)�v^�������6��T4����c��.�4C|+�~� �g��� ��Z��"�?.�WR��{�\3�*�Y��
�6ps������˗/��|�&             x��}ks�8��gϯ��D8��U%�uk!˲����<�����@��zI��
�o�����c�	�H�J�R�&"2$�L���~�~���}���yO�����������������߂�ֿb�ٿC������Ϲ�y��7����7�*��qr�2��7_��W/aA ��//��x�\��f?͔��o>���x�z��Y(��@��/#o�Go�����K�L��Uz,Sb�g���@��>��hb ˣg^(����G^� �gBE,`���Pz2�
�Qo:�o��|%��<�E�E����Ł�x�q�_�4���V9��-�!���Ð�)���c��	Z�"`�_N3�&�ߟz�:��@��KƦ!/����΂��S�������[���)�����??u|��,�q�'0����gg���$��L	i��?����Ͱ�����9���;=��3�k,p&A���^S����\M>5+�8������O��Eڝ���8�q���)ÿ��l3I�e����A�o���H�.>)>�V���	 `
���i�D�m/�Q�r���/��ab�6V�=��g�3(.�;u��OA\p&E8n�JZd�j�~:��gʶ*1� ��6|=nfv�@X:�M�d�{�_����F'\K҃)�'a��K��9�z(�x�.=C����醴�_�H���y�|&��Y�r�[ӹ�nq�U���<f�P�� ��:;�N!�R_',���F�@��sVw���;�P�Fj�t\���U��>�^�pg��D۽�5�߻a��C	B"c��h92��sݒ�	SF�훝pf5�8	7�(`�Y�q���=\�)W<�����9PJ~J��Z�Cݭ��<�Vd�YI}�F6�l��o��/�k8H���D����h����"��j��8N�����ӄ#!�>Ĝ�`�9�h���f�"ǟ`ae�t�i�*`��)��x��
4�rW�q��%��1�?n��-M�X�\�|g8���s$�H�FR��,���� ��D7��9غi���%��2�ؔ+��^XR��Td������a��E8,8���֢8h~���E^����qץ���� Cv��W�g�����P��z'�~��m-�s�����=l�=�?�F47��/��e���v�9��������@��`��Kk��)�EVmC�{vF֪P�w<���>*`3�⒂[ԥ����Ewl	@a�կ��Nm5 &,	�_Qk��{���w��Tľ�PM�y����+2[=��=�5�ζts��)��+�0q3#�$�������6,f��[��9�Sd��E-�K�t���"�	�"��}�ox{��V���`o��7<v�G����fΘ�x<����9�m$�C^��M�L��TU'3�ӓg��h� q��V��I��\��6���.<x�3؃Wƺ�1ڇ����^�!���𬕋tT���L�aI���rx9���w�*�E'�.�� �Ysyډ��7&�� 1�b ��u���'C��{��3��6��)��b�턒 ��5pǇ�W��c񜩆��{�:��_���1^l5g)�}56���9�Y���TJ���)�Ef����Q����)H$`��b�+�`�80�'�H���>k�nv@�)Hl@���ӻ�����py7��c[ p�.8[�R��\Q%�ۜ7�^��-����!�b��m57X�Y��B��k�JG` �~�O{�|܏zw�,����.؄_�o���0˕1�����K`��j��jU�_�.%D��q�4u��,�Y�5h�rd���N���ű�M/G�kܪڎ �˖�p��Z�Hy�3 +eE[3�x}�N�y�r/�{��Ǖ��_�J����� -Np����dZ�~���YR���<��_� ��N�5\lA�e�O�[r�s�E�b�l-����n�8/�sҋ���������C�/�K�T<�jN������F�"���aBA��J����N�Rzs �TX���%
c������8�}��}�4�[#v�0]�Fr��@u�$�"F��2$�fk�7=`���-+��=&J�@���G�����̪��1=�^l[b��Y��~,���27Gb���I����ͭʱbAޣ.�ضw�a�1��j�Sٶ�i3ZK���h�	U+��w�Ғ�G�"��3��n������$֨��tx1��?�"��� �	))������O�.3�D4����*���\4?��g���c[����&R�m�p{T�S��z��or�J��m�6�C0�U�C�{-5.QS0����)0;��C�����;@jc�`���䱸�d���N�y�ck�� &lwApZ:N�g�"֣�X���g{g{di�-|�����ty.vl��BJJzK���r!��o��-'�:y��x_�Ʀ�ŧ"*�`����4+����>�As�$�����L̥�`��i��Ӕ��y<����=��N˾��[���TR_	#�~��I�yN�<�T5lF������vPQ���ޔOA�2�j��й�N%�_`U�����|���m�ܥ��<�)"'�h�yI��7ҏ���#��Љ�3T2mm��g?L�:��i�X`���~ș�i5����ЗҘ�u0���ixš�z�)�h�~�^]�4Q�؟��`\��Z$�\t�`�:�[�Q���D�ͽWV�"�]5��;wV&F{w��C�m�X+v�O�rᅞS�7�`r%���9�����z<��ZT���"�rc���0��NI���'��� \��,ڱ�������oOR��2Ï�����&*5�F(Q�YMd�� ����<Z]����X��2�_���1,�w����N�>�o��n��e$.�<{��^�̐�ɸ-�j ��<�Q���G8�Y!Pe&�<V|�GU�v+�s������CkW�������h�w}�${q�e{:���$�qn(�},b�R�������&n�0�ުi������Ջ�B?��F�ߋ�}0�l����:��\���݌�B~|fh�B�%����+�z-n#����#�ޘ��Ld�e$
���#ȈU�EtPH _]	�8��,�H[��&!P�+�9q�(����$OyN�<�
���������i�2�Rqq%E/聂3rA�b�v��[1��8���5V�����0��OZ�݉���,MV�6�{:\=��Z[�`�%��(*����}jrYR����X(Qs0�miRl_ڛi����"�O�U����)(��ju9gP=Ν�?p����:��Am�����^�M���+r�h�{�4t`��*��c�d�z��0ղ=[�:�1G�v��>>�+%�]�C>���)��!��|.��L����p�aY�6 j}W�VHQX��B��48��PG0l 3��iCsT�j�J��y[GjQ�&رϕ6�3�q�c�D6�����;�����L�.���~��**H��o-�e����
QNkH9���-�5sC�8�N��+
��8$�MN?���}_�p �PM5�v��Y/����������+C��łD��E���x a#��$��Egz�3�d�[d���)��m9�g<0�: �]���l t�ˮ�H��(C��e�R�2�ǜH���7�~\�-
��r��	��_�5�ߌ^�V�9���H9���U�y]���p�u��}��Z��~`���"�͒�@oYC����6 u&JF��3(����0��Z����p�e���9 E�:��
�Z���e"��E��rN���%!�]�� '��̢æ~i+�foJ�fo�ɴ�����΢9�6d���U}M
G+m}
F�"θ.���۶k 7vkP%���I������~��q�Đ�)}H@�� ˵�F��]���tcl�}�X��d��:4��=�0x:��P��B6E�!���_d���������Z �L�xI��mס���Cxt�Ym�a�ƛs�Fe�4Yy��x�!��ϔU'�$�	��Q�#�3/��q��#n��B�Jb�T�R)i��`9wOM�    w����<M8^t�)2?���M`9+Td��\����`������S��P����tD�@��<	yG�X �<�sV���R �r�r�'�툯���1�)&�)���&ܚ�7w��agt��;7/��k��X7:~��p������i{��He�W�H�N�^1	[{e_a�e��x?��Y�t䭵}e���)������rvP�#[�m�g�$�m�9��UX�h�N$��%͍�l���
qM�}+:ｑk�?X�����I{��Y��X׀l}X�J�:������k��c���5�N��Rt��ˬ��2'Wf�������Ny��c�)�ohY6�2$L��;m�"m�Ͻ.�9X��UD�,�5m��>�R6U��_�q�q���>����[��Y@y��M���͔T�e� ��/�	�:Y�-�}��.�؂��\��8p�Bl�\�D��0�=�m��DJH�lOa��ԉ�B�k��e2]��y��X���jsp�q��P@� �h�>)7�k����BF��*u<�4r��͗�9�a���|�u�ڿmT�2��}��m�S��3�,���+� �in��q�;� �r�]����xC��1&9	1ym�'R���U���nզ��V3�p7�l��eM��1�d+����(u
쨆Ӏ���*DA-��=\;_� l���.�!�L�]w"Ć�Z|&R���T�Yd�,C&�kO4�z^�w�Kh�X�&���i��:�~*���W*�Ei5��t��Ra~DQ�k�B���CzT`������2� ��+�R���1зZ?����He����Q|LC%�V6�K���F�_��xnW��!�+�DJp�A�n\I�/��hq�m����ھo!�M������F��M;|؍c�`�(<��T�x��%�,�TƁ1���xf�K6�c�:J 2����f-,C�;�5������2)3P���D�:9{<��O0�.��;W��}yi69�0����{:���ͭϰh��j��6TƆ��w�W�%�� Æ�4w��P�a�w#�~��{�\-�$X?�	y�lB~|����-�}|��.�Ⓢ���5���ζ�g-�	.O��'@!.G'�l.������6���+/��+���aHy��n"�)��v�I��B�o砸,�E�Si&���2gό<���+HȢ��>&f��`�F�@)�����lǁ���}M�mz8^Ң$�h~-�������7�Z6���y������ʛM�&�2�%�'���2m���N�2��U�"vQ�w��]���(��J�C�=����WR�
��r`a�%:z��퉸W��v��c�S�і9�w>��1�>cN�8��է�`�l{^�/e��5�S&ÙaH�	�%]�R��
a�U�Ձҩ[C��m4%�P��%T��7y'�'�E���n��m���D�c���(��=m%2.���!�A�$w6hҔ*!	9vK��4�܃�9U�
t�|��%�#�>Wr�8����Xp}EipK��w�y5�fk�������m^\��S"�kBW���	T|�*��hUհ����<�,�<�_Ʃ���[�P��'hH����)�l�ݹ�|E��)q_�ԡ�_��X�_ѳ@�{��l���z7b	���481�Ӝ^�R]M`o�����]m��]��"֨���"]�r����zFa�6o�f�/t�5��J����s&H	��_�՗���7w�3_eׯ1a��C��Fd�I�l��|�kƶ�߂�hl��-���G��m�{�-9d��4������z��9}�ҹaW������!X�ҫ��%��f^�ۂ�c���}/����X����ЧYxXK1FM����ls���3Plf�������ERB��u���Z�B��1{��\2%X�g�޺���[4{���i�Q�J.P_/�����}�u��=u9	�l1��և[t�l�*>����%<d�፵���L9u�Ť�<��֣��i[1��H���}�,����r�j-{�0-�$�����}m��HF��f��Wyx�+�D�G9��t�˺n�3$�DTaIڶ�]�^U���u�pG!_PE��Q��=u_���S�ŕU�#�n�p5syR:U�[�k�-^��q�j���p�@v���ؕ+�J�w#h?_�a��]��D�;��9�3n<�`�����E?b�� �،\n8^k1ZwU�qdp��9�;��ݣ��d@<����.�GaZ�ʑf�׬��xp�с��Q��c>��H+3���f�#�� p��;#g1��PYW�2X�,���Dmg�j���v��W�!O�6��坡��n�[G��\Ї�-x-�P�JQ�q����=N>Vy�d��B���YvOZ>� �;P�>
�_:K"��5���l�F�t�Y ��4�\��n8|PR����i��}���� Jj6�9r�;
�ćy�]�����7+��K��O���	j�<����Q#�M����%}��Q?g |����{&�_^!�z��~h������]=����rvg<.+��7B{ߣ݈�aW���"�<�:��0'YqXysC��d���a4�T�J� 䭑#1~��� !�U]�3Poc����󾻔���F�	<X��ٻ�����O�ȉ���nx(�����cӗ��N�����$8`;_;�u�ܴ�~k����m����xS�v`Ś�"y!a��c]�8��B���W�
N0�l<�2�u��]�ۂ��?��Zkb瓮��z��ޮŠ&�S�mnq����b��/(]v����y�E�P�AYE���YrE��G�WG�Q�C�Fw{���}A�[?�[)������H�,O���j2úYi���u��n� �ħ�:����3��u�v��=/�7����v�R���!#`�8!�4v�F2jX
���փݔ�^O;���y���2��`���X�șy��� ���fD��d���eN���w�g_hX�����0��md܆�֖��\��}ѷ�+��a�Ʋ��	ѭ�ꦆ��mǣE�zG1��M��9V�F5��-V���jSݯ<���͆��o�5?�6��xj[�~�B\��x�#�2FZ�и�]��D6��,��S����,�QTUo@O�,��c��q��\=}s3���<�v��Gj��ʩGs���^�/c��t���z2�Y��"kM%��Y��f/l�M��l�k����N[os`"��'�ɰW^Y�g��um����P[6Z�2lz�NR��k����`] e��kA�x��@�ܚ���7��r�X{�"�~V�����a�<R*7ujX��C,8Q�jW>�	1��+�G�T��FA��\�@���[aA�\��׺��:�xg!=c�
�57�Λӗwt�v�E1���ui=�񛐓�vV�W�!�͹���^�����ށ��sr�����{P�U�eX�`��}Y�T�J�r��a�qȠ��WpjO���]�oeL��{��m�/a@�%l<t]7BbͧvB�D�h�����0���;ҫ����sJ�l�ʚO�G��*u�$�:\�0,�O�^g���g�{,>�����B���0����}�6��)�6X,a}GR�Q��:�.V.���k?T�1��0I��M��g���S��0�����N���W�I*C,�~}�z"B���v��c�Ym*�;��O��K����U����v�d?=Y>+��}/��L��_� �Z~��9�B�I "�z]���z/�R1Y'���j��bmt�TZ���m�l�<�qz�U�bn�ߘO|i������*�W�uK�߽�y "�R�����O�b�>F��=a.&�Q�pf(�4�njw��U��ϔ��m������έ *�N`d�;�\�����K�Ac��Z"5������pW
�-��k����o�/J?�.s�� 2GW��F�ߙ�|��PD"3l�0L&��x�p��*�hrE*q/ �lw�P�
�uw�	-p�i6G��3m��^�l��L���@�:��4�P��oO�k���P�s��l�%/E�~�D t  W��)μ���2/j���,��˰:�T����a���M����Kw���A�r;}�I��Y��:������\�T��(?�F>�zޠ��	�.��VtL�����k'��R���Ǧ��E�?/�Ƌ2\���y�f��1w���ö����Yӱ�?�g�� �.3��F]�3X��� [��
��,@�������l����駆���|�9U2�6kDS��G����mk�ZX�tM"4>��������F2�}8jP[�+��"�-<�15Ϝ�[;��仞�q1�9З
i��FB��̧~J���>.=�Fb�%"�q�wUڍ��� ��6gP��T��(������*Hp�% 8,FS+mn����m��G�)���ʲ�51�ј�	�([��І�:����RZ�?��&):\����$2�c
��I��y3�����d�{���T>��lm�+�ʅ�[��%OT~%CW-g���C[;���O(�5�t��a��R=AR��c>g���#X���|(���
:b�hsXn�[���κ|���'~�(>��L	3���H���g]Q̝-S8yİa�ST���f���h$N{4��\��U�S�}J5��A)�5e����a�ζ볌����+{9�p��7�����0Ut��q��v�&��A@�qi%DT�&j�%�
X�$@��:u���9�*~��|�9�Lf8��wB!g�(�}QH�u��GJՕ���҅���pfu_���q����!���.��ؓ@����w�q� ?x�u��n&8��4�0�� �b���{��^�uA�Ύα���������5��v���O�=���˧ݧ�~��ª��?g}�`�f��Ǻ��M0�Y��fүp�^.c����ץ��ꯗ`����0���g���"���
��*d���(��fe�,i�p�j؍�)�I����X��<V�\�z~�<��=�g��� �Fsv���9V�v?�yt��9�A�+�lD܏.��`L�~�H>�z5�0��V�f��=�Q�B��K�f#Q7u����[���Էݛ��6�PA��*�q����c��ڨs�m��.}7
�Fަ8<�7@ֵ�خ�
�=���E�Ⱥ��Vdc�o�躊��Kb=H1��4z����?=�m��<�<��ǿ��2z�����/^�<�y4���G�/ ����v���/2��/A��
H�|,dY�U����q!�O� ���V� /�G(���m4�/'"N�HN�%�G9I�����lY�H�A��5 g��#�|4 M���ģ�KS��0lP9Vr��p�����n��ۀ.=�t���9#^����i���Ѐ�9	Љ�*���H�
�#��.I�F��
�
]M�+�$�|�,��g˳�/������1I��Nb�fKB㨋`��b-4C��'�X�1[��&�*=�@[q+,a|��/���I$b��Xmm$��D�y���2\�&��d��R���)io���b!j���x܂setm�2"*;VF���Pp]�a2�*`7A�eP����-Sܿ���1+ ��K���#�2�ˌM"�۾��`��"X�'C�f.�1���EBON�8���7��(�l��j�&� {x55�c
�j:U?��R�B���؏�z4P�4��Yr�>��B������d�$�C���+a�2���4�sM���l���ɉ��ze�#�E���K 3ǒ��!)�I�0+"���g4-��
8�L�U�S�.�ll��V::p�0�u���d�kM���:3k����)��w�XaB���Fr*�,�I�w�
RirP�k���f������a%*T�,�V�Ƃ�+u�.��w���8���Ra��,�B:7��t�͌��{͋��I���ZV��D#��k��v���Fx<ND�U�n���~�ϊ'`�a���I<�y��]c�z��Q����`Dj���r`�Ni;n>{���(����+���3bJ�����O�b�RS�iBy���9�p�������'FD2��Pe,�g^1o��{�Xͼ �w'�L�ʺ�J�E�a��9���⦥/E��$�������=,!1��7n�Q�)]�,�qX�$�S�o��B|�/�<��j8��4��|�9�^ƣD�<X��c����Q���n�L��fy���8)i��^AM�����9���Ԏ���f�Yp���Qөd[����g�NL�m<������L�B5��x�����k�kI܀���[�K����?�Y�3�o��_nV?����K����������f�F�=�V��������`åY�O��~3���X��.�e�\������٫+��sV�`:�X��6<C��}�`�
~!��#YJ%~�y*�t�'�T�x����r�`g1�/@N�2��d��wo��{{c��X��n���&�u_��o�2-S@��s�IН�<qo��;K�~�	�6s�}�����}r�z�+�;��#}��(�SS��a�"�TNQC"@Qd���j��>0��,����E/`lp�O�B���(tn�m���:Y�!�Ft�unj����53 �Am�!Jl�k�:Ԡ�1T<aa�K1ǙD��(H:����ݷQ�>� q��<�9-�A��U-f����z��%�\���aE]��:𠫪QV5B*�x����0�	 ���>�=8�����x8��ޤ�!tr��ie��wA����z� �dDe+�g�^��o9	�
�/ ?���1?�F)�$��Q���(Z�v��`�c�����s�ɻ��/R��S�e"9�H�������{�c�;a������(���{Oޟ=}V�u�I�iWv:�[��M`��lW<����=�̻P|���.�,I�ښ��"�>�[A:���@�-�a1ה��R�q���/��8w� ���{c5�Tp��)����ο�> �y�(F��}������#ٹ�U;B�ޞ{y4-����fc�$��bhG �c5SX��F%
�B�RZw�tM6�ѐ�H�ۨ��ժ�8���ȼ�G�������4]2�Q!�R_�,��S$K���_���B�b�.m3,4M��yYቦ\�0	�^p�w�UW��L�R�1�=i[��xt��w5�EXh��&}�C�[�ŞR�Q���� �8�P	���Znl�؅�Q֢aRE�㌴9
2�����M�����+�B�m�x�A�(�+�V�T4�:�_�5@��h����\������<z�珳£T���O�N����j��y^4Q��V�r5�Z�鉱Յ¾N����i�.�3��U~���4�x�
ը��k���%w,E�!#��W���.�AkUՀgx�R�K̈́`g� ԡy���k��U��5�X���,�/e�2�i�j��|��a��sk�_$��8`�D� �Q������>�޼;:?��鷣��>�o�-Q;�R�x:���Б��j�y��g���	�
71�u8ԝm��|����I������������}vCW��n�{��q��kl��M�� 2���c�Sa�>߂?��	&�����NLW�d�L�mU�Zu"7���t��y�g%*�
:��!���FZ�7�z�/y�=L����_�����4i      �      x������ � �      �      x��\�n9���~
"6 ˖�L�Ȏ���3�/��b�@@UQ���BV)N~���}�y�=琬{��ĝ�t�\*���;W���+-�\�''���0��;A B��TF�8V,�Ͳ��aX��sr c��$���j �2i����{��1ÙX(�DlG� K�1T�V&崤�L&)�i��|����]�yc�^�N�&�K���C6�R�TK���H����IL+�U�D�O�ŮC�a&��O�<���*K�ѯ��9fs�C�G��3*�!�5��a�a(���9|58\�=������ ��P� 3�e�Z�@�>gLD�j����P2Y(7iĴ����c|o�S � �'�\�,�l�y�E\ː�+�H��%81�J���{�v��B�"	�U�h'��Md�Ʋ�q�*�U��G�F"Bz�Ip�8M۪ct��BB;+̓��̜
�?�^�*RKI|�e�2�ZdI%��Q���t(Q�H*��Oep�,�X��N27��J�&
)���ˀ���K�h*P���
q�0k��������������I��50�o�WI>o�� �����o�@��v�J�J�~�lW�P��ot3�=�p�H����m��{ꕧW�����/�k��
�� ��_�B�R�������F�h����:r���L;�Φ��( [�*-Sx�Q(M<m��*ήO�2�M`�j:x��`�c3m0$��p(Gtba�@�� ��&��t�@\!Z���I|��a�s�-�	� �ި>��Dۨ�*`��,$$߁A��� �
);��#>��J���I$O���������#6���x8f���x��d�KRiP:�2|p�C��ⓗ��{6f��:go���am&��>�S n��b�v{�c��*��R|��<;�gGA�w\^'_�����$��t���$S1�hW�B�:0Qs@|�I�(�6dmAքLarx��C��1\{�!�/9J�f;��(��% %#��g�G�YM*u�VW��)��'�a�M�#�-�G�� w}v�� �[�X�{��	m��*�
>6VM Q.`�ܐϑ�RaN ��A4��_�A�3D]��EY�O�`��6dՉ���l㦾�"C@��A�$�@��G���%�|��@���Dk�=���e^.*� 0��E���wF����g�B@Q�KS(@Z�_9dJ�Ν6�е�0�z?S��*X��� ��T�C�C�Q����&�W��A�@�&���"B�F;� ���I�*�Pz�İ�=)��@P����10{\@�	J��BT�$��
��@:]Y�~�	��
�Y+�8r����f1���z{'�Q5��i`���^_@p@��	�'�;��t�(3�m#�N��d�び@S����}Y����W�G�hS;�[L1�g��\Z!^�|T4��E�Y�uĽP�t��eʎG)>���Q�����nY��p�h��2������TM�\*%�G��>R�*;0�ͦC[q�n%�Ƒ�A��м~{�n����ut�񊦩��|���A({�Xe�ϙ쳝��ɦ���B����tw�`8:���d�� ���չ0��̾�FQV��Z��7`:OCπ�u�5~y6=�[�Md,)�4~R��]!�9p���F���x���9�/T��` ��g+�����$س�!���� �N��C�n�EX5�ԋ�xOg�K)�q-P�(+�v��(k��H#5l����:��%�.��enU��rb���1	��v�AxUΏ���r�����Q���#ߩ�=gA7����A@�(���R놢'�����B� $l�r�x��l����&Kp�{�'���|/���tmF_�|��ces��|�i���͋w������ӵzz�Zur�O+�|P�&�2`C(��?(��@䄕6vtw�Ie����9L*�m��]'��ኄ_;]�Ku������w��2���鉌���/��Sft��i� �8X�i쵿N�O�hI�*9�W����'�\�_;7n��hHq���k����M�m�`�Ȍ����of=������eEC��Ȅ+�rg��u�\JU�H�7���E̝�l	ǀ�����I�КT�j���B ��1�v�e�%�Y��ʮ �(���I�2�r�;�/"!?׈@�1f��{����+�IA/��++����;n��ϙJ����O=���.����wG��O]�� ���n�<	j[(�tU�[t�g롣�O��I��ࡶ<�z�2�l��B� �.��P��� ��LWٜp=4K� 4>�"P�| �x	����,�9:�$�崦U��E�.����޺�����B
K�Xc�&�JP�?geo���"AO�u�3�-#n��D|���=g��x�r!SԴ��;ǚb��Y�(�7�}-b���-�O0nL���PcO�̔�<Y�J��<���0��&6���X�M�&��V���;���bG�� �b-p��=�{�1��0)`�Esh�Dw7؍�@j+-\᧝=dO�]Cc+ �I�B�y(d����3/�{ ���q��@$�����G|�������Ȥab����k#M֮){�����h�(0��s�&�����N#����<{���m{���`�Jt��vY��̪�7m.���a)���#W�Ѭ^�,X�E$6�m�s�c�w�I��6�B
@.��ͱ良[�6�� �f��BW
�:(��}1p""����ie�&[?C| =F���D��-�Y�(�p�6�����}.��Q��0�Ȣ0SJvX�I	�R1h�l|̢ef�^Y��J�����Tc���U.@�H�s^�-�P����
1n�a�	8���o��*�8sIzdv���橠x8/I7~��[�}�� 4�[�}�3ז�k��=�34����W
g�#�&�O�ƶ��J:�h�$XMlH�Z���P %B��OIt�G �$E��8]U�r�݋*g�/�+�"Ey�,_���	�*����n`�\V��A��E���Ɠ֢�����Cw.T���۬����t2�`/������ίG?��]f���,�h
Bu���X1O��1��g<�r�+^��L�C=��1�*id-��v_�yk�9?���sL���c��6Q�o�K�:}n��d�}yEb���yonp���77���=�^���xz��#���,JE ��\`"�0�A�+�<���a�F�wZTs����H�'� :\_�����zs��_6�OƏrl�i�q�{f2���Ua���Ǹ<�k��E�}+I��ZZ������c��LV6��Q�R6p����Q��[�β�h]� (�:\��n�H�[�����na��t��1(5�s�Bl��}lx�c�@�{�g�)z啰Jk���<�j�BN�<� ����1�����x�,����Z�G9�[�{[w|���y�z��_��g�1٨h�$h�t����N���]����3v@/���x�%Ό�Xw��T㫆P���Gm�&GM@S�G�D#�Ow�fZ�ϟ�"�T���(���?�F��x���~5~���U�`���xG�t���xP�uuu��r��N[l�>i�f���%u^�[,I�d�A�+��oL�'y);���|s�1���\M:�~c9^F*&�g�Hۇ���p�������l�����"1XҼ��s�ed1�C�{�!�6�s��I�~��9D���/Ԧ�V���R�{E�r���{B��!��b:��\��[�yу�	��;�>�`��\�\ͱ�qc\]�$u2�κ"�N�\�;�����veD���Bn5������:�{0�Y�|�$ba���.���=&�4���f�r���["o�
���k"^]x�Wo��$97�X��Q15aǧj|O�d�P�6E�\��2�KKS��xie7ʓz�X�l�R�(��Q�`$="(�|@�/��||W;}��M`v�[r�5�B������eR��H�����m*�/�G���mz�P�Q �  oǢ�ȁ#7����~�0d'�8�����v���g�7/M���l�/O�a2�8h��f�e���Ѵ+F��\O����e�K<=��ݗ��q/Bȇ��?g/���d��0�}�Bm�-���J�װ܀�t٣J�oN����%��V�>��@�i�=u�Z�A��io�2�C�r�7�p�kO�{:/���[�0�h�T�3�v�(Pj-��5(a�q�S�Kn8�m�����x�� ���z5�3a��;�x�]q�g�����n�$+N�>t#��N��������U�y@�9���@ ��!���gz�m�nl���WX���4tߺP��B�ʓ��SpSԑ��yo�ʍ���p�%X1��g�O~ �^�����I[�u�|�l�F�+�P�
��ҘR2�\U}r�$Uk|p�x��\?������O�gO��x2<>��Gl8={>����6�����ѓ�_���"��Ͽ�[=i��v�k�]�/k�B����9I�/V�q��yf���Sk����-��De��JU����R��~WQ�`ӈ�o��;^-帮���`��!)Q˷1�am��#$#�t	�m-������K*�9a�����\�RP)
Kv�߬d�)�q����"��N��+�kbC���kBߦQ7?g�,=�^)c�!����:�J�Y�/*w+����Ԑ�+D8��s-���ER����ک�5�[��^��j$<� kA�wGf����/����ˌ�q���Q����
1HG� ��h��P!ʮ��ҁ��f�?n�:��R��BJ�:�]��.�Gx	�B[tFN�[��^���#��iq�z���v��$��V63�7lf�ٚ�B�꺰¼֍w��4.���$���-���n��B�Y�қw�M&��������@��!_�Ru};'��on�r��ޓ`W��Ȇ��=���%���-� ]P�����4mw(�ԼA��I�kk(�����Z��ԅ<���b����(�*?`�[�l������0��\E�Ƿ��m�m�W2)��T�v�� Q��� 4v;�)Q��3��]	�Q
3�x �^!���^���翎P��K���;�24�)�0-�^�[B����%�����졸G����� ��	��mw`��S)�M�1�ß8����Yn���sFC���f\��7��Je�6w��6M��6��EHq���׀�F�QT�w�c�B�%��)����Qy�]�����)!1P�s>yP]���ϖ\�s���gތA���]��B���GZJg䷶	H%����]�K�.K�c�c�����A���Kۏھ���a�����	�#6��@��;�m�4m���Ŏ�sۏ^���Rk��q��˓�}��;�}����ܱ3ok��d�G!<�';�I�2�s&�B	; ���.��ơW�l �?죊��m��X�N|��h��C��z��I�~�$$덜�J.W_����=>���r>����n+�     