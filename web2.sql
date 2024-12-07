PGDMP  *    :            
    |            web1    15.2    16.4    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            T           1262    160787    web1    DATABASE     {   CREATE DATABASE web1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
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
       public          postgres    false    221            U           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
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
       public          postgres    false    223            V           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
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
       public          postgres    false    219            W           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
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
       public          postgres    false    227            X           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    226            �            1259    160829    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    225            Y           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
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
       public          postgres    false    229            Z           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    228            �            1259    162754    authentication_useractivity    TABLE     �   CREATE TABLE public.authentication_useractivity (
    id integer NOT NULL,
    login_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.authentication_useractivity;
       public         heap    postgres    false            �            1259    162753 "   authentication_useractivity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.authentication_useractivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.authentication_useractivity_id_seq;
       public          postgres    false    254            [           0    0 "   authentication_useractivity_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.authentication_useractivity_id_seq OWNED BY public.authentication_useractivity.id;
          public          postgres    false    253            �            1259    160905    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public          postgres    false    231            \           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
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
       public          postgres    false    217            ]           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
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
       public          postgres    false    215            ^           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
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
       public          postgres    false    233            _           0    0    doc_category_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.doc_category_id_seq OWNED BY public.doc_category.id;
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
       public          postgres    false    241            `           0    0    doc_instruction_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.doc_instruction_id_seq OWNED BY public.doc_instruction.id;
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
       public          postgres    false    243            a           0    0    doc_instruction_tags_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.doc_instruction_tags_id_seq OWNED BY public.doc_instruction_tags.id;
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
       public          postgres    false    235            b           0    0    doc_section_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.doc_section_id_seq OWNED BY public.doc_section.id;
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
       public          postgres    false    239            c           0    0    doc_subcategory_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.doc_subcategory_id_seq OWNED BY public.doc_subcategory.id;
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
       public          postgres    false    248            d           0    0    doc_subtopic_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.doc_subtopic_id_seq OWNED BY public.doc_subtopic.id;
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
       public          postgres    false    237            e           0    0    doc_tag_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.doc_tag_id_seq OWNED BY public.doc_tag.id;
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
       public          postgres    false    245            f           0    0    doc_topic_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.doc_topic_id_seq OWNED BY public.doc_topic.id;
          public          postgres    false    244            �            1259    162698    guardian_groupobjectpermission    TABLE     �   CREATE TABLE public.guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 2   DROP TABLE public.guardian_groupobjectpermission;
       public         heap    postgres    false            �            1259    162697 %   guardian_groupobjectpermission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.guardian_groupobjectpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.guardian_groupobjectpermission_id_seq;
       public          postgres    false    250            g           0    0 %   guardian_groupobjectpermission_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.guardian_groupobjectpermission_id_seq OWNED BY public.guardian_groupobjectpermission.id;
          public          postgres    false    249            �            1259    162705    guardian_userobjectpermission    TABLE     �   CREATE TABLE public.guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);
 1   DROP TABLE public.guardian_userobjectpermission;
       public         heap    postgres    false            �            1259    162704 $   guardian_userobjectpermission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.guardian_userobjectpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.guardian_userobjectpermission_id_seq;
       public          postgres    false    252            h           0    0 $   guardian_userobjectpermission_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.guardian_userobjectpermission_id_seq OWNED BY public.guardian_userobjectpermission.id;
          public          postgres    false    251                        1259    162767    reversion_revision    TABLE     �   CREATE TABLE public.reversion_revision (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    comment text NOT NULL,
    user_id integer
);
 &   DROP TABLE public.reversion_revision;
       public         heap    postgres    false            �            1259    162766    reversion_revision_id_seq    SEQUENCE     �   ALTER TABLE public.reversion_revision ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    256                       1259    162775    reversion_version    TABLE     P  CREATE TABLE public.reversion_version (
    id integer NOT NULL,
    object_id character varying(191) NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    content_type_id integer NOT NULL,
    revision_id integer NOT NULL,
    db character varying(191) NOT NULL
);
 %   DROP TABLE public.reversion_version;
       public         heap    postgres    false                       1259    162774    reversion_version_id_seq    SEQUENCE     �   ALTER TABLE public.reversion_version ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    258            �           2604    160817    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    160826    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    160810    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    160833    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    160842    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    160849    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    162757    authentication_useractivity id    DEFAULT     �   ALTER TABLE ONLY public.authentication_useractivity ALTER COLUMN id SET DEFAULT nextval('public.authentication_useractivity_id_seq'::regclass);
 M   ALTER TABLE public.authentication_useractivity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            �           2604    160908    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    160801    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    160792    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    160938    doc_category id    DEFAULT     r   ALTER TABLE ONLY public.doc_category ALTER COLUMN id SET DEFAULT nextval('public.doc_category_id_seq'::regclass);
 >   ALTER TABLE public.doc_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    160977    doc_instruction id    DEFAULT     x   ALTER TABLE ONLY public.doc_instruction ALTER COLUMN id SET DEFAULT nextval('public.doc_instruction_id_seq'::regclass);
 A   ALTER TABLE public.doc_instruction ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241            �           2604    160987    doc_instruction_tags id    DEFAULT     �   ALTER TABLE ONLY public.doc_instruction_tags ALTER COLUMN id SET DEFAULT nextval('public.doc_instruction_tags_id_seq'::regclass);
 F   ALTER TABLE public.doc_instruction_tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    160948    doc_section id    DEFAULT     p   ALTER TABLE ONLY public.doc_section ALTER COLUMN id SET DEFAULT nextval('public.doc_section_id_seq'::regclass);
 =   ALTER TABLE public.doc_section ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    160969    doc_subcategory id    DEFAULT     x   ALTER TABLE ONLY public.doc_subcategory ALTER COLUMN id SET DEFAULT nextval('public.doc_subcategory_id_seq'::regclass);
 A   ALTER TABLE public.doc_subcategory ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    161102    doc_subtopic id    DEFAULT     r   ALTER TABLE ONLY public.doc_subtopic ALTER COLUMN id SET DEFAULT nextval('public.doc_subtopic_id_seq'::regclass);
 >   ALTER TABLE public.doc_subtopic ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            �           2604    160960 
   doc_tag id    DEFAULT     h   ALTER TABLE ONLY public.doc_tag ALTER COLUMN id SET DEFAULT nextval('public.doc_tag_id_seq'::regclass);
 9   ALTER TABLE public.doc_tag ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    161058    doc_topic id    DEFAULT     l   ALTER TABLE ONLY public.doc_topic ALTER COLUMN id SET DEFAULT nextval('public.doc_topic_id_seq'::regclass);
 ;   ALTER TABLE public.doc_topic ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    162701 !   guardian_groupobjectpermission id    DEFAULT     �   ALTER TABLE ONLY public.guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('public.guardian_groupobjectpermission_id_seq'::regclass);
 P   ALTER TABLE public.guardian_groupobjectpermission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249    250            �           2604    162708     guardian_userobjectpermission id    DEFAULT     �   ALTER TABLE ONLY public.guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('public.guardian_userobjectpermission_id_seq'::regclass);
 O   ALTER TABLE public.guardian_userobjectpermission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            )          0    160814 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    221   !p      +          0    160823    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    223   Yp      '          0    160807    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    219   vp      -          0    160830 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    225   Cs      /          0    160839    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    227   v      1          0    160846    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    229   Kv      J          0    162754    authentication_useractivity 
   TABLE DATA           N   COPY public.authentication_useractivity (id, login_time, user_id) FROM stdin;
    public          postgres    false    254   hv      3          0    160905    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    231   �v      %          0    160798    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    217   w      #          0    160789    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    215   �w      B          0    161089    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    246   {      5          0    160935    doc_category 
   TABLE DATA           y   COPY public.doc_category (id, name, "order", imagem, section_id, content, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    233   ]}      =          0    160974    doc_instruction 
   TABLE DATA           �   COPY public.doc_instruction (id, title, content, created_at, view_count, author_id, category_id, section_id, subcategory_id, subfase, "order", topic_id, subtopic_id) FROM stdin;
    public          postgres    false    241   ,�      ?          0    160984    doc_instruction_tags 
   TABLE DATA           J   COPY public.doc_instruction_tags (id, instruction_id, tag_id) FROM stdin;
    public          postgres    false    243   �      7          0    160945    doc_section 
   TABLE DATA           m   COPY public.doc_section (id, title, content, "order", imagem, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    235   <�      ;          0    160966    doc_subcategory 
   TABLE DATA           �   COPY public.doc_subcategory (id, name, "order", imagem, category_id, section_id, content, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    239         D          0    161099    doc_subtopic 
   TABLE DATA           w   COPY public.doc_subtopic (id, name, content, "order", imagem, topic_id, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    248   ��      9          0    160957    doc_tag 
   TABLE DATA           +   COPY public.doc_tag (id, name) FROM stdin;
    public          postgres    false    237   ��      A          0    161055 	   doc_topic 
   TABLE DATA           �   COPY public.doc_topic (id, name, content, "order", imagem, category_id, section_id, subcategory_id, author_id, created_at, view_count) FROM stdin;
    public          postgres    false    245   �      F          0    162698    guardian_groupobjectpermission 
   TABLE DATA           q   COPY public.guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
    public          postgres    false    250   ��      H          0    162705    guardian_userobjectpermission 
   TABLE DATA           o   COPY public.guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
    public          postgres    false    252   o�      L          0    162767    reversion_revision 
   TABLE DATA           P   COPY public.reversion_revision (id, date_created, comment, user_id) FROM stdin;
    public          postgres    false    256   ��      N          0    162775    reversion_version 
   TABLE DATA           �   COPY public.reversion_version (id, object_id, format, serialized_data, object_repr, content_type_id, revision_id, db) FROM stdin;
    public          postgres    false    258   ��      i           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);
          public          postgres    false    220            j           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    222            k           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);
          public          postgres    false    218            l           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 10, true);
          public          postgres    false    226            m           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 32, true);
          public          postgres    false    224            n           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    228            o           0    0 "   authentication_useractivity_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.authentication_useractivity_id_seq', 8, true);
          public          postgres    false    253            p           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    230            q           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);
          public          postgres    false    216            r           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 36, true);
          public          postgres    false    214            s           0    0    doc_category_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.doc_category_id_seq', 2, true);
          public          postgres    false    232            t           0    0    doc_instruction_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.doc_instruction_id_seq', 15, true);
          public          postgres    false    240            u           0    0    doc_instruction_tags_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.doc_instruction_tags_id_seq', 1, false);
          public          postgres    false    242            v           0    0    doc_section_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.doc_section_id_seq', 1, true);
          public          postgres    false    234            w           0    0    doc_subcategory_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.doc_subcategory_id_seq', 6, true);
          public          postgres    false    238            x           0    0    doc_subtopic_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.doc_subtopic_id_seq', 25, true);
          public          postgres    false    247            y           0    0    doc_tag_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.doc_tag_id_seq', 1, false);
          public          postgres    false    236            z           0    0    doc_topic_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.doc_topic_id_seq', 10, true);
          public          postgres    false    244            {           0    0 %   guardian_groupobjectpermission_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.guardian_groupobjectpermission_id_seq', 54, true);
          public          postgres    false    249            |           0    0 $   guardian_userobjectpermission_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.guardian_userobjectpermission_id_seq', 1, false);
          public          postgres    false    251            }           0    0    reversion_revision_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.reversion_revision_id_seq', 13, true);
          public          postgres    false    255            ~           0    0    reversion_version_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.reversion_version_id_seq', 13, true);
          public          postgres    false    257            �           2606    160932    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    221                       2606    160862 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    223    223                       2606    160828 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    223                        2606    160819    auth_group auth_group_pkey 
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
       public            postgres    false    219                       2606    160844 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    227                       2606    160877 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    227    227                       2606    160835    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    225                       2606    160851 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    229                       2606    160891 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    229    229                       2606    160927     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    225            `           2606    162759 <   authentication_useractivity authentication_useractivity_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.authentication_useractivity
    ADD CONSTRAINT authentication_useractivity_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.authentication_useractivity DROP CONSTRAINT authentication_useractivity_pkey;
       public            postgres    false    254                       2606    160913 &   django_admin_log django_admin_log_pkey 
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
       public            postgres    false    215            I           2606    161095 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    246                       2606    160943 "   doc_category doc_category_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.doc_category
    ADD CONSTRAINT doc_category_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.doc_category DROP CONSTRAINT doc_category_name_key;
       public            postgres    false    233            !           2606    160941    doc_category doc_category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.doc_category
    ADD CONSTRAINT doc_category_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.doc_category DROP CONSTRAINT doc_category_pkey;
       public            postgres    false    233            6           2606    160982 $   doc_instruction doc_instruction_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_pkey;
       public            postgres    false    241            =           2606    161035 M   doc_instruction_tags doc_instruction_tags_instruction_id_tag_id_78eea241_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction_tags
    ADD CONSTRAINT doc_instruction_tags_instruction_id_tag_id_78eea241_uniq UNIQUE (instruction_id, tag_id);
 w   ALTER TABLE ONLY public.doc_instruction_tags DROP CONSTRAINT doc_instruction_tags_instruction_id_tag_id_78eea241_uniq;
       public            postgres    false    243    243            ?           2606    160989 .   doc_instruction_tags doc_instruction_tags_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.doc_instruction_tags
    ADD CONSTRAINT doc_instruction_tags_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.doc_instruction_tags DROP CONSTRAINT doc_instruction_tags_pkey;
       public            postgres    false    243            %           2606    160953    doc_section doc_section_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.doc_section
    ADD CONSTRAINT doc_section_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.doc_section DROP CONSTRAINT doc_section_pkey;
       public            postgres    false    235            (           2606    160955 !   doc_section doc_section_title_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.doc_section
    ADD CONSTRAINT doc_section_title_key UNIQUE (title);
 K   ALTER TABLE ONLY public.doc_section DROP CONSTRAINT doc_section_title_key;
       public            postgres    false    235            1           2606    160972 $   doc_subcategory doc_subcategory_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.doc_subcategory
    ADD CONSTRAINT doc_subcategory_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.doc_subcategory DROP CONSTRAINT doc_subcategory_pkey;
       public            postgres    false    239            M           2606    161107    doc_subtopic doc_subtopic_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.doc_subtopic
    ADD CONSTRAINT doc_subtopic_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.doc_subtopic DROP CONSTRAINT doc_subtopic_pkey;
       public            postgres    false    248            +           2606    160964    doc_tag doc_tag_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.doc_tag
    ADD CONSTRAINT doc_tag_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.doc_tag DROP CONSTRAINT doc_tag_name_key;
       public            postgres    false    237            -           2606    160962    doc_tag doc_tag_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.doc_tag
    ADD CONSTRAINT doc_tag_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.doc_tag DROP CONSTRAINT doc_tag_pkey;
       public            postgres    false    237            D           2606    161063    doc_topic doc_topic_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_pkey;
       public            postgres    false    245            Q           2606    162714 ^   guardian_groupobjectpermission guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);
 �   ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq;
       public            postgres    false    250    250    250            V           2606    162703 B   guardian_groupobjectpermission guardian_groupobjectpermission_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_pkey;
       public            postgres    false    250            Y           2606    162712 ]   guardian_userobjectpermission guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);
 �   ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq;
       public            postgres    false    252    252    252            ]           2606    162710 @   guardian_userobjectpermission guardian_userobjectpermission_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_pkey;
       public            postgres    false    252            d           2606    162773 *   reversion_revision reversion_revision_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.reversion_revision DROP CONSTRAINT reversion_revision_pkey;
       public            postgres    false    256            i           2606    162783 J   reversion_version reversion_version_db_content_type_id_objec_b2c54f65_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_db_content_type_id_objec_b2c54f65_uniq UNIQUE (db, content_type_id, object_id, revision_id);
 t   ALTER TABLE ONLY public.reversion_version DROP CONSTRAINT reversion_version_db_content_type_id_objec_b2c54f65_uniq;
       public            postgres    false    258    258    258    258            k           2606    162781 (   reversion_version reversion_version_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.reversion_version DROP CONSTRAINT reversion_version_pkey;
       public            postgres    false    258            �           1259    160933    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    221                       1259    160873 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    223                       1259    160874 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    223            �           1259    160859 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    219                       1259    160889 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    227                       1259    160888 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    227                       1259    160903 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    229                       1259    160902 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    229            	           1259    160928     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    225            a           1259    162765 ,   authentication_useractivity_user_id_c4774348    INDEX     w   CREATE INDEX authentication_useractivity_user_id_c4774348 ON public.authentication_useractivity USING btree (user_id);
 @   DROP INDEX public.authentication_useractivity_user_id_c4774348;
       public            postgres    false    254                       1259    160924 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    231                       1259    160925 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    231            G           1259    161097 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    246            J           1259    161096 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    246                       1259    162577    doc_category_author_id_14915432    INDEX     ]   CREATE INDEX doc_category_author_id_14915432 ON public.doc_category USING btree (author_id);
 3   DROP INDEX public.doc_category_author_id_14915432;
       public            postgres    false    233                       1259    160995    doc_category_name_e57ef481_like    INDEX     l   CREATE INDEX doc_category_name_e57ef481_like ON public.doc_category USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.doc_category_name_e57ef481_like;
       public            postgres    false    233            "           1259    161048     doc_category_section_id_e277dbaa    INDEX     _   CREATE INDEX doc_category_section_id_e277dbaa ON public.doc_category USING btree (section_id);
 4   DROP INDEX public.doc_category_section_id_e277dbaa;
       public            postgres    false    233            3           1259    161030 "   doc_instruction_author_id_9d326ce1    INDEX     c   CREATE INDEX doc_instruction_author_id_9d326ce1 ON public.doc_instruction USING btree (author_id);
 6   DROP INDEX public.doc_instruction_author_id_9d326ce1;
       public            postgres    false    241            4           1259    161031 $   doc_instruction_category_id_372bba45    INDEX     g   CREATE INDEX doc_instruction_category_id_372bba45 ON public.doc_instruction USING btree (category_id);
 8   DROP INDEX public.doc_instruction_category_id_372bba45;
       public            postgres    false    241            7           1259    161032 #   doc_instruction_section_id_4d31ba3b    INDEX     e   CREATE INDEX doc_instruction_section_id_4d31ba3b ON public.doc_instruction USING btree (section_id);
 7   DROP INDEX public.doc_instruction_section_id_4d31ba3b;
       public            postgres    false    241            8           1259    161033 '   doc_instruction_subcategory_id_3897c6bd    INDEX     m   CREATE INDEX doc_instruction_subcategory_id_3897c6bd ON public.doc_instruction USING btree (subcategory_id);
 ;   DROP INDEX public.doc_instruction_subcategory_id_3897c6bd;
       public            postgres    false    241            9           1259    161119 $   doc_instruction_subtopic_id_0d36bbc0    INDEX     g   CREATE INDEX doc_instruction_subtopic_id_0d36bbc0 ON public.doc_instruction USING btree (subtopic_id);
 8   DROP INDEX public.doc_instruction_subtopic_id_0d36bbc0;
       public            postgres    false    241            ;           1259    161046 ,   doc_instruction_tags_instruction_id_7ffb48dc    INDEX     w   CREATE INDEX doc_instruction_tags_instruction_id_7ffb48dc ON public.doc_instruction_tags USING btree (instruction_id);
 @   DROP INDEX public.doc_instruction_tags_instruction_id_7ffb48dc;
       public            postgres    false    243            @           1259    161047 $   doc_instruction_tags_tag_id_e0683c9e    INDEX     g   CREATE INDEX doc_instruction_tags_tag_id_e0683c9e ON public.doc_instruction_tags USING btree (tag_id);
 8   DROP INDEX public.doc_instruction_tags_tag_id_e0683c9e;
       public            postgres    false    243            :           1259    161088 !   doc_instruction_topic_id_52f83461    INDEX     a   CREATE INDEX doc_instruction_topic_id_52f83461 ON public.doc_instruction USING btree (topic_id);
 5   DROP INDEX public.doc_instruction_topic_id_52f83461;
       public            postgres    false    241            #           1259    162568    doc_section_author_id_49e168bb    INDEX     [   CREATE INDEX doc_section_author_id_49e168bb ON public.doc_section USING btree (author_id);
 2   DROP INDEX public.doc_section_author_id_49e168bb;
       public            postgres    false    235            &           1259    160996    doc_section_title_0a0a84d7_like    INDEX     l   CREATE INDEX doc_section_title_0a0a84d7_like ON public.doc_section USING btree (title varchar_pattern_ops);
 3   DROP INDEX public.doc_section_title_0a0a84d7_like;
       public            postgres    false    235            .           1259    162586 "   doc_subcategory_author_id_f3a72298    INDEX     c   CREATE INDEX doc_subcategory_author_id_f3a72298 ON public.doc_subcategory USING btree (author_id);
 6   DROP INDEX public.doc_subcategory_author_id_f3a72298;
       public            postgres    false    239            /           1259    161008 $   doc_subcategory_category_id_4db416f9    INDEX     g   CREATE INDEX doc_subcategory_category_id_4db416f9 ON public.doc_subcategory USING btree (category_id);
 8   DROP INDEX public.doc_subcategory_category_id_4db416f9;
       public            postgres    false    239            2           1259    161009 #   doc_subcategory_section_id_6a27e72c    INDEX     e   CREATE INDEX doc_subcategory_section_id_6a27e72c ON public.doc_subcategory USING btree (section_id);
 7   DROP INDEX public.doc_subcategory_section_id_6a27e72c;
       public            postgres    false    239            K           1259    162604    doc_subtopic_author_id_e9fe6f8c    INDEX     ]   CREATE INDEX doc_subtopic_author_id_e9fe6f8c ON public.doc_subtopic USING btree (author_id);
 3   DROP INDEX public.doc_subtopic_author_id_e9fe6f8c;
       public            postgres    false    248            N           1259    161113    doc_subtopic_topic_id_ab0394bc    INDEX     [   CREATE INDEX doc_subtopic_topic_id_ab0394bc ON public.doc_subtopic USING btree (topic_id);
 2   DROP INDEX public.doc_subtopic_topic_id_ab0394bc;
       public            postgres    false    248            )           1259    160997    doc_tag_name_d4b3bfd4_like    INDEX     b   CREATE INDEX doc_tag_name_d4b3bfd4_like ON public.doc_tag USING btree (name varchar_pattern_ops);
 .   DROP INDEX public.doc_tag_name_d4b3bfd4_like;
       public            postgres    false    237            A           1259    162595    doc_topic_author_id_64cda73d    INDEX     W   CREATE INDEX doc_topic_author_id_64cda73d ON public.doc_topic USING btree (author_id);
 0   DROP INDEX public.doc_topic_author_id_64cda73d;
       public            postgres    false    245            B           1259    161085    doc_topic_category_id_b26febbd    INDEX     [   CREATE INDEX doc_topic_category_id_b26febbd ON public.doc_topic USING btree (category_id);
 2   DROP INDEX public.doc_topic_category_id_b26febbd;
       public            postgres    false    245            E           1259    161086    doc_topic_section_id_88060ef4    INDEX     Y   CREATE INDEX doc_topic_section_id_88060ef4 ON public.doc_topic USING btree (section_id);
 1   DROP INDEX public.doc_topic_section_id_88060ef4;
       public            postgres    false    245            F           1259    161087 !   doc_topic_subcategory_id_403e45a2    INDEX     a   CREATE INDEX doc_topic_subcategory_id_403e45a2 ON public.doc_topic USING btree (subcategory_id);
 5   DROP INDEX public.doc_topic_subcategory_id_403e45a2;
       public            postgres    false    245            O           1259    162751    guardian_gr_content_ae6aec_idx    INDEX        CREATE INDEX guardian_gr_content_ae6aec_idx ON public.guardian_groupobjectpermission USING btree (content_type_id, object_pk);
 2   DROP INDEX public.guardian_gr_content_ae6aec_idx;
       public            postgres    false    250    250            R           1259    162730 7   guardian_groupobjectpermission_content_type_id_7ade36b8    INDEX     �   CREATE INDEX guardian_groupobjectpermission_content_type_id_7ade36b8 ON public.guardian_groupobjectpermission USING btree (content_type_id);
 K   DROP INDEX public.guardian_groupobjectpermission_content_type_id_7ade36b8;
       public            postgres    false    250            S           1259    162731 0   guardian_groupobjectpermission_group_id_4bbbfb62    INDEX        CREATE INDEX guardian_groupobjectpermission_group_id_4bbbfb62 ON public.guardian_groupobjectpermission USING btree (group_id);
 D   DROP INDEX public.guardian_groupobjectpermission_group_id_4bbbfb62;
       public            postgres    false    250            T           1259    162732 5   guardian_groupobjectpermission_permission_id_36572738    INDEX     �   CREATE INDEX guardian_groupobjectpermission_permission_id_36572738 ON public.guardian_groupobjectpermission USING btree (permission_id);
 I   DROP INDEX public.guardian_groupobjectpermission_permission_id_36572738;
       public            postgres    false    250            W           1259    162752    guardian_us_content_179ed2_idx    INDEX     ~   CREATE INDEX guardian_us_content_179ed2_idx ON public.guardian_userobjectpermission USING btree (content_type_id, object_pk);
 2   DROP INDEX public.guardian_us_content_179ed2_idx;
       public            postgres    false    252    252            Z           1259    162748 6   guardian_userobjectpermission_content_type_id_2e892405    INDEX     �   CREATE INDEX guardian_userobjectpermission_content_type_id_2e892405 ON public.guardian_userobjectpermission USING btree (content_type_id);
 J   DROP INDEX public.guardian_userobjectpermission_content_type_id_2e892405;
       public            postgres    false    252            [           1259    162749 4   guardian_userobjectpermission_permission_id_71807bfc    INDEX     �   CREATE INDEX guardian_userobjectpermission_permission_id_71807bfc ON public.guardian_userobjectpermission USING btree (permission_id);
 H   DROP INDEX public.guardian_userobjectpermission_permission_id_71807bfc;
       public            postgres    false    252            ^           1259    162750 .   guardian_userobjectpermission_user_id_d5c1e964    INDEX     {   CREATE INDEX guardian_userobjectpermission_user_id_d5c1e964 ON public.guardian_userobjectpermission USING btree (user_id);
 B   DROP INDEX public.guardian_userobjectpermission_user_id_d5c1e964;
       public            postgres    false    252            b           1259    162789 (   reversion_revision_date_created_96f7c20c    INDEX     o   CREATE INDEX reversion_revision_date_created_96f7c20c ON public.reversion_revision USING btree (date_created);
 <   DROP INDEX public.reversion_revision_date_created_96f7c20c;
       public            postgres    false    256            e           1259    162790 #   reversion_revision_user_id_17095f45    INDEX     e   CREATE INDEX reversion_revision_user_id_17095f45 ON public.reversion_revision USING btree (user_id);
 7   DROP INDEX public.reversion_revision_user_id_17095f45;
       public            postgres    false    256            f           1259    162803    reversion_v_content_f95daf_idx    INDEX     k   CREATE INDEX reversion_v_content_f95daf_idx ON public.reversion_version USING btree (content_type_id, db);
 2   DROP INDEX public.reversion_v_content_f95daf_idx;
       public            postgres    false    258    258            g           1259    162801 *   reversion_version_content_type_id_7d0ff25c    INDEX     s   CREATE INDEX reversion_version_content_type_id_7d0ff25c ON public.reversion_version USING btree (content_type_id);
 >   DROP INDEX public.reversion_version_content_type_id_7d0ff25c;
       public            postgres    false    258            l           1259    162802 &   reversion_version_revision_id_af9f6a9d    INDEX     k   CREATE INDEX reversion_version_revision_id_af9f6a9d ON public.reversion_version USING btree (revision_id);
 :   DROP INDEX public.reversion_version_revision_id_af9f6a9d;
       public            postgres    false    258            n           2606    160868 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    219    3323    223            o           2606    160863 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    223    221    3328            m           2606    160854 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    217    219    3318            p           2606    160883 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    3328    221    227            q           2606    160878 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    227    225    3336            r           2606    160897 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    229    219    3323            s           2606    160892 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    225    3336    229            �           2606    162760 X   authentication_useractivity authentication_useractivity_user_id_c4774348_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_useractivity
    ADD CONSTRAINT authentication_useractivity_user_id_c4774348_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.authentication_useractivity DROP CONSTRAINT authentication_useractivity_user_id_c4774348_fk_auth_user_id;
       public          postgres    false    225    3336    254            t           2606    160914 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    231    217    3318            u           2606    160919 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    3336    225    231            v           2606    162569 <   doc_category doc_category_author_id_14915432_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_category
    ADD CONSTRAINT doc_category_author_id_14915432_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.doc_category DROP CONSTRAINT doc_category_author_id_14915432_fk_auth_user_id;
       public          postgres    false    3336    233    225            w           2606    160990 ?   doc_category doc_category_section_id_e277dbaa_fk_doc_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_category
    ADD CONSTRAINT doc_category_section_id_e277dbaa_fk_doc_section_id FOREIGN KEY (section_id) REFERENCES public.doc_section(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.doc_category DROP CONSTRAINT doc_category_section_id_e277dbaa_fk_doc_section_id;
       public          postgres    false    235    3365    233            |           2606    161010 B   doc_instruction doc_instruction_author_id_9d326ce1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_author_id_9d326ce1_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_author_id_9d326ce1_fk_auth_user_id;
       public          postgres    false    225    241    3336            }           2606    161015 G   doc_instruction doc_instruction_category_id_372bba45_fk_doc_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_category_id_372bba45_fk_doc_category_id FOREIGN KEY (category_id) REFERENCES public.doc_category(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_category_id_372bba45_fk_doc_category_id;
       public          postgres    false    241    233    3361            ~           2606    161020 E   doc_instruction doc_instruction_section_id_4d31ba3b_fk_doc_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_section_id_4d31ba3b_fk_doc_section_id FOREIGN KEY (section_id) REFERENCES public.doc_section(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_section_id_4d31ba3b_fk_doc_section_id;
       public          postgres    false    235    3365    241                       2606    161025 M   doc_instruction doc_instruction_subcategory_id_3897c6bd_fk_doc_subcategory_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_subcategory_id_3897c6bd_fk_doc_subcategory_id FOREIGN KEY (subcategory_id) REFERENCES public.doc_subcategory(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_subcategory_id_3897c6bd_fk_doc_subcategory_id;
       public          postgres    false    239    3377    241            �           2606    161114 G   doc_instruction doc_instruction_subtopic_id_0d36bbc0_fk_doc_subtopic_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_subtopic_id_0d36bbc0_fk_doc_subtopic_id FOREIGN KEY (subtopic_id) REFERENCES public.doc_subtopic(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_subtopic_id_0d36bbc0_fk_doc_subtopic_id;
       public          postgres    false    248    241    3405            �           2606    161036 N   doc_instruction_tags doc_instruction_tags_instruction_id_7ffb48dc_fk_doc_instr    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction_tags
    ADD CONSTRAINT doc_instruction_tags_instruction_id_7ffb48dc_fk_doc_instr FOREIGN KEY (instruction_id) REFERENCES public.doc_instruction(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.doc_instruction_tags DROP CONSTRAINT doc_instruction_tags_instruction_id_7ffb48dc_fk_doc_instr;
       public          postgres    false    243    3382    241            �           2606    161041 G   doc_instruction_tags doc_instruction_tags_tag_id_e0683c9e_fk_doc_tag_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction_tags
    ADD CONSTRAINT doc_instruction_tags_tag_id_e0683c9e_fk_doc_tag_id FOREIGN KEY (tag_id) REFERENCES public.doc_tag(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.doc_instruction_tags DROP CONSTRAINT doc_instruction_tags_tag_id_e0683c9e_fk_doc_tag_id;
       public          postgres    false    243    237    3373            �           2606    161065 A   doc_instruction doc_instruction_topic_id_52f83461_fk_doc_topic_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_instruction
    ADD CONSTRAINT doc_instruction_topic_id_52f83461_fk_doc_topic_id FOREIGN KEY (topic_id) REFERENCES public.doc_topic(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.doc_instruction DROP CONSTRAINT doc_instruction_topic_id_52f83461_fk_doc_topic_id;
       public          postgres    false    3396    245    241            x           2606    162560 :   doc_section doc_section_author_id_49e168bb_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_section
    ADD CONSTRAINT doc_section_author_id_49e168bb_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.doc_section DROP CONSTRAINT doc_section_author_id_49e168bb_fk_auth_user_id;
       public          postgres    false    235    3336    225            y           2606    162578 B   doc_subcategory doc_subcategory_author_id_f3a72298_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subcategory
    ADD CONSTRAINT doc_subcategory_author_id_f3a72298_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.doc_subcategory DROP CONSTRAINT doc_subcategory_author_id_f3a72298_fk_auth_user_id;
       public          postgres    false    3336    239    225            z           2606    160998 G   doc_subcategory doc_subcategory_category_id_4db416f9_fk_doc_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subcategory
    ADD CONSTRAINT doc_subcategory_category_id_4db416f9_fk_doc_category_id FOREIGN KEY (category_id) REFERENCES public.doc_category(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.doc_subcategory DROP CONSTRAINT doc_subcategory_category_id_4db416f9_fk_doc_category_id;
       public          postgres    false    233    239    3361            {           2606    161003 E   doc_subcategory doc_subcategory_section_id_6a27e72c_fk_doc_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subcategory
    ADD CONSTRAINT doc_subcategory_section_id_6a27e72c_fk_doc_section_id FOREIGN KEY (section_id) REFERENCES public.doc_section(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.doc_subcategory DROP CONSTRAINT doc_subcategory_section_id_6a27e72c_fk_doc_section_id;
       public          postgres    false    239    3365    235            �           2606    162596 <   doc_subtopic doc_subtopic_author_id_e9fe6f8c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subtopic
    ADD CONSTRAINT doc_subtopic_author_id_e9fe6f8c_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.doc_subtopic DROP CONSTRAINT doc_subtopic_author_id_e9fe6f8c_fk_auth_user_id;
       public          postgres    false    248    3336    225            �           2606    161108 ;   doc_subtopic doc_subtopic_topic_id_ab0394bc_fk_doc_topic_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_subtopic
    ADD CONSTRAINT doc_subtopic_topic_id_ab0394bc_fk_doc_topic_id FOREIGN KEY (topic_id) REFERENCES public.doc_topic(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.doc_subtopic DROP CONSTRAINT doc_subtopic_topic_id_ab0394bc_fk_doc_topic_id;
       public          postgres    false    248    245    3396            �           2606    162587 6   doc_topic doc_topic_author_id_64cda73d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_author_id_64cda73d_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_author_id_64cda73d_fk_auth_user_id;
       public          postgres    false    225    245    3336            �           2606    161070 ;   doc_topic doc_topic_category_id_b26febbd_fk_doc_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_category_id_b26febbd_fk_doc_category_id FOREIGN KEY (category_id) REFERENCES public.doc_category(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_category_id_b26febbd_fk_doc_category_id;
       public          postgres    false    245    3361    233            �           2606    161075 9   doc_topic doc_topic_section_id_88060ef4_fk_doc_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_section_id_88060ef4_fk_doc_section_id FOREIGN KEY (section_id) REFERENCES public.doc_section(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_section_id_88060ef4_fk_doc_section_id;
       public          postgres    false    3365    245    235            �           2606    161080 A   doc_topic doc_topic_subcategory_id_403e45a2_fk_doc_subcategory_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.doc_topic
    ADD CONSTRAINT doc_topic_subcategory_id_403e45a2_fk_doc_subcategory_id FOREIGN KEY (subcategory_id) REFERENCES public.doc_subcategory(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.doc_topic DROP CONSTRAINT doc_topic_subcategory_id_403e45a2_fk_doc_subcategory_id;
       public          postgres    false    239    245    3377            �           2606    162715 Y   guardian_groupobjectpermission guardian_groupobject_content_type_id_7ade36b8_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_content_type_id_7ade36b8_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobject_content_type_id_7ade36b8_fk_django_co;
       public          postgres    false    3318    250    217            �           2606    162720 R   guardian_groupobjectpermission guardian_groupobject_group_id_4bbbfb62_fk_auth_grou    FK CONSTRAINT     �   ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_group_id_4bbbfb62_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobject_group_id_4bbbfb62_fk_auth_grou;
       public          postgres    false    3328    221    250            �           2606    162725 W   guardian_groupobjectpermission guardian_groupobject_permission_id_36572738_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_permission_id_36572738_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobject_permission_id_36572738_fk_auth_perm;
       public          postgres    false    250    219    3323            �           2606    162733 X   guardian_userobjectpermission guardian_userobjectp_content_type_id_2e892405_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_content_type_id_2e892405_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectp_content_type_id_2e892405_fk_django_co;
       public          postgres    false    3318    217    252            �           2606    162738 V   guardian_userobjectpermission guardian_userobjectp_permission_id_71807bfc_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_permission_id_71807bfc_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectp_permission_id_71807bfc_fk_auth_perm;
       public          postgres    false    3323    252    219            �           2606    162743 \   guardian_userobjectpermission guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id;
       public          postgres    false    3336    225    252            �           2606    162784 F   reversion_revision reversion_revision_user_id_17095f45_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reversion_revision
    ADD CONSTRAINT reversion_revision_user_id_17095f45_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.reversion_revision DROP CONSTRAINT reversion_revision_user_id_17095f45_fk_auth_user_id;
       public          postgres    false    225    256    3336            �           2606    162791 I   reversion_version reversion_version_content_type_id_7d0ff25c_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_content_type_id_7d0ff25c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.reversion_version DROP CONSTRAINT reversion_version_content_type_id_7d0ff25c_fk_django_co;
       public          postgres    false    258    3318    217            �           2606    162796 Q   reversion_version reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id FOREIGN KEY (revision_id) REFERENCES public.reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.reversion_version DROP CONSTRAINT reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id;
       public          postgres    false    258    3428    256            )   (   x�3��,�,I�+I�2�t��+)�L*�L�/����� �\	�      +      x������ � �      '   �  x�}�[��@���UdU�[��n�R�IPJu
�Tg�%���Mޘ��_�1�����r�}�]���W�e�sY�2䄜5��uoXxi?�ك�e`I�k�:�aP��n�����n賜��F�Q�E���X��$:�4wR��q�߲��w�{��K���"r�MJH��Up��1+I��3����@�� �3P��b���xГ�C?/Y��_�6�H�l=wB<��,�B]+^�!��M�&����zj9�5	�U�]�#:s�n��Sj� R��U�����4Ác(ː�2*OAW� ��)�K���<?�%V�
���*1+���U�4V���I��j��kv"5�W(\��MT��U:��t2C���N%�U�t��P-�M���P�*_�)"Ȼ*_�)4��P�+�c��Uy�O�x�hF~�a+���W��v���/���I�c���֝���=-B�@��ef\�+�R����o��0�B)��T�U��DWYV�R,d��\J�P�4 v���9pJ�҆[a`U�Q޸�9�����e[/�vo|ش�z��|Τ��_�@���:����[��_�����QCg����w��Qh�vzt��4�z���|si���K��#�W�_�Օ������c����<�:Ԯ��F�W I�j$�ȑB��Ex�#3<e�= H�)�^�D�r� E���[��      -   �  x��S�n�@�Ƨ�&�5�s`f���Rk�(6M6���E��/��nڸ���L2���τln]���sDhWf�9�:O^��!*�I�%<+��=���ҍ�I8yD�=�m=��>B���e}��zC��Z�^Ƃ+x�6H�",B�<�qq�}�bD�&��_�� �n ���
**Ī�D�)�o � �[�&�3��n����b�v���L��jhW'�ϨZ�&u����7��!HA�*�A�Ȩ��_�@���.Ҡ_y�>��y:d��g����de�s��i�:哑ַ�AQsD�==|1|��P9�^|����
��E�pK�\�8+�֟�uj(vl��]�S՝K�#ZT`�|;�Io���h&'�u�V_�f����>����W ������a(��o�iÿ��9w9��_��H*a"&(��ܴ��{o��-���,��]%�G����'fo7{C�6r�Rv����z'��1}W����i��<Dfm���g>�����o)�r(�(7H���J����Fg%�r�q�r�˃����%���cfo��ЎN`����H���ь�2W���Ҡo�7�s�ULU�)��P�9�
�7�fF�s*R� ���H��C� �
C�=2/��
I�Ż��>4���&�W����-�Kł��7)[E殌�//�
������]� ��;�����eK�      /   ,   x�3�4�4�2�4��&@҂Ӕӈ˒�Hp��=... p!/      1      x������ � �      J   �   x�e���@�3S`�{���_G�(�ܟ��MX� ����mA̞~�nrhxs�u
��EO|2�&f+ڍ*�JNß"�@Z�����^E��L�Z�'rG5�\�2����>I4J�/c�#�1�      3      x������ � �      %   �   x�eO��0;'��l����Jk�6����kyL�ر�X�'v������I�0S�8F�O�����
R��g0�I��:S��@�⎟;�����9}���l�kA�-�c=��+U�P좄T���?�Au�X޸�tY���9gWI���ʿ�Rz�:���L�����:�Pش���������_�+{s      #   #  x���[r�0E��*���ԭ7k�*��(U�d���p9?��=j�~Ůk����1�c\��C��w`�h6`JaK)��r��;�oX�q�|�������u�Z���J'��H�5ݞ�?.�Cw
���uH+Lb��_�s~7�]�>�w�Ϯޑ�,�!�ԃ]8Gs~����CXGq��Ӌ{�|3��!�O%�;�oׄvO_���12�̂�g���#|ݼ�iTv�.qMI�Nw��#�H����f4���5�ll��\j�E��BQ���X����K�=�3�����PN��+?t�Ϲ1v�B�����+a����̪;�l�Zg�A, �`ѯH��i9���Q�؍�_b���Ԃ7ɡ������*�'�X��)[���Vu����՘Q������-�������>�ʁ��*6��d"�Y��~��4�����[؀"�0����ځ�b]̹`�[g��G|�.�2�Sܼ��97/�2��v��b>S�+ݱ�]$v�X+��ZP(��C9K��C�rd%WyK��j�H�rsuK ���$�w��5����r
W�b�(��b[2��@�Ź�R{܉܉�SWӭ碢�x�{�,�L+9l>��X�;�d)lCb�%>���|G-��he����&��7Li�e��[�c�}�j��lI&7@�A��4y5�Q��������$ T��Ad����욂'ٓ(Ԇ�2�����}�e�)�~��_��?C�S��ed �/�%�5�Cd���a�������}�6�Yᾭ\�w�m�b�������?�Rv�      B   6  x���Y��@  ���}M-��(�4�,.�İ/��~������Iߤy����2�rя��!<j>���*>P�PUs�er��
��}���n�!nq&�x����w<��ܑ�����7�lsr���~q����w�u�q�7b�`'tτ���,�����f�����ؑ�Z�Y4HO8)�n��9&9��o�^��{�!5ł,����(��]�d<i���[�5��>;7�����}����Kԙ| ��%�K�~BV�@b�0��K�\��!G��Lq��ς�
i9��V���`Wj��loɗq6�aQ���E�:�8y=��^S�C�'�#�x ~�"!A��29�s����<
U��3�y�S!�u|�wee~���_�KO��Q�-�DAE��9����̆e�#�͑�N��A���s��R������ߏ8)CK0w�u�����P�����^���[nz�r1T��w�|9�:5�דib'�����RI���2y�оs;R���ۦ�`���U}��e��#���d$VX!�"�s�k�X,~��
      5   �
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
�<^sg�+Fȇ-9����!_�0p�f:-�ĺb�K�u��9Lh�Gk�$q�#�s�~��������[폻qiB���ǥ��q[�E�(�����}?�N�ާ���`x|�yG�k6������睜x�G��{�W�z�^����)>      =      x��\�nG��-?EB$��I-�@���,R+�``��]�l�TUY���p�O���k��/6��uW����	$�󌌌㋈���%������9;
�ւ����B�,QL�w"I����r~h�ly��e�|��2���^�&������;���X2j��fE��p�{Y*��,,&�����;�;���*V#橐%�B$[��<�$�f�0Vɂ��P"�xz���ί�ŝ�hr0�+K\��\e���Em+����˫��&*Z��9��O&�}k�2��[ú��G�J��[��*�as�oD'�-��2�����~T�|����b�p�������S��0D�7���{z�C��:�Z��=o-�w	�=�@3�8q=��G\��_�$�^�D���N���0��_��`��b��,��`>��=��Mgl�l1{���ϟ>��{�h��`�`F��=��������f{�W�m"�K��'"�k��V;�̕Jii�]�yp���2L\n�P�>�xՎxă>׌2�4����f�.QqV*	���9�k�k{�q�]���C-ӌ{\��bȵ���r,"�9	�:��=�#�ep�1ި�����c�8��Cq?��O/�|'/�n�Ƈ�X��T'Ӟ�.���m���z�{%Ͱ��A@���~������lz)�o��?��w��������a*��G(Zx������x�&�e�.���t:�e:��l:�ϼe��Q?/�t�����N���e��_�zFl;u���G�j�?�~f�1`E��%
#��<Yg	��̄��@�����a͟$�]��^y��d�P�!�\�a�z�<�L9�mf��[��x�6W���~/d��`rPg�M�8d`H��5ԑ��f��x �� _�t�FP�߫D�<�/�`����2�Pc��5_qy>P_�h���HxB���!�����Ј3�qҿ�H3_�ܷ����0a�~R�0�5|�\�qE�ݑ8�۽jt����T�}Å�Pi7T��w�tUyv-	75�|U���@"���P���I�3��p�~�.��ѵ�»Lw�3A���]�{�V�Ն�|��Л!��.ƹ�k{�N~�I���֣} �ּ�8+JOq]Ț�HT4V�\���m�H%�\K�㩪W��i2p�q��m�J�W�NcOt�2X���Q&�]m	��/yG��7/��UmB"���&�U�h���薥���vZP�u ���Eģ��Z���G؀8Y-M��dB_?
�fk���F�B�5����78h�54�m��w[��ܼD�JJ���O
YE�����nnс�ܑ9�������'�El?d��A����Ct�U��:[0�-���|��wj���d�e��)Gٸ�"+��ī�3b_E��N�Y�b��G�U��+�;������~�T�<����Pl4�ha��\�>�~M3h.͟�����\O�X^�>|4���_��c��s���41Q˻��Z����t*/�!��ǣbl��3�S�[��#ӂ��E�x�,F�)ڼ���uM_Q����T�#9�@�	<�O*\`�(Y�}t��B%�E�5V��*1]yBXu$�K����WXzR\�*w\��F�6A��9:;����㳱�zl�v���Pv墟��=�Og�Q�Gx�5[�RD5BJ�J$VCŮ�L-C�b���e���26jLk�U��sha�	M��DDx]}`'q8s<N���W���Λ��D?s��E9w&
(���IL�e/)ㆉH~{tT�1{��Y��-�S�V=��t1���vw����c���a����0�����#���2�H�9�U��3.ҮqN'�dG�����o�e/���	ͽ����?�M����Dk	� ��-�^PASh�ᕋ�x��f��y>�XD�za��%���X���H���AK�|��2�xM[�E�@2�SN�*Jm]nT7�)Mp�?��J�ΰ�V	{*�4~2
_�Z0�O�m�vs;Ј�2P���%\qͬ��t�T �ZI�2�e��%Ń����<4p|8!���h��u�����œ�4��TE� ���A�����r}�l�׳�ޓ�����n3���ݾ�K�-������8M�[	���^AZ�����Ve�&��c_2�|$�F��:fj$aJ�)�P:Q�q#hc���	&�4Ⱥ� �V;�� ��X+�[ �C�M`)������m�{s��,Ѫ>�;؇��$)�k#�i 2�sS'S7Oޞ�ֵoӧ��� 6�{i���"�u
Fp�J�4���M#���
ɂ?;�?RI�Z�I�����̔��:93E�J�ҩ���#y)	Z����]�h卼ۦ9�<��s��\����l�5yF|����S��-H�[��w��3�� ������ Sn���w�����%�Mv읾o�u_��s�c8v�t��i�����ʰ|Ӱ�=��-J��!�mO]���@�^??�}�5��/���b�,�sX�[�"���w�^·p��q{�H����@�I9�g�{�VYx��3���6=��
L!��<�*�BAk�G�!��ӯU1{���ù��G�S[�?�	�Հ�C�)������z<�ů�(��m%�7���V��xuak�j�
[�&e�%�hq����G����[�"�͖)F�G��j�R�c<�-`�n&�o��6Џ�gp,СL�V	�h��k]�q��n3�o)��M�c�g`�1�� �5G��p��i�i �}!�#���s�6N�i�ȝ��î8�k�̃1�O˝:s��f/!"a��<�
@���(�o$E�<:���\���,G���.χƾ?	���y��#�#]VRWB��_�\s��<��rc:5��K;�{'�>\�߀��7]���0�d��Ȩ�K`%2�0s��$��`��_�$m�6���7��y� ]U�#xv}n���bO�a�����l�!	T-.ji�r�Z����6g�]&�����i/&0�@a��g����'����񋓳��<=��g^*U4��:�����P"�><�+�hx(��p��L��a���jRnã
]�6��W�]�A�jT�>���T��hњ�|��湥& �0u�n&Gk�4v)�
E���S�A�#^��Vw��0���*�wW�J��nH��[�����Owwa��	K̺�G.����]��`��XJ���	w�(k�<�����C|�X,|�A�]�ܫ;��4�t�ɴ���|C���[-A�����@)���>��SX�4%�� ��N��f�3ж?��]�f�S�\���}��|p��\�_#p���Jy�#�`�u��/1��l��x�vn���Z/]��ng{�!�?�|�c2���[6,�pUjIO�P�ߟKi9������o^���å6�A��CY���`�q��GW>��5�]I�OqՖUj gIU�r0G�@�_�2�v~u� �Í��b58%X߸h4B��� k���2ר�P���B[G�r;��5��
��k��~�l����S�f���2pQhd�S�~���j�������Jۧ���n�����s&j��;І�W��m��	�����F_�\��k"߹�?n%�	qO�{B��V��	�?����<���琤@�-GI�`ʡ�&���؊���H���@�M�2� ��5�l���E�/*-Õ
�ڪi�j�+́���/�縏���������K�³/M*�qHO�z3�⍿DƷ�w��
q��}�깣W��v\fd�.�6���/u���2K��y�0	y�`@F�,>o�!&\��K�U �U��@X�;�6�
<�	�a��zz�oB�n-��Q��S`�.dͶ"6��K.��[̡hPڕ��bT�s�W���|�}� /�/sP>���=&�%�BZ�3�L�h��ݵ��Q��h���Mɤ��!#����L6btk����`En�S��P�|�Μ JKG8�(��G���%Zv!�i�;9�Cx/<5`�e �  j1O��I��:���]7��J�T��q���~�\�~_��X'�?b�Q���Z��*���������T����o�|�D��`A�-���0d��c���t���)3�
�7&�~\�63�/:{���� PMַ��`\G��s����7�Ͼ�Ҩ� �㧰���i^������8[[�ax7g3�}�IF�
D
"�`l<N/�y� �6�u[۞`�)f��[�1N��u�&�Q-n4���[�Ej�o�I� b��Ű]&��҈̗u��]��~g1�e�ق*�L�|�a)#|�K�R��V��l�(ё�r�n�F��t;����|��Q�?�-�o7�q��o�RezX�G��t64�NO7�i"��2�LK�5��%9S��u�d��q��4���x�)��
��^ cq�����@?�:�@��� �\R���:�C�6�G�á�n`�_������Θ��z&͎F�[�YZ�i�v�:g�j�T	�T5AA����8kP��yP�v%��H��\e�So���;�V�w��Q�]�d�>��.w�W� 47�1�G&��g��L'�6%N��� �����I~q,�M]V-ھ�=׆R�|���^���já���&<zN�5���p&?��X[��L��ʍ�@6��r�XaʀVAJ�@.�<#��
o�Ӗ�턅˯�uS�D�<�� ��q���	W�6CX�S:�szr�Sh=ƌ������|�x������Y�����nwX�k���_=�_3���a��!l�����:�x�ͬ�s�1������}^W�\�����VY�{\}X��K���Z�K���=����^#��d�/�c�j�t����`)�$E��;�?,��=s�i������oC��3F:I�%v|jh������_�����y�-�:\#�)�����E��y���TaSс�����d�%%�nbI�
�n>jS��C'�%,�%l��m�*ѣ� F���Te�w�T@g�᧴(���*rc����F|v՘9�,])
+�kO��
J=j��Nl����{h׍��Z��.�ݏ�qcʐ'^�p�t���E�aV+.�,��u6 �cB��"�׊��r�8&+]���Ny72���S��֪&Z��k �׻ M8�(̀�T1P����!71��V�ć/���x	n��<@aS�(]�����R�)=*���"n8�O��tw�l�I#��O��������Q�ci      ?      x������ � �      7   v   x�3�t��-H���LTHIU(�O)=����|�?N������������Լb��<D�������4�<���'�U� /�����D��P��X��������@������\���Ӏ+F��� _�#      ;      x��\�n9��m?��@���ч� ��jѲ��l,�nX�T�3�i2���`�f�̋mD�H�U�������xJ�L2�㋃u��:��K{�|���b�o>��a�E�+�T�os��(�^�U"�Q��ح�����������iY,_�࿧������9L�ُ�Xq��N���I�����d��W�tF��*���x���'L{`yvs�F�qQ�+E4�L����*��"*��Z0#4[p#8.8&��+�a%�;<�:y��J�@��g2��id�Ȓg�(*T���)��J�J$g�22�����t��w�����	�"�ͬa��V��,��}���^p]q��J�o?ʄ�{�_8�&e�J-*N�NpK<Q6��|#Űao�qXv�5lfS�]��;���%�Mk���\�<}V4�:��R����1�M�Φ�-�5��y_6X��Ҳ'z�Z��k�d@�=$dD�S<�(^�Qp�J3�$�2S�T�g;�kU�B��2^�|GXNUZ&ꄝ���TiG���/������T�Y�y&��O�P�;-@X;:Tg�su�ɳ+����wc��t�oF�9�p�D^�Θ����1ސ ���J�B�a�{~UG�}��u�t���I�ǆjZEbB�H�s�����à+T���>)���_��p�:p<���r��J�ǿ~���Ҝ��-e��SXb/5K:%y��W)�Wg��3��nY���7�{�����c;����@�,���"c̄t�4��= �2^�.�?�J���#�U-��}�9�{�h�P5P��su��Զ=�f�,�%8�Μ�DF����#��%��.��TBzˏ��JF�TVI���\K�z���[�k8�zgS�Tej)�˹L��K�ۜ-��g'���S��s`G��P� iu���:A�yB��p�F.d&�,)�"�4 ���2�,G������8�ghz��}�,'e!�k�s���QJ��g�6<��#8�\X��~*�4o�.��T,��̦�tT�z0%��r�w����{8ߟ���g�O���3�=i���H�@Ba���"��`ω[�+Syc��ⵐ�ﾗ0
�X� ���� �V"�Mb��
ƫ���,�;��w�Q
���p�Ɣ�0%�O`]�F�Y8s
��&�
{��<5<�� U#�%�Z�/��\K�)�e5���rxF�DK8��$Y�*��2�j L���#�
����
D1D;��Z_�N��L�\��`,
t�-ul���.�wo1Ӭ���XZp�e;�N��ayer9$p� ;�=�Jj��M;Wn3<�W0Zu6��f�@l�hO� ����E�}�r�ԏO���DJ*Í���n/�������w����⧷/��vg���!;���N���~����hw����˃������R#��:Y�"X�T��i~�������M@S���rn!5"]<_\ˌ��	9rVF+=��a����.��KZp�A&�Gp^Ō�o@F�71���L��L���O~]jU��_��[@� �ɬ|bF� ��$�t�i*���1<��O_uC��Bl���X�?�[�"Y��$�@��؃�:G� 
-]�vj˅@7x���s
�7�sݲ5������d�U,�X��(���:��DW�!�����'����䬇�\>��f8/Qm��1�DX0A���P���^��K��L^�S����-*C��T��'��Fg	i�t�Ʌ{?�_�?cpzx�i$���O#N��^}�J���Gן�=�Ϟ�s�����^��D���(�]��+Z��um�R�9p�q��<�����c|��W�0�;��#���z�\����e��S�(p�O����m|{S�D�>�0x X�f|���pu���&5C+�SDL����u�Ҵ&)jE	#;�h"�vp�C1S�I��:�|�bN�p�T��*seST��z��
�i]�l��6	I'bx�Y��&>6*ʂ�ď�ǳ��{��4wwlÀ(�.���G���Pܠ�X�=1���ۡ����� ئIA��"�^(���FY����dCp{ֲ& Z��x}9������A8�$oȕټ���$^I'[J2^���Gl*�:��
 �x �a!��~�	�`�V.(�j?V�|�5.�>�j�o�D���,z(f�4�#.�>煺����W��cn�}.J��� ��s��]����l�)У����}R�X�C4-�ϧ{n�	�-��7)���(�X��"��V�i^�ו�@�����*� �3�AVR��<���nwy0
�����V(XS�x�_l�+��i���spy�2�^Z��Y*�Xx H�v{��>d�j��ú0K06�_��H�)(��:BѰ��8�0P�����l����Gv��Fz�Ͱ����>�3�6p�q�Jdcs�d�>z,��[��ѷ���I�
����߼s~���Oc<��N��~�vH�0~��Qx�)��&���~@90G�b�3�1Y��9["1x0���}������� ��3�ٌ=�}_��(f�^cdFD��7��8�c���'O��z0�J�14����t�JS���1�hC<�-��x�EeT��zI�=KH���cr8D�e�0������P�e���R��Vԕ������E��yg'���)h�o�a*���q-� 9k����w��w��!C <�	�0��sT�yK�ܰ��J*3XE{g~��/n�ܞ�����������~(�}����?G�gs0������#�s:�k�#3<o�7#>9a�x�p��͉��QNo�"2*%5EG��x��?	ps�sp(-��o�SL��݊lE���Wۀ�����Uǜ&��DJ�יJ��P9v�J�����iB� D�$
�~���  �r��ƴPfݦȟ�Ǧ���{ǟ�S�R#�~�#����<q��']kvdy�y;��a.�BG����+$�����g���j-�6��.��#*�����y�y�&Ł7�ث=�-�Š�s-K46�AX�>��q�`� �it"�M�S��/{��u��D�Ўz��W�`� 2L��4�*�������h�:��w8ŉ_���I� �"t26a4�����
�+,�	��m�e#5��D�b�4_�,Tq(6O�m[�g �d	���@(���[
��k���T���xx��ō�P7Sw��&�8	�Wm�'���jߪBR��U�)U���*I�fV*��y����5�d^�ʌ���b+�O���O<Gnv��l�����!c_����&q��G�mr���}��k�Ŀտ�����N�D �M6��B���ˬU�F�Et�HN�R�=��x/��<& �.�K���0��hwL�Q��3&�7e7�Kk	<�Zd�d�='6��/F�N:��;Vt��:����ٿ�T�����;��a�>`���IF�c5۟�pC<X5�G�k�o��5bۥ��L><0t:���������t*̇gW� �5�Q��
-ʛѫ�ѱI��V2�o[z�΢��(}��h� ���Խ$\���V��kq-yoW��n��K�m�����$i�㌳{ڒ����V�����+0�:�b��Őӄ�5&�u��sf0���$0oG��5�9"����z��H�����-���?H�˳���D�o���.&ھ� (��Ep���x�|жi��s^ ��@��h����P��ŭ�1A���,�y_y;���y	8�	��V��i�u���PJ���P�%�d4��Η�︽��aO���(�!m%|�zt���%\+B����B�V�8�3	>)���Li�8J�n�����R�رF�4�qOxD����^w7wLG�tX��#��5Ǜ���Q9�f)r}��8U8�F�B<K3LԔ�[cn�``DY#���{���O�[�k����>�7�vG+�A'|�'z��P���з�b)Z��9<����6��^���0��C�l������Z�{8LI�4�e" 8��ZuA�Հ�Q���0���Ìa�p�b_t��]`���-VD[�e� �  (��|R�g?�s���S��M��R�;u1��]�n�E��{\�i�q���,����Vh���^����Q
3j1?\�ꦀ���kev8�?b_��m��=�'���߻(|B����E1`2n��@���"v��ܷh�I>��\�>��Ƭ�j���x��>A�ʩw�=x���������v�u�ɹ��J�]�i�"�Xu��儍�R%�1]_�\�H�©�6�tC���c��Ks8M74��R�qy�k�7DZ�Fh�	v�0�T�D �*rP��P�Rd�Ҡ|G�
Y�� d��b�R�.e;�c5�|El)O�h���̚��3�.��G����p��=){���
P���"w�7'6G�fY��5�L�>��`�_e�C����0��Iۅ������D�AE������Ό�̀n��������.����O%%��@����?Z�-|�D����j�v6��V���kk�d�g(�_`S^��`�+I�N�p O<"b�"��(i��d�Inl�Z��_ȿ	-F��Fa0B��@�:m�v�"2�:X��5]������Ks���m�da��v��v,�|���# �"E#�����BQ2x����L��F$�h'Яl����x}��4�1c)���X���=�ą{q�I�S�cXD��"Q����T� �o
$	�=�Rz@�����2`'Y-��P�!�j��v?ԚI�K^��m�-���"�@���s��9b�u!R�*��t�����u�	D�Qw�J�	a�a)�T��[��W`���#]��ª��L��2����v��7��F�l�X����X�lM��yo����HN5�2�������%O�@�?��7����tu��9h2����	�1꼁$x(Q<SXێrl���ٜ3�0��")l;��CS�jQ"*�
�f#��X氡�;�{{&�F�IO�h��~�`��n�(u��"��M#ƅ�dN�叐�5��V���s2#\=r����o� *������)�`H�I<�%qZ�Ͼ~��L���|s®1�L4��:�'����E!W0���m�`W��}tA�=�b�F׸�]�H��ˑFH����P���ȳ��R8�����4h�Aع{��7;]�
��3FΑ���}M�1:p�ʚ�c������e�.��j�wI=8Km?@DL����In����_���������W����?�:�0E��a��������+k�բI0`o0n4����2+R���]��*��'&*�<
��D&�F=Q�=
���1 ����hQ̗8�dCC�>�0�g��J����A�*k"��/�x�S9	A����d/3[�b�o��V��I�)`eRc巻ٖl�ꘞ�ꪫPy�	���U���#eJ��,��P�*yT��(��QDM$�w9x������`�?B�lG�g`�I��`��V�Q���$��N-��Z�5r�j �;.�(g�G�# �.!{6���1*�\����Q�FD���Ř9k�m�Cn[�xJ���dTE��R%�����
�5�/��&v����:O2:3��hS{��#�ڊT1]�]�m�ԁ��V$�ra�.�hu��H�Y��٨��j	V|R���F���d�(���.@Rs5x��'���C��A�.��(tHz�����ֲ���3�,�*��'�0�S�>���v�-�`_:J���-�i�����Cb�*      D      x��}koܸ���̯�� Ar��ݶ�p�	�8N&�8�s��Y4��͹��PR#g����	�Ƕ�zEJV�_�I��qZ�"Y,���޽�E��\��`��LD<S���?�~󎧾|�"|��e"�k��;˧3�r/��яL1G#�u!����?b����c�h&�#Y��)4M���Z0�����<�<4a���O`�9 1�2����*���3��o,����0�xqPʓ^,#��L=%��pO*��P� ܓH/�6����>�����y
��G��D���?��`���x&��<�9����~����3t�3��ʲ���t+�?H���ӊ>�Yȼ�gOG�����K�q�/��:�����*����{�s���f8Ŵ=��f.�d�Y{,��%�X�g�K����N�+\H5ϋf!B�8"��W-z���?|�P�i�d<7k�6gj�����ch�cd����k��s`4�-,?�c)"������;{�+����ƙ������V�F0�f�3.2h���k&;K2�s�wBD"�y+��OI����O�}��,��be"͚�r���">/���p��5�wn>���RT �9P�Dz�<z�������ߏ?����?�ac�X�%��;�śz���!'��r��oA+W{���ϚT��u�V��݆=s�b�Y6�%'� >�l3�����U��ĩ>�y�.Wr��*�ş]�v�
�H7k|"�)6�2�Q���vC/@J�O�[������l��i�+��9gA�������4�w�������<~�����f_Ds�݇?���T������&�`��&���֛����c��o��Ϧ2�w�X������W*QXj�>�C�6���Γ?��m���Z��  �ce�00�e�1�z��^�{�{�������������x���z6z5z����'��{�_����a��s���7o��H��Z�q~1U���'��.
��ys��h ��j��s5���?&"�])'�\�z7��;>�$<[>�a��V^Pq6AmI��
h :��!��
ģ�KS��0�HWr��p���
BT���ۀ.=�t�7z@�W�H�f���[hR8�P9MW��y����:�W�-��	O�$X�*����

�Dy�<[�r
��Z�嘤�A'�
|3�%�q���T�k�b<Od
�Ʋd4�W��	��WX�6�J��I������[��;��2��F��a��0LK�J'��fAM���Zj(�Fl����VZ][����e��� K����0S�`���@%>ʠ��ı�柒�r]"��K���#�2�ˌM"��2Q$� Z�?�{�����Ä����K�jţ�D�����qK+!n�Q��)YA��3���t�~TW8��򅞟�Bu�	�V����R��ı�\V�e�myL�D�@�M����b���x��F'ar"j�|ɗV���\�~��H
�a��G:�a��hZ$��
8��reإ������J�B��`��\�?��͑Q.5���̬��2\�Ē�ލb�	�@l��j�ɩ@�
๚�x%$	z[A����	(�%{_aA\�4��L/�JT�Y��4�*��4�6�i(}V0�R8�0�T&H%@������/���dĥXa&��{�N~<%�z��b�3����ChY����z��}��;����ǉNW�ӭ7ғ�?���r���$��l^>{�1�����wz��{�#+���7�i��nǁ���Ģ�{M��_s%A�y�+��{��M�իq��K%��������KX�x��|����T!�/�D�S/q�cQF�1����R�GPF��4O� �G��P�%	�c��P:��%<��L���d�)f^H6e"�/S [8N�L�4�E�J�&ֿ��!�b_�{-�����}�����6ccK��
��}�*>�䚇��OǏ_��G�r�� �MqFqVʮ-kA�ۚ�LP흌�d�XHc���B�<��p5�ܬ�������h��-��LD����`;;����j!��sd"���T$����eb�ȬyT/��?�x�\����3��'X�X���x�j������?��,@��qP�[������d��Nu� �:��\`f\9چ����A����&�2���=��I�M�c�%���c☋R�	Z�x�4�%��%�c�c������G ٞ�׮ޜ�/׸5�����[���[�V$*f��5ߎ:��J}�x�󆇮�!	�Y���+� J@}P�+�q�}���c���}&����NA�1��{Dk��w��߇R�^��4rd4n��%�@Lm��v�y����$(I��Q�F>�=o��r��� 4��h��aYḴ��ѳ΃hE&����jd��6L�*;�Zxh���LiG��jG+=��;�F4��o�t5�4�H�1g#~N�"��Jӥ�L�Whw����G
;��ìx㐉:��&i6gԶ�����FS���_Y�Y�#�DZ7*��h�fd�M��%%�}���Mؽ�.�W]<�=6��g���9Y;�*t�fckN�����(��w����(�J���.m� \�=��>�G�+N���nq�F(�M�cP?�˹V�EQ�8��	���~'����W�ڲ�j�;����I��:��C��FϭUw@�,uz5�=;#kU(�;�T{N��C�[ԥ����Ewl	@a�կ_�Nm5�L���§��5������*b�PM�y���f����۫ɼ�� �#k�f��BX�8���SJS�Yby�b�X�-f������)2��آ�ɥ}��xl��nn�>�7�����+o�h������#�PF�3&?�6Bl�`7�`Ir���i�)1�������]� ����J��)ߜ��چ{�8�#x��:�����Q�!�������tT��Y��gI���
x9��ûRUȢyW`n �q�v������ �D�����p]�����.�R7߳v�ټ���A�5� ��L��>D�jf�;��L5���޳ց���U���b(��F`_�M0;tt�+y�D��Xu�e*=��l���1_
5��z=�L?�{�1���{xv��$��X��ft�b�ĖI;<�{���9xN��Wts�=���肳�)�;�U ��y��o��h"}�,6���Vs������ _�r{�P�$���Q/�ob��Q�ΐ��������~������Q��?���I�pV�)ů�r��O�8�D��BH�,��4C9n���N���ű�M/G�k�u�U��e�)V�m�Z+7 )O8Y��hk&����)9})�¿7�\�m���ԧ��\ hq���� ���B���h~�Ȓ���g9�4���w\�� p�E��>moɉ�������Ԯ�j�Ƀ�X�iHC{cKGi!hK���_��<�3��;�qF�Z?���#S?9?�@(H}��R�6�o'l)�9�W*��L��1]�;�#8'���ۗ�FvmĎ����xk��"�ֈo�%�+����,C�l�v�C�\ '=ZV�%{L������� /w�R�Y5}?��ճmK�_� <k܏eXEY��H�s��#IQ���|P,�{��g�����!�;� �^{*�v5mFk�ث��1�j�7�]�����QƩ��7ÛE�%���m�/�5��C@��Ɩ�GѢB��� �RR����Ok��ȼcѤ�w�7�3�h~(+o6��J�p�6��nS�ۣ��R���[sw���Жm�;�YU�0��RÉ��6���)0;��C�ӶO̝ �1F0�{]��/HY���w�N�����iuApZ:N��"f�c1 ��ϟ�푥���աk���ر��r))]�-��B?(��c�m2���%��}�;�
��8�p��BHо-^�Y�j�L�c4^&ϸ��Leb^�� �.�L_}��$���㑽h���TuZ�U'�s���GDZ�>'E�9-�q�3PlF���Ȏ�vPQ��O�M�T?OD�j��й�N�}    '<P�y^V�I3#�k��r�>�P��1���J�t����o�kc�G~ϡ�/�������0�.�h��Yc��ڒ�!g
H)�ܛ>�R3��3�9]Z�w�b�v�W�չL%!��1/IƵH�ERQ)�E��%Q���Lt�������1X�ݹ�21ڻ�EBo��Z�|(��9�{�+Rg�TZGv�|p����fע��9V�v��X��o8$�~���0H�Xp��h�R��v'���=I
L�ʌ8���
��� �D�g5���t�����)���5������
&���aY�kt>DF8��H��nݨ=b�H\yV>�#Cf'��A�����G��R��f�@����X�)U�ڭ����"��;���]Y�&�SRǣ�������ˎt�1aI0��(ka:	�)J���vw]4M�\a��U�ZQ1/;��)�~���пG�0�l����:��\���݌�B~|lh�B�%����ؕJ�ވ[v6|b5&k<g�z9z�H2�@U�@��A�,�hA4K"��GiF�I���n>����ZJ
u��<'�wb�ގZ����{��$dC�p��󈤻^�g�N�R�h�b
�qځ�5V�����0��OZ��-_ڷ4MX��d��t��vjm�=��T2��2�*���䲤E���(P�:�`r�Ҥؾ�7���?��E���8Zw��	(��jugP=Ν�˟8��DW�s��͠�����y/�&�
��+r�h�{�4t`��*��c�d�z��0ղ=[�:���to}b�J���|
:
��)��!��|.�м3ޱ��6�ò�m��aG_Z!Ea�[(��,|�/Ԇ:
�Q eBY+҆��Q骅*�S4�m�mDm�`�>W� `��F���m�`N��=)뙆]|�����sUT�L��Z�*jC����֐r�{�[�k��q��vR�qH��~��'0����@ء�j@��Y�^Z�]��;�Ov�e�W�4���9��L�� (�F"�8��m�y�T��e n���� ��t.�H10�u
�BǼ�*�\�2�@X�)�(�ỷ�z1������E�pL��{�.��]q��[ QP����k�����+ڭ^����\�8ڧۋ5Z�;&�N�-Rz�F��<�X'��o�d�~?�|�+�'#ͭ����y
[F�ۚ�P�|��_�� �Uz�X&��L�l.�t</z��Q���erb��,:l���j��Tk���L�I�y�,���aCv�l��kR8���'`��Q/��r�AN谽m��pc�uQZ��qI����Z]ݏ^:��N��B��h��A�\�k��޴z��A7�����������]��8�� O�jsVȦ�?ƾ��l�c�Ԃ�� ص7W�_i�/���:4Pz��:���$,�Ds�ɨ,��!+}+�':0����qpRJ���+;2=�2��k<��O)���mI�/H��ѓ���=5	N����W�r�)2?�����rV<���3'�*�A��=�$-���S�r(qv�b:��V�{�O�t]�D�y\�Y��/J�`H��ʍ�ض#����Ǽ���o�t2Κpk����N���AV��t�m��(��nt��7��P�:�[G��I0>#��^�: �:z�$m���4��87�X�[�t䭵}a���	������rvP�3[�m�g�$$���~9rj�w�����H��%͍�l��lO
�8�������ȵ��,��W�K{��Yu�������� u"S=��sۿ�R�@��� �9U0��J�Y�/��~eN\fw����c���Nx��c�)��hY6�2$M�H�;i�)&D�l�[]�3��㋈�Y�K���}��2l�6��������}�w�������ҩ�]���gJ*��2_ m�ń�:Y�=�}��.�؂��\��8p�Bl���D�u���6L]"%�pv��W�ԉu!ٵ�Z`��2]��<��a�HMw�98�Ը�|( �o�d4r���D�D�T!#�{�:u9Hօ�k�m�r�"5_f��oա�hb���d�s�K���i���n���q�� �r�C�Sq��#�P�e�INRL^�G��y���3��j��~�K��m6~�!FYSgCz�+ٺCc�v�:vT�i@�q
j��V�� ��}_� l���.�!͛��>k�H}jTv\�ڐ�"[f2	�XG�y���뾄F�%k�`���x��i�o�OE؂��J��(��v�n�X*�QT�Z�������w�c�2� ��+�R���1зZ����oHe����Q|LC%��m���{	�,�lJ�]��n�l��)�e'�q%a�2��m<�����k����6-:,���{$v�7}x��a7�U�͢���Ru���/�@Hn��2����3�_���+�Q�)>�G4ka�ݑ����S���ʤ�@9�������P�>�$�� N�\�o�m���
���t���ϰl��j�/6TƆ��w�W�%�� ӆ�4w��P�a�w#�~���G�\-�$X?�!y�lB~|���k
��2�C6�'���kT��3�mU�Z�c\����Ϙ�BB4�N>�\`��q�^�CX�	�U�M��cu�0�<�Q7��pA;�u
!�vpP�(�E�Si&h��2gO�{E}W��E�}L���o����Rys�z�����t7kBm����- ig�k�uI��Ev��ղ����/�]fpPz6��0���-i?����=�i�,dr��i������Z�����ʕ���G��TB�1�g���U(�����,�ѳ�O�-�"$�k�~P9�m�sr�>f��36�4�î_}
&��v��.�R�^R8e2�1�����\��j!�۬VQUZ(��5�[�FS�r��,�����3�\/��v;,n���/��8����.f�7�i�(��\��S�,���lФ)UB.��-q^$��jpr�D1*�]��
��4���\�	���?�������d�M���jz��hS�W7�<�4ѧD�{�	]��n&P��,ʢUU�~Rz%�oH�h�l�4�~���^B�m�B�r���)Mw�6O9f�ޝk�\���J�W�u���t,���Y ����pu
����'V����iN�U��&���kg�zS[��KSP��5��_�H�;�\~D�ǰ�Q���ۺ�'�mM;��>�;���	R�|��.�کq��n����y��|�]�Ƅ�V�
�u�2$�
�%�[�m��j~�b���C�@����}�ön�[r��siܢ���+���Kg�]a_�/�j��X!�z��Q�0n�kw[=>��ۗ�8���E
+�}zk)�¨i���كm�߼aw
�͌�=�6�<'�fg��3��h]k��V�Pqu���|5N�K�L0Z�C��z�FcO�?M0�P����%���^�/�N��.'�-����p�!ݕmP��"������,6���a��\�WNe1�}GG�Q�夭�^z��Yw��:��_#��!c�ܷZ�^0�P���p[����e$#V^3I�?ݪ<��K.��QN�,�e]7�7UX��-sS�W��bDt݂�(���YC=��n�Y>5[\X�R�	W3W$�S%�V����u�zTMXz9�>����"vݕu]�w#h?_�aן�]��D�;��9�3n<�`�����~�J1@>�qn8^k1ZwU�q�22���s�wߣ}�ɀx��Ջ]��´v��v�I_����sD�����|��q��\F���G�+_�S��9��o�ʺ
���gqQOt�vVj����h��{��Tn�x[�)j�<����8��>���l�Kń��%�_�8�]��*O��-�e �-��'-�T��d���]"��5��}�ȍ�Y�x�@f��hb��7��p��K���˧=���v�W(��L��y��Q8f >���u�p׶�b�u���)���/��2�.k{Ԉl�l �3I_�p����=���߉��Wȴ����m�e��[W�ig륜����0�����h7�x��7�rY$ 6  �gC�AG���VV�ܐm�3�msz�7U��R. ykܑ���n��ê�ṙ����yDDa��.�1{���X��o�� ��3�S�"rbl�m9� ey{C�a�y,c�)�DH���]G�M��H;[ۆ<6*��7�j�AQ�y,��{;�k��|��o�Z�Vr�	d�є)�����Z���g4�yo�Z�8�tX, �#/�v-5Q��hs�+��_K�N�{Cq��͓�,҅���*"G��Ϛ�+r�{�|u�U;�jtS�W���[���y�Jy����d ���{�&3���v/�Q�'��Fw2N|��/wp�?c�6��l� ��yp�lo_Q�ל9d$̕'�Ʈ�ȍ��¯�Ǻ��`7�ד�Ne {�lp\��~0�e�
,~�y��� ���fF�}�R'�%R˜&���:�Ͼ	д�磹+�an�5�ȸ�-ﭹ�$�6�o�#V�->�
��ec��[E�����mǣE�zG1��M��9V�F5��5V�=zѦ�]y��כ��0k~m4�k��(��)-,���$�d��*�Ffe��N�y����l�X^S�"&!�Yp����6�.�ZY&/��#�ƙ�z�6����6���>��z>�S������yy��{��"���lg)G��5�\�g�曽��7�g�.�>�B:m�́=�ps'��&�^�2���(��ڀ+kW��l��e���}I�G�և�}�Ǎ�(��]J���rݭ\��6�p�>/ǈu�/��g(�ُV��#�rS_��}N�ڕϺ�AB��ݕ£	S*�x��h�g�D �@t��� E.��k]m`�}�Y�B�X��z����9}~C��[/�Q�̮K3X�Y�߄��v谲�B�am�D����/��{�Cf���}�O߃�@]m�ay����;궳���u%��j���!��_���=��G7}̿�1y&��Ͼ�]��e�����u��5��-�c}?D۝����nH��;r��+��)��*k>��2ت�I��D�t�°$?�z��·����`�w����<�m�������s�yEO��b	kI�FaW�r��$��� PƀC�$�'|6ͫߞ�>N�B��J�S�;Q"�Q�������%�EF�Gط;�jS	�ih�~j_�4nY��P��[?nWK�ӓ������5@8e�����R�ݏ��Pr��H��C��ҡ��q��y�:	��p�5����v������*�`yz;�􄫈�ܸj|e1���;���U�/V��y[� Dh9&�d�!sW����}�8�{�6\L����*6�P&hl]�n�ѫk�>SJ6��..n^B�;���";�q��؅�v�\��Hc����],g�l��R�I�^B���@o~�U�At�{'`�9��7B�Ƅ�`oB�C�̰u�0�ؿ_�?ᒵU��>�T�^"Al�,�V�V����cZ�ʙ�>l�<�g�J�8٪�5�V�w��u>�i`�����n��r��9@^6a��?D�~�DW��)μ��}����;���2�΂9-�tvt�`�yS�yq�|nݥ;����t����$���il�է|VMs.�S*�P���paf#�~;k����i�{+:&{z������އ���G��S�|�"u��K��.�s�,O3��e̝�k�m�?�{��t���ճ�+����H���),��j���}LB �NX��~�n�x����sCNK�Q>���(�q�5��@�A{p�pֶ�H-���&����xjq{#N?5�-���a���g���w�]�������K���e#�W}�S?%E�\k��y�b�%"�q�wUڍ��� ��6gP��T��(������&Hr�% 8,FS+m����u��'�)���ʲ�51�ј�I�([��І�:����RZ��~��MRt�6;_�Id��5�
�f�5�=���b�4���:*|Zc����9�I�m��C�<Q��]����%��v���Q�kv�0�����z��z�|���G�"���X�/�t��0���o׸%|�u����O�4Q|�u3%�D�|"U<o��uDu0w�L�X�ÆOQ��Jj�����8A�рvs��DLu�)�\�J��)C���o�l�>�x��~���#Oz	Wh}��OK��QE���g��I�nr�� T!�VBD�m��[2���O��S��������P������n�S@�d&��~'r֍��W�ԐP��z�T]��)]�p�xgV����׎����,z���cO:;�5p�h����ֺׅ��2Ҕ��0J��o��}��{��}�}<�pp��G����pV��n7����t���=�}��=-���a>q�9��7˧=��Xm���0�~�cp��r7f�ʨ{]Z��z	fK���,SxyfFL,X�)��;�B�<�jV˒����]ɞ��?|� ����{._��=M����+
ri47`g��
#��<�>�F�l���+�����)SF��6���>��� #ǡ�Y�"|OeԽ��޿%\������TE�-S]Z���M}Z�W��~v��8�LX�1�nmԹ�6��'��s#�Sk����5 uC���[�^��,?�ص";}#F�U��^�N������޽����|o{���d<~2��ǯ��^��?}�����OF;�����޻2�XsO�X��������4M^����#�3;=�l�����j�pmFOX�~�S`ԥ�^��y�0�4����cǬ�Kw�E��,~�<1"�a�� c�>��y����;��@��D�bv��tBo�E��"b�Ǥ7-})`?0ʅ�Mqpy��>�%Ɖ{s��(�E����\q̟M�Tq,��ļ�/]��)�j8��4��|z�r/�Q"q,���c���e(�M�i�,��т����d�`��9�?��J�:��5�#�b��@\��E�}�t*� �Vd����1� ��"������L�B5�@���/�a�z����+c�˄м4�w����L�����+�:���f_Ds/U�o�����x��Մlz��d��)��`+D(�7�a	"]�����ڤt��-�-���~�٫o�sV�`:�X��+�BO�R�sz�0�h$���$|�V���R*�~��b�/��
T�g<Xn@����� ��b���`e��d��|0�	𽽱�P
�f�@C7V����i�W
�*L�E���h jO���L*Q����_����G�r�fN�����O.^OtՀ��>T���ԔqyX�I�.20Ae�|��ci{5|`���Bgi� ֢06���8���i"
���xY'k1ވι�hwt��0fT8D��smT�T9��',�z|��q�g�%�+q�tڝ}��6J0�4<//��[�C��R4�[�b�����*_r�f�z�u������eU#��!��d"���t�����ǴG2����q�
��֛��"�N��2����L��k[� �dDe+�g|�Jz
{�a����t,��V�%�Ԍz��@�R��<��.��??|<��;��U�0}��,C$���S��`|�13�{�`�b^VZ�w�E̽�=.��ԋ$�4�+
;��ح�����(4��jóH�g�9XZ��?ϲ$}��5�y>}
ȷ�t.aU�J[��b�)��I�����}��T����"A١�#E�����#�Lc�_�W@8�R� |���T��<�[���=�����ܡc<�>�hZh��y����I�ꩶ#�͊G�j��8�z�'ź�
�B�RZw�tM6�ѐ&�V$�mT��j�A�n��7��叧�����h�;�      9      x������ � �      A      x��\�r����<ʩRIU%J��J�MюOY�H���V�\�H����-�Ǿ���9/��`sc$[�n�I��`�F���+��g��\��Ͽ�[=;^�les�::�[������㻃�Sa"-��H�29��Lbq�X��.�n��?��v�Sԧ[Ȭ�N�q�����'�d�37�E�VJ3��'2�`��L���b��7����9�$.T�d���"�_OW2�xS���2C6K8�<*rqĴ����0{�؜g�Z����r���c�Te˓,�����j,_%2��n-��ӴK�	M��`�j����p/�+�S������>Èr\$�22�
�ɐ����2����N�ps�"�4G
 9�d 9���e�Ȍ=+���T�����X	�O������	�T�pZh�� �=��G<b��͖$!A�2�D��I�O�y�a�K�R��\�H�>��y^�0�(�"��8��I��S!Xu�0Π�ک��FnI�[�h��80�z�ؗ��O�ӂ&ǮE
��'q����5O@.��װq��E�P��25'����Ur��jq�{^�6x8�c�
 �o�[���k	�����8����<`�BItR(_ nɁ�kdQ,�B��J�?1|p�$qv<gR ��"�����:0H�oTD)X`��Bؒ�у�#��!#aѸ�`�"���8c���t+B&���5��U"���5 
_ B6Ir�:+yC��'�Y~)?S M����F�YKn�ƭ$��JTd����nMh	�l1)C���E#c��yr`����HC�$ ~���d*sf�㠞��X����ߨ��d��oŲ��>\z�n�~��	ϺE�V���.ER��%K a4"`��gB��TH#�<�[�1�B����5<e*RZ��9pDu��[���E9��
OD҂��H�{�24�9�0-�	^�[�ӭ�g��F,���(��y"<S�;�c���������K"~~�R��-�q��^??9������>��3��������p�ʖ�����^~WͿW.��WK�s�#�D�HO^#��w���qϢ�:�b�3h��T�8!q��xu2K�݀T6Z�?p���`���oO��M��B/A�<D�[��[��mroT�Q'/BZ��r ���\X��6/�b4��Z/v��K��d��n莠��rY�����
�/h����n�u��h.�W�Д/AU���{��%i~X}G�%���јM7r�(�z�^�O�z$pw+!�x��ep>i�б0p��d�ӕ
�&��_~���u�ON�`̮% P��!Y�M�<�d�g*��	�AK��!�������Kh.TZ�c������ߣ��V��1�'��d=�P�I�'�`�r���0*h�y`i( ��V��T5׀��@����9OrG��	���"�=9<��I H֟�?���{±������g�����O/^��g#�ߋg��?;�?x�;���h���x����F?���?|����g�Z "�g��(��i$sF�dN`�F�񛛨�&���%�Q�<���|�B;(�$o-��/����)��9�n:ftpV����(�+�G�ZY<�Q�?Gl�t,�x����1����8��r���W����D(l�y����u�_YJɋ4l*2��a�7BI�z���T�,8�+�=��)f�Y�
�j�R�JK�\C���-�BR�P�h��o��e��8���T���W�`p.M��v� �����n����Ri��	lj�˩ǥc�"F��P�q�S!<�ѿiRޑ[}B	�Y�_�l�z�6��Pn>�pL�;3�h-ʥ:9����)��'&W`������yA�m��*1�'7 �U��$����g3�_�<���N^�<M�pz��No@�׽A����|l�b���@-�W�7��^�~I���=m)�.˷�mfHs�b�P,j�xځ]M��3�����7�1_�c&c���	�gC�d3T���
�0?J$M*�6w0�ˤ̪9{D�H�5X�*~���ٕ���T \���M�nJT� �^�cP~�q3��	���;��� \�J5�����7�����]]����3���>hL�Z��jv
�m�E�����e
��O���V�ϻ��w�Q�s�ӗV=<�֓�d*��E�V�J{`����sʊ5Y[�5!m><S�1����rq��]��%�a�����t<���f�ψ`��L}�VW��)jғ�k���n���b`�-2����]VORP���j�r��C>G)>���lDs]ż^5HvP���"TG��/���ũp���
۸i.��(�@�I�\1(.�3���Gm���B>;Vx����<x������M�튱 ai�H��Wy>2�%���Q���� }X�)�YUG��� ��T�C�#����mq�,𨇕i6��K`@�x��Ē���m�0<.���%���:_*E!�w�O`����US�P+�����I���K��Z�js�SE�Y|�;��H��Xd\ioc�%TC�i�-㨗p. 8��Ì�I=���*���8Ya�`{�,��!���/+��6��}���6�]��Qu(cF��te����í���p6��р{�
tfC��3>z���S�|X���y�M�L��B�-�fᦑ�X_����۷80) }�z:0~dہ!R�[	k�H� oph޼��=7����:ܷ5q��|���@(n[!���B����Zz�"Dʔ(�fo��_ �l��e�29(�:�RW���Q�U:Q-��l�����)��'�Nggcv+����e���O��K�b�`�>�hĸ>M�,ؤ�����k��ֵ{}ǵ���{1ܷU:�
�X�L���t�"�ZJ�yp��S�9K�q���R��y��S��a����������^�0نu>�_�t��� &��:��T��{?���;��d�1�k5�%z���1p�t] ޭT�C%�,�n(z�:%��b�p �y�n�Qj	�v���eKp��ǜ��~~~��+3�������l���!pf�3ϣ�_���q�:}��l����V�� �U��o� �!�F�z8׏ r�J;�?������l�W��򿾆���(�����hU��ק��(ۭ�6%Pw��y{=�(:z~[<T4�j�L���)wF�z�J)U�"����c#��;e���	��ڝ�	�I�8�����{rUh�m��W��Vvݍ�I"�x��k�߹�?���F*e�`Ʈ�(��V"��_�Q�6V��!Mw*�:[�
��巟\ˎ�SV9��}����O]�H Z���zu��ku��o=t���Zخ!�������D�y]�uw��&A�l��`��i��R�wŜp=6K� 4�+"R¼'��x��;�D�:D�N,m{��o���W�G�IV��n!��QK�7��rb���2r}��OE�P:C��*�	7����>���z��-~��ի��QӖ��	�}�j�鰵�+��5>����~ݡƆ5?��gw��]��Gi�<�iĝ�*mb4Y	U���į탏)�/v��kQ�-��ˀ������h���^voz ��{��F:Y0��ɽkh\�a��S��	k5.�����=�T�ǸL�'��B@�#>�e��
B�Z�V҅0�H�k-Mѭ);�ҏ1�3�Iwҗ�iծ��nO�.���l>�+��[{�r���aV G�����T\iF�f��:-�F���厭�a[I�}ꃠe]�Es,z���Q6舱NU\7�	�yߎ�x�(L+s ������1j7/�!@R^t�)Jn@�,cP~�O�7��Ô0՛A�|��f��A1h�l|(�ea�^EZ�c꺭��a�1(��n�H��0�O�Y��*oD�W���F�Y&అ�+�4%��xq��x�*��cC[X���Mf�;�}�� 4�[�}LW��+�CةmN���
g�#�&QN�ƶ��J:�h�|�:6��c�
@��!�)�^���$E�c;} �  U�0��E�3�ـ6]��2OV�W	_��^�*�퉲!ֽ�+�O�#��E���Ƴ֢����ͯn]����.G�����t<�`/���8�牷~<���?�e��î�� �P{kl�5󴙎���9�)�s_����g�����B��a�~�,�	@�5����#�1��:{
�}�8�����M�<#�-���$��W �0���#�tz���agöOgWv:�]���Hf�.���8h�Bs�������o��y$?����Ｊ����"I��#�puqk�����+�����t�$��6��9N��`�L���^v�g�v�S���PѺI�I¬��&��7�_���\_(��^�!	���vSn|����w���tk&��J���u�ў�fS�979�v���6�78���W�ϔS�Jk����瞏=)#��l�:p��}��t�t�3c�����J�'��;�{[w|���}�f��_����*���*Y;	�.:ϡw���vwĮN��^<�^^�7;��t�uW^M5�l����|�fkr�4���{�K��䧻z;k���Hj.mI�����?��������ѯ'������wcT�n)�.�wn��./�7�Yɵ�n+r��i������]u�{-�5^Q��:D��W�g��٫������6�ӫ'1��e�Rzv��}eOE�V[@4cKp�A����'o�j��`I������?��^�dȪ錮2��	�R�"W�̞�i�T��2�c�)RN�r�pψX<��Ϯ��n��[�yՃ�	��;�>�`��\�\ͱ�qc\]�$M6T�Ϊ&�N���w,rE�e�ۖY�t;���PO�1��������Ԡ s�c�y�g�멭�c�L�k�mƮ�������*=n�x}�A�Ѷ���Tb1.�bǧj=�N2J(a��t.ѝ2�K��U躗�Q���Xf�
g����ע��Z̂�'FD՝��e�`��_��Nߝ3�@�\z/�P��q1�w8`^&GAh�	V^��2�b�M��ʨ��� ��G����v�r�;M�2C��;yax� �K�#6�i@WK��ټ4#_�e[�e��y�F��4���3�W��b\�����[&��3`�_��}	��"��Л���B⅟�����O2B�uI"��ܩ�
A���uF`~s���8�l�_����M1z�µ�� ����K8�e��f
�`onaW�11�t��HW�x�T�3�v�(Rt��r� J�tq��n8�]�m�n�"����*m1qg��<���xz�w�-��z��j2��2������Hb�ӫ�d�.&���pYb0l0 1 )"E(-6�ꅞsۥ��h�A��`Բ��[J�]�A8�q�0]1�1EiacY^�F�(lt���F(ÊQ���C���2��]L2ز�����+�X���C)+���T$�êj�'ޤ�.�����O���uσ~������+�      F   h   x�E��D!�s(fG��^~�ul�喧H$��ȴ���U�`�yQC��E�gKK����ځ�2�q�ߥ�a�Q#��Uł�l̋��&-Xc�������cf?=9 {      H      x������ � �      L   �   x�}�Mj�0��}
_���hf$]��U7j�E���؛\�G�r��S"������g�9�D#�@�Y�5�(������.�P��|^n�4AG=?A��Y��B��>�gLYL9���۵*I���@�:�H���y�޿�a>_����T6e�ʪ�1z���?���3"���8S�h�����6��J����\Mۦ�T�@�7�6)s�CF��7�4���ҞH�p�l�����}��$      N   )
  x��\m�۸���
b,����k �����$�f��-�2SItH��%�_՟�?�g(K�ڴw���E� ٵ��p��p�FN�u�zoT����TE"9��H��ϬZ��͎���|�K�D��2�
��AFZŚ�%g��H�L�ՒӸPeVd��Ƌ`�R�P��0�L.���I$.�8{����	v��j�l�T�.�����۬�9^�1�\f��T�G@�Wv9��X7�Jh#!ˬw�;J�Zp���qo�%s+.W"�M�R��s��a���5���r�n�ڎy1x.C�㙕1~/�&�B3�2��De���!��FB�;�i������7܄�(
�����#���R�cQ̟b���Ͱps�1#g2�HIPb^c1_F�9!J9�r�s��ΎӖ����b-��`���z̊�-���J^f!l�LÂÇ=�fr���(ś0>;�6��e,�3}ȥ�o;?�Pi-c�����6۫]8.��B,plq{�G���ŷ����ԍ�UO�͚�%��w�O��ۆ��(\�E8�rMk�e��س$)7���fpqYF`�SX[-rS:)� o��i!��m@ag�H%*�n��2��5f�X�JFd�Z��~"{�"��$����I]�VKf��e�(<ey�q��~�h�F1򇩫C2��d�C��X�����޾�����˷�.n�*ņ��)���n�<���8��
�T$���&C5]����3D&~X��oq��'X[�=�'���{DIg��4���f�zH��&�Z����S��\�)r�����ޘF�i�g���Og��$��{u����<wk�)t��uU��n(Z>KDm�<�\�[��u!Ō�9���=�(5ϑ��l��	$�&c�Ɣ�H ��Ō��ō.�gJ��˘v'�]ܝ�[���1mlg*��~S��L����Q����ġWKS$V����%*yJeE�Jp��
rͺzQJ���jÀ::씚p�V�XVA�F��ynJ�"˓��a=厄���y���r�덆�Q�s~r�gҲ����P厮��ґ M��G	 G�����>"��Z����>	�1j���el(cC��PƆ26�����ǔ�d���1�8�u�@�x�猞���?����</�g3���>zE��;k�+���%RR��SώU��/� �*�=@+��	�8����Q�Cg����*S��P�l%>���K��S���a�3т�	�Q�8��F2T�+�����2t��{��*��,!+�?��^�r�Ce��|n����q��'W�;�O���|�
j�.�X}�6��ܑe*��<t�����5v+��Y�4��=� ��A�.U��V|��B�����*�ÁlL����	�!m�U�A�5� ܴez?^B"a�.�� �5K̺�|ւ�O����LM�.��em��"�o�ě�c<ć6s��Zz�n��b��Wi���6aw�]�צ&���q^�l�֙M|��ȕ�WQFQ�J�GP�iуn���P��l�\�&�jx��hjP�����MUS��$����N.-�3��CC	�P���gh�E�]`�����h2��g	�N�W}�oy�\mLQ����)���+���ͱ�=�7�l!����`�O�EC���!"*:��^2[\�U�m2���q�	��z�BLĝ�����
�I�Ti�.؞��@t�����{��n�z�]���c���<�{�,��������M=�ؽ��qf�#��3�n��z�$���J��큟�P P#����(���� y�HyN�6��-PA�gt^�8E��d�!�&vn�i�h��:��n~A�nx�__eJvq,�����C^;cK�'HL�L�Ґ'`~A㐒��ͪ�M�>�:�B����W��ӗ﾿Q*1�����K�n��a+4ߡm����<��<����,��`O�{}��]OS��#Q��д� �nˤ���p[F1�g�>�l�Ŝ��ڥu����|ց�ndb�u����2v�f���!����g#`���E�2�r�yE5_t {�2��$��Y���ț��C!р���K�K��O"V�a�鬠�EA�Έ(��q���n�c'�KEe�Z�k�A�R�ˮ�}���;�5̕+��|���,'�+u槇�}35惪1?�6�M�ݴ�M�ݴ�M�ݴ�M����{���i����i����i����K�ﳯo�O��{���K�|M�y�y�y�y�y�y�y�y����5�aE-O�1j�|M���el(cC��PƆ2~[��1_�9�8�Y��{ i����q��6C\N���O~/_�y07�|N���gg7A��A���b�g��.#$䞳�=���	��'��:'�=�I0�w��NwA���f�x�
����C�U���<A �>�`
:8~1ҵY����p�����E��c�?��94�Q���/\������t�
z��#��ȃ�q�GB����Ő�V9����������=��/�'�!E=-%�a�?���lrX7_��o]�u��j��V����>s0�vN��Bv��6�{��m�ɓ'�!g�%     