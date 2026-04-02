--
-- PostgreSQL database dump
--

\restrict p3axXuV75y65DXODEKPGfWFpggHf5Mes6vivbwrBS1hXoYUUdgZXytaYhE4olDz

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_categoria;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_nombre_unique;
ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.usuarios_id_seq;
DROP TABLE public.usuarios;
DROP SEQUENCE public.productos_id_seq;
DROP TABLE public.productos;
DROP SEQUENCE public.categoria_id_seq;
DROP TABLE public.categoria;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(100)
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_seq OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio numeric(10,2) NOT NULL,
    stock integer DEFAULT 0,
    descripcion text,
    imagen_url text,
    id_categoria integer,
    youtube_id character varying(150),
    latitud numeric(10,6) DEFAULT 20.5408097,
    longitud numeric(10,6) DEFAULT '-100.3172998'::numeric
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: TABLE productos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.productos IS 'Esta tabla contiene productos';


--
-- Name: COLUMN productos.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productos.id IS 'ID de cada producto';


--
-- Name: COLUMN productos.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productos.nombre IS 'Nombre del producto';


--
-- Name: COLUMN productos.precio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productos.precio IS 'Precio del producto';


--
-- Name: COLUMN productos.stock; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.productos.stock IS 'Cantidad disponible en inventario';


--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    role character varying(50) DEFAULT 'user'::character varying
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nombre) FROM stdin;
83	Tecnología
23	men's clothing
27	jewelery
31	electronics
37	women's clothing
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, nombre, precio, stock, descripcion, imagen_url, id_categoria, youtube_id, latitud, longitud) FROM stdin;
69	Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops	109.95	25	Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday	https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png	23	\N	20.540810	-100.317300
70	Mens Casual Premium Slim Fit T-Shirts 	22.30	47	Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.	https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png	23	\N	20.540810	-100.317300
71	Mens Cotton Jacket	55.99	4	great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.	https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png	23	\N	20.540810	-100.317300
72	Mens Casual Slim Fit	15.99	42	The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.	https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png	23	\N	20.540810	-100.317300
73	John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet	695.00	24	From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.	https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
74	Solid Gold Petite Micropave 	168.00	2	Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.	https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
75	White Gold Plated Princess	9.99	19	Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...	https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
76	Pierced Owl Rose Gold Plated Stainless Steel Double	10.99	14	Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel	https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
77	WD 2TB Elements Portable External Hard Drive - USB 3.0 	64.00	33	USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system	https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png	31	\N	20.540810	-100.317300
78	SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s	109.00	31	Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)	https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png	31	\N	20.540810	-100.317300
79	Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5	109.00	10	3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.	https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png	31	\N	20.540810	-100.317300
80	WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive	114.00	34	Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty	https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png	31	\N	20.540810	-100.317300
81	Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin	599.00	23	21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz	https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png	31	\N	20.540810	-100.317300
82	Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED 	999.99	27	49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag	https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png	31	\N	20.540810	-100.317300
83	BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats	56.99	10	Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates	https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png	37	\N	20.540810	-100.317300
84	Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket	29.95	15	100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON	https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png	37	\N	20.540810	-100.317300
120	WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive	114.00	2	Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty	https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png	31	\N	20.540810	-100.317300
68	Monitor 24	3200.00	8	mouse	https://fakestoreapi.com/img/9890q9.png	83	\N	20.540810	-100.317300
85	Rain Jacket Women Windbreaker Striped Climbing Raincoats	39.99	40	Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.	https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png	37	\N	20.540810	-100.317300
86	MBJ Women's Solid Short Sleeve Boat Neck V 	9.85	28	95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem	https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png	37	\N	20.540810	-100.317300
87	Opna Women's Short Sleeve Moisture	7.95	48	100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort	https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png	37	\N	20.540810	-100.317300
88	DANVOUY Womens T Shirt Casual Cotton Short	12.99	32	95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.	https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png	37	\N	20.540810	-100.317300
89	Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops	109.95	35	Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday	https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png	23	\N	20.540810	-100.317300
90	Mens Casual Premium Slim Fit T-Shirts 	22.30	12	Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.	https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png	23	\N	20.540810	-100.317300
91	Mens Cotton Jacket	55.99	36	great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.	https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png	23	\N	20.540810	-100.317300
92	Mens Casual Slim Fit	15.99	50	The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.	https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png	23	\N	20.540810	-100.317300
93	John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet	695.00	25	From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.	https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
94	Solid Gold Petite Micropave 	168.00	13	Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.	https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
95	White Gold Plated Princess	9.99	8	Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...	https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
96	Pierced Owl Rose Gold Plated Stainless Steel Double	10.99	13	Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel	https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
97	WD 2TB Elements Portable External Hard Drive - USB 3.0 	64.00	1	USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system	https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png	31	\N	20.540810	-100.317300
98	SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s	109.00	36	Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)	https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png	31	\N	20.540810	-100.317300
99	Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5	109.00	43	3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.	https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png	31	\N	20.540810	-100.317300
100	WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive	114.00	21	Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty	https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png	31	\N	20.540810	-100.317300
101	Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin	599.00	11	21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz	https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png	31	\N	20.540810	-100.317300
102	Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED 	999.99	35	49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag	https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png	31	\N	20.540810	-100.317300
103	BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats	56.99	20	Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates	https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png	37	\N	20.540810	-100.317300
104	Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket	29.95	43	100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON	https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png	37	\N	20.540810	-100.317300
105	Rain Jacket Women Windbreaker Striped Climbing Raincoats	39.99	13	Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.	https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png	37	\N	20.540810	-100.317300
106	MBJ Women's Solid Short Sleeve Boat Neck V 	9.85	5	95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem	https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png	37	\N	20.540810	-100.317300
107	Opna Women's Short Sleeve Moisture	7.95	28	100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort	https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png	37	\N	20.540810	-100.317300
108	DANVOUY Womens T Shirt Casual Cotton Short	12.99	14	95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.	https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png	37	\N	20.540810	-100.317300
109	Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops	109.95	29	Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday	https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png	23	\N	20.540810	-100.317300
110	Mens Casual Premium Slim Fit T-Shirts 	22.30	15	Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.	https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png	23	\N	20.540810	-100.317300
111	Mens Cotton Jacket	55.99	44	great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.	https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png	23	\N	20.540810	-100.317300
112	Mens Casual Slim Fit	15.99	15	The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.	https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png	23	\N	20.540810	-100.317300
113	John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet	695.00	31	From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.	https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
114	Solid Gold Petite Micropave 	168.00	22	Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.	https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
115	White Gold Plated Princess	9.99	10	Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...	https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
116	Pierced Owl Rose Gold Plated Stainless Steel Double	10.99	34	Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel	https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png	27	\N	20.540810	-100.317300
117	WD 2TB Elements Portable External Hard Drive - USB 3.0 	64.00	22	USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system	https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png	31	\N	20.540810	-100.317300
118	SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s	109.00	6	Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)	https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png	31	\N	20.540810	-100.317300
119	Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5	109.00	30	3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.	https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png	31	\N	20.540810	-100.317300
121	Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin	599.00	10	21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz	https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png	31	\N	20.540810	-100.317300
122	Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED 	999.99	1	49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag	https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png	31	\N	20.540810	-100.317300
123	BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats	56.99	27	Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates	https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png	37	\N	20.540810	-100.317300
124	Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket	29.95	1	100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON	https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png	37	\N	20.540810	-100.317300
125	Rain Jacket Women Windbreaker Striped Climbing Raincoats	39.99	19	Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.	https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png	37	\N	20.540810	-100.317300
126	MBJ Women's Solid Short Sleeve Boat Neck V 	9.85	10	95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem	https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png	37	\N	20.540810	-100.317300
127	Opna Women's Short Sleeve Moisture	7.95	19	100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort	https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png	37	\N	20.540810	-100.317300
128	DANVOUY Womens T Shirt Casual Cotton Short	12.99	35	95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.	https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png	37	\N	20.540810	-100.317300
66	Laptop Dev	15000.00	5	LAP	https://png.pngtree.com/png-vector/20250304/ourmid/pngtree-sleek-modern-laptop-with-high-resolution-display-png-image_15711292.png	83	\N	20.540810	-100.317300
67	Mouse logi	250.50	20	mouse	https://fakestoreapi.com/img/98909.png	83	\N	20.540810	-100.317300
129	Chamarra	50.00	\N	Simon	http://imagen	\N	\N	20.540810	-100.317300
130	Chamarra	50.00	4	simon	https:ejemplo.png	\N	\N	20.540810	-100.317300
131	houdini	500.00	40	simon		\N	https://www.youtube.com/watch?v=_GMQLjzVGfw&list=RD_GMQLjzVGfw&start_radio=1	20.540810	-100.317300
132	hi	522.00	5	simon		\N	https://www.youtube.com/watch?v=_GMQLjzVGfw&list=RD_GMQLjzVGfw&start_radio=1	20.540810	-100.317300
133	ssj	22.00	4	si		\N	https://www.youtube.com/watch?v=_GMQLjzVGfw&list=RD_GMQLjzVGfw&start_radio=1	20.540810	-100.317300
134	his	500.00	5	si		\N	https://www.youtube.com/watch?v=_GMQLjzVGfw&list=RD_GMQLjzVGfw&start_radio=1	20.540810	-100.317300
135	Rick Roll	5.00	4	xd		\N	https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=RDdQw4w9WgXcQ&start_radio=1	20.540810	-100.317300
136	s	4.00	4	s		\N	https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=RDdQw4w9WgXcQ&start_radio=1	20.540810	-100.317300
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, email, password, role) FROM stdin;
1	124049120@upq.edu.mx	$2b$10$sel8bfLIvrDzxlFMPU2T8OKxJ.Nip4LDv8LXAJhaCMz598OcezDQ6	user
\.


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 83, true);


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 136, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);


--
-- Name: categoria categoria_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nombre_unique UNIQUE (nombre);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: productos fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id);


--
-- PostgreSQL database dump complete
--

\unrestrict p3axXuV75y65DXODEKPGfWFpggHf5Mes6vivbwrBS1hXoYUUdgZXytaYhE4olDz
