PGDMP  $                    }            MariaDB    17.2    17.2 8    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            4           1262    16570    MariaDB    DATABASE     |   CREATE DATABASE "MariaDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Kenya.1252';
    DROP DATABASE "MariaDB";
                     postgres    false            �            1259    16639 
   attendance    TABLE     j  CREATE TABLE public.attendance (
    attendance_id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    attendance_date date NOT NULL,
    status character varying(10) NOT NULL,
    CONSTRAINT attendance_status_check CHECK (((status)::text = ANY ((ARRAY['Present'::character varying, 'Absent'::character varying])::text[])))
);
    DROP TABLE public.attendance;
       public         heap r       postgres    false            �            1259    16638    attendance_attendance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attendance_attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.attendance_attendance_id_seq;
       public               postgres    false    226            5           0    0    attendance_attendance_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.attendance_attendance_id_seq OWNED BY public.attendance.attendance_id;
          public               postgres    false    225            �            1259    16590    courses    TABLE     �   CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(100) NOT NULL,
    credits integer NOT NULL,
    instructor_id integer,
    CONSTRAINT courses_credits_check CHECK (((credits >= 1) AND (credits <= 10)))
);
    DROP TABLE public.courses;
       public         heap r       postgres    false            �            1259    16589    courses_course_id_seq    SEQUENCE     �   CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.courses_course_id_seq;
       public               postgres    false    222            6           0    0    courses_course_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;
          public               postgres    false    221            �            1259    16621    enrollments    TABLE     y  CREATE TABLE public.enrollments (
    enrollment_id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    grade character varying(2),
    CONSTRAINT enrollments_grade_check CHECK (((grade)::text = ANY ((ARRAY['A'::character varying, 'B'::character varying, 'C'::character varying, 'D'::character varying, 'F'::character varying])::text[])))
);
    DROP TABLE public.enrollments;
       public         heap r       postgres    false            �            1259    16620    enrollments_enrollment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enrollments_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.enrollments_enrollment_id_seq;
       public               postgres    false    224            7           0    0    enrollments_enrollment_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.enrollments_enrollment_id_seq OWNED BY public.enrollments.enrollment_id;
          public               postgres    false    223            �            1259    16581    instructors    TABLE     �   CREATE TABLE public.instructors (
    instructor_id integer NOT NULL,
    instructor_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);
    DROP TABLE public.instructors;
       public         heap r       postgres    false            �            1259    16580    instructors_instructor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.instructors_instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.instructors_instructor_id_seq;
       public               postgres    false    220            8           0    0    instructors_instructor_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.instructors_instructor_id_seq OWNED BY public.instructors.instructor_id;
          public               postgres    false    219            �            1259    16572    students    TABLE     �   CREATE TABLE public.students (
    student_id integer NOT NULL,
    student_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);
    DROP TABLE public.students;
       public         heap r       postgres    false            �            1259    16571    students_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.students_student_id_seq;
       public               postgres    false    218            9           0    0    students_student_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;
          public               postgres    false    217            �            1259    16671    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    role character varying(50) NOT NULL,
    student_id integer,
    instructor_id integer
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16670    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public               postgres    false    228            :           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public               postgres    false    227            t           2604    16642    attendance attendance_id    DEFAULT     �   ALTER TABLE ONLY public.attendance ALTER COLUMN attendance_id SET DEFAULT nextval('public.attendance_attendance_id_seq'::regclass);
 G   ALTER TABLE public.attendance ALTER COLUMN attendance_id DROP DEFAULT;
       public               postgres    false    226    225    226            r           2604    16593    courses course_id    DEFAULT     v   ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);
 @   ALTER TABLE public.courses ALTER COLUMN course_id DROP DEFAULT;
       public               postgres    false    222    221    222            s           2604    16624    enrollments enrollment_id    DEFAULT     �   ALTER TABLE ONLY public.enrollments ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollments_enrollment_id_seq'::regclass);
 H   ALTER TABLE public.enrollments ALTER COLUMN enrollment_id DROP DEFAULT;
       public               postgres    false    223    224    224            q           2604    16584    instructors instructor_id    DEFAULT     �   ALTER TABLE ONLY public.instructors ALTER COLUMN instructor_id SET DEFAULT nextval('public.instructors_instructor_id_seq'::regclass);
 H   ALTER TABLE public.instructors ALTER COLUMN instructor_id DROP DEFAULT;
       public               postgres    false    220    219    220            p           2604    16575    students student_id    DEFAULT     z   ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);
 B   ALTER TABLE public.students ALTER COLUMN student_id DROP DEFAULT;
       public               postgres    false    217    218    218            u           2604    16674    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public               postgres    false    227    228    228            ,          0    16639 
   attendance 
   TABLE DATA           c   COPY public.attendance (attendance_id, student_id, course_id, attendance_date, status) FROM stdin;
    public               postgres    false    226   &F       (          0    16590    courses 
   TABLE DATA           Q   COPY public.courses (course_id, course_name, credits, instructor_id) FROM stdin;
    public               postgres    false    222   �F       *          0    16621    enrollments 
   TABLE DATA           R   COPY public.enrollments (enrollment_id, student_id, course_id, grade) FROM stdin;
    public               postgres    false    224    G       &          0    16581    instructors 
   TABLE DATA           L   COPY public.instructors (instructor_id, instructor_name, email) FROM stdin;
    public               postgres    false    220   }G       $          0    16572    students 
   TABLE DATA           C   COPY public.students (student_id, student_name, email) FROM stdin;
    public               postgres    false    218   H       .          0    16671    users 
   TABLE DATA           ]   COPY public.users (user_id, username, password, role, student_id, instructor_id) FROM stdin;
    public               postgres    false    228   uH       ;           0    0    attendance_attendance_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.attendance_attendance_id_seq', 9, true);
          public               postgres    false    225            <           0    0    courses_course_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.courses_course_id_seq', 1, false);
          public               postgres    false    221            =           0    0    enrollments_enrollment_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.enrollments_enrollment_id_seq', 9, true);
          public               postgres    false    223            >           0    0    instructors_instructor_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.instructors_instructor_id_seq', 1, false);
          public               postgres    false    219            ?           0    0    students_student_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.students_student_id_seq', 1, false);
          public               postgres    false    217            @           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 6, true);
          public               postgres    false    227            �           2606    16645    attendance attendance_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (attendance_id);
 D   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_pkey;
       public                 postgres    false    226            �           2606    16596    courses courses_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public                 postgres    false    222            �           2606    16627    enrollments enrollments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id);
 F   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_pkey;
       public                 postgres    false    224            ~           2606    16588 !   instructors instructors_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.instructors DROP CONSTRAINT instructors_email_key;
       public                 postgres    false    220            �           2606    16586    instructors instructors_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (instructor_id);
 F   ALTER TABLE ONLY public.instructors DROP CONSTRAINT instructors_pkey;
       public                 postgres    false    220            z           2606    16579    students students_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.students DROP CONSTRAINT students_email_key;
       public                 postgres    false    218            |           2606    16577    students students_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public                 postgres    false    218            �           2606    16676    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    228            �           2606    16678    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public                 postgres    false    228            �           2606    16651 $   attendance attendance_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_course_id_fkey;
       public               postgres    false    222    4738    226            �           2606    16646 %   attendance attendance_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_student_id_fkey;
       public               postgres    false    4732    218    226            �           2606    16597 "   courses courses_instructor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructors(instructor_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_instructor_id_fkey;
       public               postgres    false    222    220    4736            �           2606    16633 &   enrollments enrollments_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_course_id_fkey;
       public               postgres    false    222    4738    224            �           2606    16628 '   enrollments enrollments_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_student_id_fkey;
       public               postgres    false    4732    224    218            �           2606    16684    users users_instructor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructors(instructor_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.users DROP CONSTRAINT users_instructor_id_fkey;
       public               postgres    false    220    4736    228            �           2606    16679    users users_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_student_id_fkey;
       public               postgres    false    228    4732    218            ,   h   x�3�442615R��FF����@f@Qjqj^	�'X�C�cXޘ,m�K��c��!��H`U`�dV�HV�B!9��y��H6`U���� ��?�      (   r   x��=� @�ٜ�D1���i��Y��)�P�0�}���}�F�i͹��pKk��7�(�#���QZ�T;�,]���O<v�7~�F��mﻭ[M{�O[�F
�+��`���!�      *   M   x�U̱� D��n�c����爁Ʃ�'�@��~��aV�ϓ������l�װ�O?؃��w���{�� q,      &   t   x�34261�(�O�s�OR��,)-�L�O�1J�2�R��3K*�RSJ��L�,9]��sҊRS���K�K9�<�l0]������1Ć��̼D��Լ�T�bG/�A����� �4�      $   d   x�342615��M,�T�J���2��+J�2�R��3K*�RSJ����9��R�s3K28��L�b�E1X��cNb�Т��D h,��np� �0,/      .   �   x�}�M�0���)z(.1n�`Lز��F"�fچp{�L�Y|ｉ�4�ZL�֎�d�ph��J;w���]1�Zh��O�^�t��L9T�С��ܤ�,g��3:�;����?k��?��@�W0�E���!a���D�4/c�׍V�Z�fTZ����]��?��V�     