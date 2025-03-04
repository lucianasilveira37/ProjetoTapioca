PGDMP                       |            tapioca    17.1    17.0 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16742    tapioca    DATABASE     ~   CREATE DATABASE tapioca WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE tapioca;
                     postgres    false            �            1259    16863    contatos    TABLE     �   CREATE TABLE public.contatos (
    id integer NOT NULL,
    nome character varying(100),
    email character varying(100),
    telefone character varying(20),
    mensagem text,
    data timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.contatos;
       public         heap r       postgres    false            �            1259    16862    contatos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contatos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.contatos_id_seq;
       public               postgres    false    224            �           0    0    contatos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.contatos_id_seq OWNED BY public.contatos.id;
          public               postgres    false    223            �            1259    16744    foods    TABLE     �   CREATE TABLE public.foods (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    price double precision NOT NULL
);
    DROP TABLE public.foods;
       public         heap r       postgres    false            �            1259    16743    foods_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.foods_id_seq;
       public               postgres    false    218            �           0    0    foods_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.foods_id_seq OWNED BY public.foods.id;
          public               postgres    false    217            �            1259    16751    recheios    TABLE     �   CREATE TABLE public.recheios (
    id integer NOT NULL,
    id_food integer NOT NULL,
    name character varying(100) NOT NULL,
    price double precision NOT NULL
);
    DROP TABLE public.recheios;
       public         heap r       postgres    false            �            1259    16750    recheios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recheios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.recheios_id_seq;
       public               postgres    false    220            �           0    0    recheios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.recheios_id_seq OWNED BY public.recheios.id;
          public               postgres    false    219            �            1259    16763    sales    TABLE     �   CREATE TABLE public.sales (
    id integer NOT NULL,
    id_food integer NOT NULL,
    cpf character varying(14) NOT NULL,
    date_sale date NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL
);
    DROP TABLE public.sales;
       public         heap r       postgres    false            �            1259    16762    sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public               postgres    false    222            �           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
          public               postgres    false    221            3           2604    16866    contatos id    DEFAULT     j   ALTER TABLE ONLY public.contatos ALTER COLUMN id SET DEFAULT nextval('public.contatos_id_seq'::regclass);
 :   ALTER TABLE public.contatos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            0           2604    16747    foods id    DEFAULT     d   ALTER TABLE ONLY public.foods ALTER COLUMN id SET DEFAULT nextval('public.foods_id_seq'::regclass);
 7   ALTER TABLE public.foods ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            1           2604    16754    recheios id    DEFAULT     j   ALTER TABLE ONLY public.recheios ALTER COLUMN id SET DEFAULT nextval('public.recheios_id_seq'::regclass);
 :   ALTER TABLE public.recheios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            2           2604    16766    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            �          0    16863    contatos 
   TABLE DATA           M   COPY public.contatos (id, nome, email, telefone, mensagem, data) FROM stdin;
    public               postgres    false    224   �$       �          0    16744    foods 
   TABLE DATA           0   COPY public.foods (id, name, price) FROM stdin;
    public               postgres    false    218   !%       �          0    16751    recheios 
   TABLE DATA           <   COPY public.recheios (id, id_food, name, price) FROM stdin;
    public               postgres    false    220   g%       �          0    16763    sales 
   TABLE DATA           P   COPY public.sales (id, id_food, cpf, date_sale, description, price) FROM stdin;
    public               postgres    false    222   �%       �           0    0    contatos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.contatos_id_seq', 1, true);
          public               postgres    false    223            �           0    0    foods_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.foods_id_seq', 3, true);
          public               postgres    false    217            �           0    0    recheios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.recheios_id_seq', 7, true);
          public               postgres    false    219            �           0    0    sales_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sales_id_seq', 6, true);
          public               postgres    false    221            <           2606    16871    contatos contatos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contatos
    ADD CONSTRAINT contatos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contatos DROP CONSTRAINT contatos_pkey;
       public                 postgres    false    224            6           2606    16749    foods foods_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foods_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.foods DROP CONSTRAINT foods_pkey;
       public                 postgres    false    218            8           2606    16756    recheios recheios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.recheios
    ADD CONSTRAINT recheios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.recheios DROP CONSTRAINT recheios_pkey;
       public                 postgres    false    220            :           2606    16770    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public                 postgres    false    222            =           2606    16757    recheios recheios_id_food_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recheios
    ADD CONSTRAINT recheios_id_food_fkey FOREIGN KEY (id_food) REFERENCES public.foods(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.recheios DROP CONSTRAINT recheios_id_food_fkey;
       public               postgres    false    220    218    4662            >           2606    16771    sales sales_id_food_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_id_food_fkey FOREIGN KEY (id_food) REFERENCES public.foods(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_id_food_fkey;
       public               postgres    false    222    4662    218            �   l   x��1�0��9��!����N�������Q��P�B����:��O�_�Fw�s3_�F�)�}�t�𜝍W{8F�r{�
��6����?K4]��T�%\c��o�      �   6   x�3�I,��ON�44�2�t.-N.��44�2�N�K)=�09#��Д+F��� 0��      �   I   x�3�4�,M����4�2r܊���9���������Ҽ�|NC=S.N#�RS E֌�!k������� NZ      �   t   x�3�4�4426153��40�4202�54�50�,M����Qp+J�K��44�2�4ⴴ073516240@(6�+(J-.�+)�3�2j0D L�9M�L�Qd
r'>E��4#Eq� �Z9�     