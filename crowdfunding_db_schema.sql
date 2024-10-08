PGDMP  !    
                |           crowdfunding_db    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16873    crowdfunding_db    DATABASE     �   CREATE DATABASE crowdfunding_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE crowdfunding_db;
                postgres    false            �            1259    16911    campaign    TABLE     ;  CREATE TABLE public.campaign (
    cf_id integer NOT NULL,
    contact_id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    description text NOT NULL,
    goal numeric(10,2) NOT NULL,
    pledged numeric(10,2) NOT NULL,
    outcome character varying(50) NOT NULL,
    backers_count integer NOT NULL,
    country character varying(10) NOT NULL,
    currency character varying(10) NOT NULL,
    launch_date date NOT NULL,
    end_date date NOT NULL,
    category_id character varying(10) NOT NULL,
    subcategory_id character varying(10) NOT NULL
);
    DROP TABLE public.campaign;
       public         heap    postgres    false            �            1259    16879    category    TABLE     ~   CREATE TABLE public.category (
    category_id character varying(10) NOT NULL,
    category character varying(50) NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16884    contacts    TABLE     �   CREATE TABLE public.contacts (
    contact_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);
    DROP TABLE public.contacts;
       public         heap    postgres    false            �            1259    16874    subcategory    TABLE     �   CREATE TABLE public.subcategory (
    subcategory_id character varying(10) NOT NULL,
    subcategory character varying(50) NOT NULL
);
    DROP TABLE public.subcategory;
       public         heap    postgres    false            ,           2606    16917    campaign pk_campaign 
   CONSTRAINT     U   ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT pk_campaign PRIMARY KEY (cf_id);
 >   ALTER TABLE ONLY public.campaign DROP CONSTRAINT pk_campaign;
       public            postgres    false    218            (           2606    16883    category pk_category 
   CONSTRAINT     [   ALTER TABLE ONLY public.category
    ADD CONSTRAINT pk_category PRIMARY KEY (category_id);
 >   ALTER TABLE ONLY public.category DROP CONSTRAINT pk_category;
       public            postgres    false    216            *           2606    16888    contacts pk_contacts 
   CONSTRAINT     Z   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT pk_contacts PRIMARY KEY (contact_id);
 >   ALTER TABLE ONLY public.contacts DROP CONSTRAINT pk_contacts;
       public            postgres    false    217            &           2606    16878    subcategory pk_subcategory 
   CONSTRAINT     d   ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT pk_subcategory PRIMARY KEY (subcategory_id);
 D   ALTER TABLE ONLY public.subcategory DROP CONSTRAINT pk_subcategory;
       public            postgres    false    215            -           2606    16923 "   campaign campaign_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);
 L   ALTER TABLE ONLY public.campaign DROP CONSTRAINT campaign_category_id_fkey;
       public          postgres    false    4648    218    216            .           2606    16928 !   campaign campaign_contact_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(contact_id);
 K   ALTER TABLE ONLY public.campaign DROP CONSTRAINT campaign_contact_id_fkey;
       public          postgres    false    218    4650    217            /           2606    16918 %   campaign campaign_subcategory_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_subcategory_id_fkey FOREIGN KEY (subcategory_id) REFERENCES public.subcategory(subcategory_id);
 O   ALTER TABLE ONLY public.campaign DROP CONSTRAINT campaign_subcategory_id_fkey;
       public          postgres    false    215    4646    218           