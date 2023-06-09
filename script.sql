PGDMP     7    ,                {            shop    15.1    15.1 =    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    16657    shop    DATABASE     x   CREATE DATABASE shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE shop;
                postgres    false            �            1259    16659    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16658    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            D           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    16666    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    16665    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            E           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    16768    order_person    TABLE     �   CREATE TABLE public.order_person (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL
);
     DROP TABLE public.order_person;
       public         heap    postgres    false            �            1259    16767    order_person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.order_person_id_seq;
       public          postgres    false    223            F           0    0    order_person_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_person_id_seq OWNED BY public.order_person.id;
          public          postgres    false    222            �            1259    16775    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16774    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    225            G           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    224            �            1259    16687    person    TABLE       CREATE TABLE public.person (
    id integer NOT NULL,
    address character varying(255),
    login character varying(100),
    password character varying(255),
    role character varying(255),
    telephone character varying(255),
    username character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16686    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    219            H           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    218            �            1259    16696    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16782    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    16781    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    227            I           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    226            �            1259    16695    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    221            J           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    220            �           2604    16662    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    16669    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16771    order_person id    DEFAULT     r   ALTER TABLE ONLY public.order_person ALTER COLUMN id SET DEFAULT nextval('public.order_person_id_seq'::regclass);
 >   ALTER TABLE public.order_person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16778 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16690 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16699 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16785    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            1          0    16659    category 
   TABLE DATA                 public          postgres    false    215   5C       3          0    16666    image 
   TABLE DATA                 public          postgres    false    217   �C       9          0    16768    order_person 
   TABLE DATA                 public          postgres    false    223   �H       ;          0    16775    orders 
   TABLE DATA                 public          postgres    false    225   
J       5          0    16687    person 
   TABLE DATA                 public          postgres    false    219   5K       7          0    16696    product 
   TABLE DATA                 public          postgres    false    221   �L       =          0    16782    product_cart 
   TABLE DATA                 public          postgres    false    227   P       K           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            L           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 50, true);
          public          postgres    false    216            M           0    0    order_person_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_person_id_seq', 5, true);
          public          postgres    false    222            N           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 7, true);
          public          postgres    false    224            O           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 3, true);
          public          postgres    false    218            P           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 12, true);
          public          postgres    false    226            Q           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 10, true);
          public          postgres    false    220            �           2606    16664    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    16671    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    16773    order_person order_person_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT order_person_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.order_person DROP CONSTRAINT order_person_pkey;
       public            postgres    false    223            �           2606    16780    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    225            �           2606    16694    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    219            �           2606    16787    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    227            �           2606    16704    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    16713 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    221            �           2606    16793 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    219    225    3216            �           2606    16734 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    215    221    3212            �           2606    16798 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    221    3218    225            �           2606    16788 (   order_person fkep8v4imh31iqqdxnt5isiuhq2    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT fkep8v4imh31iqqdxnt5isiuhq2 FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.order_person DROP CONSTRAINT fkep8v4imh31iqqdxnt5isiuhq2;
       public          postgres    false    223    3216    219            �           2606    16714 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    3218    221    217            �           2606    16808 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    221    227    3218            �           2606    16803 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    219    3216    227            1   ~   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0�¦�.v^ء�i��I�F �\l��|a�Ŧ��da2b΅}v]�~a���[.�� ڂl. ��W$      3   '  x���͊\G��~��نQS�_����b 8;��~̀�!~����<������GIGGG���|�<������{�ח��u^޽���z�6�����������g����x���������.o�,#:3�ˢl���$.*#���W���������y�|�A�3Y�\(�4)+d������^m]π%�J��V'��:��%וB��§�2`�j�dJ��L9�A�nĵ�XJ�yY�KEJ��e�`d�[1v�Y��t
�n�pӵ�S+ʔ۬$�;-����Y��x��@�}�:�4]�*W
qj�l�ӭq�a��j[j�fX	��,�0V� ڦ�)0ݍ[eJȓ�V�,1�9�W^x�p��N�q -�l�3���B�c��Uh��iò�pm��X�
���m�`$�dU-��si���N�a����Q2����*i��s�}IY%r��B�~�ޣ�Ŵe	�E��11�x_�sh�N}�H-Gtp�U�ͳd%zH��9��(h�,,mL��b�s���VO��ϡmK�!,�9_Q�k�-	uz��Q��!�|�=�tt/�$$���%UZc��XM��Bۦ"�5�$
�<�fҦ0������sh�UJϮpi�v�j��A���N|-nW	Y�J��{C%��$10��[�9�~m��F��A��l�I{]4B�QC��ʵ<�R#���f�ޱ�$xX�F�(/�!�xs���*�g��d	LZ���ڊ-{�sN?��]E�s�y������9{n�FoA�9��*k�$����a�IW��l�����[P���L@Lp��y�ga�����!�z�]%%��#^;��&��-�5�*���n�<Nۮ�Zu$$>OH 1pN�S@�m�?��]9���qGX$�\�=�6�����Shi���E���Qɺ�3c�kR���r�Ʒ�-�"2z`H�t;�Qxb�˾��T�a�v�qn!2���F� U#�j��j�z
m��Ԇ���?L/��2R�-F�(h:��]���y&�𶂓R*PA������-�x��G��a[��M���͘��Z���bH���+���x�H�sH1_�!9�ܮRqC�@�n�u������Cv�ar��q�vNs�ζM�:I-Nզ���㞌�Ӷ�萎�ʉ��t���AK u�>Z��Shy�
΀9��[��*�L"H}ێQ�Ж�C�e��k�鶟���_��f6}HE#oY%U���U�K�''�mՙ�}K�5�8��Ee���cwc�\@0����|m�ʒ��u'���b��r�T�ĂG����8m���R5�Be���q*�4�N�.���io����      9      x����j�@E{�v�aW�ά��T)\���V�K �m���g�"ER��roq8��t�8��x~g���Xݦ��n��|��ݐ8K~��2\2g�����8��y��:��XwCڳ�׷�É�g[$J 1��LU�ݖ2K��MQ�Y(�p:�� U� �/;IPg�ٴO���h��8��Nk���(�tJx�u���ѐI���i��ٰ�X�Hl��j���mL}�
�\��EP>�g E)��n5���l~ 1ǒ�      ;     x���;k�0 �=�B[��tw�Ý:d���k��`h�����J�]Z
]��{�w���7/����y�]��1���V]�,s?q����Swʜ��)䑳��Œ^&?͗����?^g���8�x���^7{�"�gK��B� dJ7`��X��,K�$瑒T�	��.Q064	u�s��8����>��' B#ME�@������(��Y�uY8Ph�(���/}
���O��L��!U�Z97ALm�
)s9|���0m��0S������*�@�X,> �a�0      5   �  x����R�@��O�g��AX�(�)C5(Ĕ.���z��v�ةgp�����Ք��������ݏ������@4�}P��T<����(I(��K/�@d%���I�}D��(rq���š�mp��4���R`����W�	����*�L�EX6y�3�V�mY��n]�۩�i<����`�5Z���{se>.��Z�y�'*j�۩IL]�����nI٠�!�-�*���[�*��=vM8��Y'�u����'Ц����%��M��Hh��L���^ӿ�A���$��$I�X��#y'oy��,�y���r���B��b]״�Pk��!�7�.Q�O�#o�c��\>��i�v�|��0u]�_-#�"������={(ʅ�T�����      7   ;  x��U]KQ}�W̋Da���|��>b�j_�&�]H�#�/�$TV
-m��P�C�hֿp�?ꙹ�Ѫ�X��{g��9sf������Y���}Dե�e����*ťB����EŅzi��(᳴X��պ_yiQ����X*�K5��~��嫅Z�yei�8>��^���qz�pjnb��RŜ��Ɠ�����Sn��%2;�dc8U۪�[zY��u���:j_�{�T��z]uH����.��yl�ի���I���޿�`��P��oa/~8���L�)��e�z��縶�J�ߑ�! ��$�3Ei��
|����wX��XSy�N�2^&�I�_����`\�v�K��U��z���p�	�au�:z�=�
J�-Շ�ΗY���_����ل�K{vZ�	XT���	ƅ��@7����],�;�f��Q�єs�T�.���$RY��MmI��*$���Ɍ@��Mz�T��9�;�;*l��禦8�{�K�:�Q�@6I��<-�N`"��dV������Ņ�e�d����b:�q�^(�(���6�oXC����>���&�t�t�M'b��U�K�
O��lc��΀�g�~Gcp�*������Ŋ	�[F��� 燮�K�
=�
����F3�+f��+�E"B!�q�29Ga�M�&K��88�wr[ ��P����$w�{;Q�2gȈs�@(����"zd^������J��湗�ϑ��wZ���|q�c�F#u��=U��s+�!;,b��ɖ[8=<��P���"�g��ڎ�L�S�!����M3�X��;y���7��##���g      =   
   x���         