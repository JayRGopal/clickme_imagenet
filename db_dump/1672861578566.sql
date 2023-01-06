--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clicks; Type: TABLE; Schema: public; Owner: mircs
--

CREATE TABLE public.clicks (
    _id bigint NOT NULL,
    high_score double precision,
    date timestamp with time zone
);


ALTER TABLE public.clicks OWNER TO mircs;

--
-- Name: clicks__id_seq; Type: SEQUENCE; Schema: public; Owner: mircs
--

CREATE SEQUENCE public.clicks__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clicks__id_seq OWNER TO mircs;

--
-- Name: clicks__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mircs
--

ALTER SEQUENCE public.clicks__id_seq OWNED BY public.clicks._id;


--
-- Name: cnn; Type: TABLE; Schema: public; Owner: mircs
--

CREATE TABLE public.cnn (
    _id bigint NOT NULL,
    sixteen_baseline_accuracy double precision,
    nineteen_baseline_accuracy double precision,
    sixteen_attention_accuracy double precision,
    nineteen_attention_accuracy double precision,
    epochs bigint,
    date character varying
);


ALTER TABLE public.cnn OWNER TO mircs;

--
-- Name: cnn__id_seq; Type: SEQUENCE; Schema: public; Owner: mircs
--

CREATE SEQUENCE public.cnn__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cnn__id_seq OWNER TO mircs;

--
-- Name: cnn__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mircs
--

ALTER SEQUENCE public.cnn__id_seq OWNED BY public.cnn._id;


--
-- Name: image_count; Type: TABLE; Schema: public; Owner: mircs
--

CREATE TABLE public.image_count (
    _id bigint NOT NULL,
    num_images bigint,
    current_generation bigint,
    iteration_generation bigint,
    generations_per_epoch bigint
);


ALTER TABLE public.image_count OWNER TO mircs;

--
-- Name: image_count__id_seq; Type: SEQUENCE; Schema: public; Owner: mircs
--

CREATE SEQUENCE public.image_count__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_count__id_seq OWNER TO mircs;

--
-- Name: image_count__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mircs
--

ALTER SEQUENCE public.image_count__id_seq OWNED BY public.image_count._id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: mircs
--

CREATE TABLE public.images (
    _id bigint NOT NULL,
    image_path character varying,
    syn_name character varying,
    click_path json,
    answers json,
    generations bigint
);


ALTER TABLE public.images OWNER TO mircs;

--
-- Name: images__id_seq; Type: SEQUENCE; Schema: public; Owner: mircs
--

CREATE SEQUENCE public.images__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images__id_seq OWNER TO mircs;

--
-- Name: images__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mircs
--

ALTER SEQUENCE public.images__id_seq OWNED BY public.images._id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: mircs
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO mircs;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mircs
--

CREATE TABLE public.users (
    _id bigint NOT NULL,
    cookie character varying,
    name character varying,
    score double precision,
    email character varying,
    last_click_time timestamp with time zone
);


ALTER TABLE public.users OWNER TO mircs;

--
-- Name: users__id_seq; Type: SEQUENCE; Schema: public; Owner: mircs
--

CREATE SEQUENCE public.users__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users__id_seq OWNER TO mircs;

--
-- Name: users__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mircs
--

ALTER SEQUENCE public.users__id_seq OWNED BY public.users._id;


--
-- Name: clicks _id; Type: DEFAULT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.clicks ALTER COLUMN _id SET DEFAULT nextval('public.clicks__id_seq'::regclass);


--
-- Name: cnn _id; Type: DEFAULT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.cnn ALTER COLUMN _id SET DEFAULT nextval('public.cnn__id_seq'::regclass);


--
-- Name: image_count _id; Type: DEFAULT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.image_count ALTER COLUMN _id SET DEFAULT nextval('public.image_count__id_seq'::regclass);


--
-- Name: images _id; Type: DEFAULT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.images ALTER COLUMN _id SET DEFAULT nextval('public.images__id_seq'::regclass);


--
-- Name: users _id; Type: DEFAULT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.users ALTER COLUMN _id SET DEFAULT nextval('public.users__id_seq'::regclass);


--
-- Data for Name: clicks; Type: TABLE DATA; Schema: public; Owner: mircs
--

COPY public.clicks (_id, high_score, date) FROM stdin;
2	0	\N
1	2014.7588	\N
\.


--
-- Data for Name: cnn; Type: TABLE DATA; Schema: public; Owner: mircs
--

COPY public.cnn (_id, sixteen_baseline_accuracy, nineteen_baseline_accuracy, sixteen_attention_accuracy, nineteen_attention_accuracy, epochs, date) FROM stdin;
\.


--
-- Data for Name: image_count; Type: TABLE DATA; Schema: public; Owner: mircs
--

COPY public.image_count (_id, num_images, current_generation, iteration_generation, generations_per_epoch) FROM stdin;
1	250	1	0	1
2	250	1	0	1
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: mircs
--

COPY public.images (_id, image_path, syn_name, click_path, answers, generations) FROM stdin;
20	images/1_9.jpg	 golfclub	{"x":[["96","32"],[]],"y":[["96","34"],[]]}	{"answers":["wrong","skip"]}	0
100	images/10_7.jpg	 snorkel	\N	{"answers":["skip","skip"]}	0
153	images/20_6.jpg	 dolphin	{"x":[["94","72"],[],[]],"y":[["93","72"],[],[]]}	{"answers":["correct","correct","skip"]}	0
480	images/3_8.jpg	 tooth	\N	{"answers":["skip"]}	0
135	images/3_8.jpg	 tooth	\N	{"answers":["skip"]}	0
201	images/18_8.jpg	 skateboard	{"x":[["134","118"],[],[],[]],"y":[["135","118"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
481	images/19_5.jpg	 saw	\N	{"answers":["skip"]}	0
25	images/6_4.jpg	 fireplace	{"x":[["202","219"],[],[]],"y":[["200","219"],[],[]]}	{"answers":["correct","correct","skip"]}	0
192	images/16_1.jpg	 suitcase	{"x":[["216","207"],[],[]],"y":[["216","201"],[],[]]}	{"answers":["correct","correct","skip"]}	0
93	images/10_5.jpg	 snorkel	{"x":[["181","148"],[],[],[],[]],"y":[["181","147"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
10	images/22_0.jpg	 door	{"x":[["53","88"],[],[]],"y":[["53","89"],[],[]]}	{"answers":["correct","correct","skip"]}	0
8	images/22_4.jpg	 door	{"x":[["59","49"],[],[],[],[]],"y":[["59","50"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
187	images/15_3.jpg	 triangle	{"x":[["113","23"],[],[]],"y":[["112","23"],[],[]]}	{"answers":["correct","correct","skip"]}	0
65	images/8_2.jpg	 carrot	{"x":[["148","141"],[],[],[]],"y":[["148","140"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
148	images/21_1.jpg	 map	\N	{"answers":["skip","skip"]}	0
72	images/17_7.jpg	 pear	\N	{"answers":["skip","skip"]}	0
49	images/23_3.jpg	 knife	\N	{"answers":["skip","skip"]}	0
12	images/1_8.jpg	 golfclub	\N	{"answers":["skip","skip"]}	0
52	images/24_5.jpg	 flashlight	{"x":[["168","77"],[],[]],"y":[["167","77"],[],[]]}	{"answers":["correct","correct","skip"]}	0
86	images/0_1.jpg	 microwave	\N	{"answers":["skip","skip","skip"]}	0
109	images/4_3.jpg	 cathead	{"x":[["135","101"],[]],"y":[["132","101"],[]]}	{"answers":["wrong","skip"]}	0
76	images/17_8.jpg	 pear	{"x":[["141","20"],[],[],[]],"y":[["141","21"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
107	images/4_6.jpg	 cathead	{"x":[["95","69"],[]],"y":[["94","69"],[]]}	{"answers":["wrong","skip"]}	0
78	images/17_6.jpg	 pear	{"x":[["172","22"],[],[],[],[]],"y":[["172","23"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
90	images/0_3.jpg	 microwave	\N	{"answers":["skip","correct","correct","correct"]}	0
111	images/2_3.jpg	 houseplant	{"x":[["84","49"],[]],"y":[["84","56"],[]]}	{"answers":["wrong","skip"]}	0
9	images/22_1.jpg	 door	{"x":[["85","96.6015625"],[],[],[],[]],"y":[["86","95.6015625"],[],[],[],[]]}	{"answers":["skip","correct","correct","correct","correct","correct"]}	0
44	images/23_8.jpg	 knife	\N	{"answers":["skip","skip"]}	0
17	images/1_7.jpg	 golfclub	{"x":[["89","24"],[]],"y":[["89","27"],[]]}	{"answers":["wrong","skip"]}	0
23	images/6_3.jpg	 fireplace	{"x":[["128","188"],[]],"y":[["126","188"],[]]}	{"answers":["correct","skip"]}	0
28	images/6_1.jpg	 fireplace	{"x":[["158","152"],[],[],[]],"y":[["158","151"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
54	images/24_7.jpg	 flashlight	{"x":[["195","132"],[],[]],"y":[["194","132"],[],[]]}	{"answers":["correct","correct","skip"]}	0
50	images/23_6.jpg	 knife	\N	{"answers":["skip"]}	0
40	images/7_3.jpg	 t-shirt	{"x":[["164","85"],[],[],[]],"y":[["164","87"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
73	images/17_1.jpg	 pear	{"x":[["125","58"],[],[]],"y":[["123","60"],[],[]]}	{"answers":["correct","correct","skip"]}	0
53	images/24_4.jpg	 flashlight	{"x":[["89","225"],[],[]],"y":[["91","225"],[],[]]}	{"answers":["correct","correct","skip"]}	0
46	images/23_2.jpg	 knife	{"x":[["51","98"],[],[]],"y":[["50","98"],[],[]]}	{"answers":["correct","correct","skip"]}	0
103	images/4_7.jpg	 cathead	{"x":[["99","91"],[]],"y":[["98","91"],[]]}	{"answers":["wrong","skip"]}	0
68	images/8_7.jpg	 carrot	{"x":[["154","129"],[],[],[]],"y":[["154","130"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
105	images/4_4.jpg	 cathead	{"x":[["58","178"],[]],"y":[["58","177"],[]]}	{"answers":["wrong","skip"]}	0
102	images/4_9.jpg	 cathead	{"x":[["183","188"],[]],"y":[["183","190"],[]]}	{"answers":["wrong","skip"]}	0
113	images/2_9.jpg	 houseplant	{"x":[["72","65"],[]],"y":[["72","68"],[]]}	{"answers":["wrong","skip"]}	0
59	images/24_6.jpg	 flashlight	\N	{"answers":["skip","skip"]}	0
60	images/24_8.jpg	 flashlight	\N	{"answers":["skip"]}	0
98	images/10_3.jpg	 snorkel	{"x":[["16","106"],[]],"y":[["16","107"],[]]}	{"answers":["correct","skip"]}	0
110	images/4_1.jpg	 cathead	{"x":[["80","102"],[]],"y":[["80","97"],[]]}	{"answers":["wrong","skip"]}	0
11	images/1_0.jpg	 golfclub	{"x":[["89","37"],[]],"y":[["89","40"],[]]}	{"answers":["wrong","skip"]}	0
30	images/6_0.jpg	 fireplace	{"x":[["128","39"],[]],"y":[["128","42"],[]]}	{"answers":["correct","skip"]}	0
57	images/24_2.jpg	 flashlight	\N	{"answers":["skip","skip"]}	0
478	images/3_2.jpg	 tooth	\N	{"answers":["skip"]}	0
14	images/1_4.jpg	 golfclub	{"x":[["117","19"],[]],"y":[["117","20"],[]]}	{"answers":["wrong","skip"]}	0
18	images/1_5.jpg	 golfclub	{"x":[["86","34"],[]],"y":[["86","35"],[]]}	{"answers":["wrong","skip"]}	0
35	images/7_9.jpg	 t-shirt	{"x":[["175","81"],[],[]],"y":[["177","84"],[],[]]}	{"answers":["correct","correct","skip"]}	0
43	images/23_7.jpg	 knife	{"x":[["150","122"],[],[]],"y":[["151","122"],[],[]]}	{"answers":["correct","correct","skip"]}	0
55	images/24_0.jpg	 flashlight	\N	{"answers":["skip","skip"]}	0
112	images/2_8.jpg	 houseplant	{"x":[["100","67"],["89","91","94","97","100","107","111","117","122","125","128","133","136","140","143","145","147","148","150","152","153","155","157","160","161","164","168","170","172","177","179","181","184","185","187","188","189","190","190","188","182","178","176","169","162","157","150","143.20900249898267","137","133","127","123","122","120","119","119","119","120.69774937525433","122.52541240606628","125.0051670523915","127.8230885002949","130.63336453087268","133.42951705480215","136.21553665449227","138.72784286699067","141.2106574945742","143.7144036544544","146.09859694523433","148.3684036333068","150.4140796236905","152.96200001547004","155","155","154.303473966853","152.9875470605552","151.71496534716238","150.19926509540366","148.72609269918692","147.06353818584478","145.5253752460686","144.08218209258774","142.49471164005897","140.98168656138606","139.46866148271315","138","141","143.75743509005417","145.74669893711112","148.77761064849395","150.75550541979644","153","154","154","150.4729028213314","146.97495022273756","143.29203392406157","139.49457628448368","135.67726925015452","132.09017434432585","128.22607690232576","127","127","127.98994949366117","130.44197083729404","133.30928115511617","135.91660796799502","138.41217728098323","140.83971621354615","143.3184544120685","145.64675519419276","147.93915930959335","150.1654124750035","152.4572641386701","154.71147021659746","156.96567629452483","159.2198823724522","161.47408845037955","163.72829452830692","165.69884993572649","167.66940534314608","169","162.00792303592894","155.17456229946367","148.53650993214745","141.89845756483123","135.260405197515","128.6223528301988","121.98430046288257","115.34624809556635","108.70819572825013","102.07014336093391","95.43209099361769","89"],[]],"y":[["99","67"],["165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","164","164","164","164","164","164","164","163","163","163","162","162","161","161","160","160","160","159","159","158","157","157","157","157","157","157","158.69774937525432","161","162","165","166","167","168","168","167","164","157.20900249898267","150.45181019405283","143.90575665821703","137.49800208165544","131.08689074024514","124.66960696415086","118.24791756103096","111.7142878275182","105.16939428177912","98.63247947685124","92.05101897387776","85.42923842792325","78.73482211711858","72.2149983712529","66","73","79.96526033146992","86.84045751971706","93.7238095943053","100.5577435087369","107.40097104338933","114.2006704845533","121.02958363165797","127.87919628652729","134.69681592701386","141.53134261957325","148.36586931213265","155","149","142.5659847898736","135.8545893055654","129.5447894515445","122.83003463296367","119","116","115","121.04645230628904","127.10981173963874","133.06263691235688","138.9430548801217","144.81060692553734","150.82165925741552","156.65850352111903","158","157","150.07035354437184","143.5138612405276","137.12805420137346","130.63175934269879","124.09171853211728","117.5261222354439","110.97968374240159","104.37824333382716","97.7642518482192","91.12770177732385","84.51351883823389","77.88641125209683","71.25930366595978","64.63219607982272","58.00508849368566","51.377980907548604","44.66106856732193","37.94415622709525","32","31.667043954091852","30.148761686088","27.926991948071148","25.705222210054295","23.483452472037442","21.26168273402059","19.039912996003736","16.818143257986883","14.59637351997003","12.374603781953176","10.152834043936327","8"],[]]}	{"answers":["wrong","wrong","skip"]}	0
286	images/5_8.jpg	 truck	\N	{"answers":["skip","skip"]}	0
56	images/24_1.jpg	 flashlight	\N	{"answers":["skip","skip"]}	0
92	images/10_0.jpg	 snorkel	{"x":[["210","171"],[],[],[]],"y":[["210","168"],[],[],[]]}	{"answers":["wrong","correct","skip","skip"]}	0
169	images/5_7.jpg	 truck	{"x":[["59","161"],[],[]],"y":[["58","161"],[],[]]}	{"answers":["correct","correct","skip"]}	0
131	images/3_9.jpg	 tooth	\N	{"answers":["skip"]}	0
156	images/20_4.jpg	 dolphin	{"x":[["111","73"],[],[]],"y":[["109","73"],[],[]]}	{"answers":["correct","correct","skip"]}	0
142	images/21_6.jpg	 map	{"x":[["86","32"],[]],"y":[["86","36"],[]]}	{"answers":["wrong","skip"]}	0
155	images/20_9.jpg	 dolphin	{"x":[["108","93"],[],[],[],[],[]],"y":[["105","93"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip","skip"]}	0
195	images/16_4.jpg	 suitcase	{"x":[["65","79"],[],[],[]],"y":[["67","77"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
119	images/2_0.jpg	 houseplant	{"x":[["154","19"],[]],"y":[["153","19"],[]]}	{"answers":["wrong","skip"]}	0
128	images/11_9.jpg	 megaphone	\N	{"answers":["skip","skip"]}	0
166	images/5_8.jpg	 truck	\N	{"answers":["skip","skip"]}	0
132	images/3_6.jpg	 tooth	\N	{"answers":["skip","skip"]}	0
443	images/21_6.jpg	 map	{"x":[["86","32"],[]],"y":[["86","36"],[]]}	{"answers":["wrong","skip"]}	0
160	images/20_0.jpg	 dolphin	\N	{"answers":["skip","skip"]}	0
121	images/11_0.jpg	 megaphone	\N	{"answers":["skip","skip"]}	0
144	images/21_0.jpg	 map	{"x":[["70","159"],[],[]],"y":[["68","159"],[],[]]}	{"answers":["correct","correct","skip"]}	0
174	images/19_3.jpg	 saw	\N	{"answers":["correct","skip","skip"]}	0
368	images/10_5.jpg	 snorkel	{"x":[["181","148"],[],[],[],[]],"y":[["181","147"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
207	images/18_4.jpg	 skateboard	\N	{"answers":["skip","skip"]}	0
177	images/19_4.jpg	 saw	{"x":[["36","157"],[],[]],"y":[["43","157"],[],[]]}	{"answers":["correct","correct","skip"]}	0
120	images/2_2.jpg	 houseplant	{"x":[["173","232"],[]],"y":[["173","231"],[]]}	{"answers":["wrong","skip"]}	0
152	images/20_3.jpg	 dolphin	\N	{"answers":["skip","skip"]}	0
136	images/3_2.jpg	 tooth	\N	{"answers":["skip"]}	0
202	images/18_0.jpg	 skateboard	{"x":[["27","114"],[],[],[]],"y":[["28","114"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
188	images/15_9.jpg	 triangle	{"x":[["164","87"],[],[],[]],"y":[["164","90"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
223	images/9_6.jpg	 pizza slice	\N	{"answers":["skip"]}	0
117	images/2_7.jpg	 houseplant	{"x":[["123","126"],[]],"y":[["123","125"],[]]}	{"answers":["wrong","skip"]}	0
225	images/9_8.jpg	 pizza slice	{"x":[["192","67"],[],[]],"y":[["192","68"],[],[]]}	{"answers":["correct","correct","skip"]}	0
133	images/3_7.jpg	 tooth	{"x":[["75","123"],[],[]],"y":[["75","122"],[],[]]}	{"answers":["correct","correct","skip"]}	0
129	images/11_5.jpg	 megaphone	\N	{"answers":["skip","skip"]}	0
205	images/18_7.jpg	 skateboard	\N	{"answers":["skip","skip"]}	0
163	images/5_9.jpg	 truck	\N	{"answers":["skip","skip"]}	0
151	images/20_8.jpg	 dolphin	{"x":[["101","55"],[],[]],"y":[["100","56"],[],[]]}	{"answers":["correct","correct","skip"]}	0
123	images/11_8.jpg	 megaphone	{"x":[["107","156"],[],[],[],[]],"y":[["110","156"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
161	images/5_6.jpg	 truck	{"x":[["28","73"],[]],"y":[["28","76"],[]]}	{"answers":["wrong","skip"]}	0
122	images/11_3.jpg	 megaphone	\N	{"answers":["skip","skip"]}	0
199	images/16_9.jpg	 suitcase	{"x":[["22","137"],[],[],[],[]],"y":[["22","135"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
139	images/3_4.jpg	 tooth	{"x":[["90","102"],[],[],[]],"y":[["90","104"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
210	images/18_6.jpg	 skateboard	\N	{"answers":["skip","skip"]}	0
158	images/20_1.jpg	 dolphin	\N	{"answers":["skip","skip"]}	0
213	images/14_2.jpg	 shorts	{"x":[["21","153"],[],[]],"y":[["21","154"],[],[]]}	{"answers":["correct","correct","skip"]}	0
178	images/19_2.jpg	 saw	\N	{"answers":["skip","skip"]}	0
118	images/2_4.jpg	 houseplant	{"x":[["162","22"],[]],"y":[["159","22"],[]]}	{"answers":["wrong","skip"]}	0
143	images/21_3.jpg	 map	{"x":[["50","35"],[],[],[],[]],"y":[["50","36"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
186	images/15_1.jpg	 triangle	{"x":[["52","189"],[],[],[]],"y":[["52","187"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
182	images/15_2.jpg	 triangle	{"x":[["45","215"],[],[]],"y":[["45","214"],[],[]]}	{"answers":["correct","correct","skip"]}	0
150	images/21_9.jpg	 map	{"x":[["66","40"],[]],"y":[["61","40"],[]]}	{"answers":["wrong","skip"]}	0
194	images/16_2.jpg	 suitcase	{"x":[["76","67"],[],[]],"y":[["77","66"],[],[]]}	{"answers":["correct","correct","skip"]}	0
224	images/9_5.jpg	 pizza slice	{"x":[["173","62"],[],[]],"y":[["173","63"],[],[]]}	{"answers":["correct","correct","skip"]}	0
134	images/3_5.jpg	 tooth	{"x":[["60","76"],[],[]],"y":[["60","79"],[],[]]}	{"answers":["correct","correct","skip"]}	0
116	images/2_6.jpg	 houseplant	{"x":[["179","151"],[]],"y":[["179","153"],[]]}	{"answers":["wrong","skip"]}	0
251	images/6_0.jpg	 fireplace	{"x":[["128","39"],[]],"y":[["128","42"],[]]}	{"answers":["correct","skip"]}	0
217	images/14_3.jpg	 shorts	\N	{"answers":["skip","skip"]}	0
216	images/14_6.jpg	 shorts	\N	{"answers":["skip","skip"]}	0
146	images/21_2.jpg	 map	\N	{"answers":["skip","skip"]}	0
227	images/9_9.jpg	 pizza slice	{"x":[["71","67"],[],[],[]],"y":[["71","71"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
249	images/13_9.jpg	 cactus	{"x":[["123","232"],[],[]],"y":[["123","229"],[],[]]}	{"answers":["correct","correct","skip"]}	0
47	images/23_9.jpg	 knife	{"x":[["153","163"],[],[],[]],"y":[["155","163"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
13	images/1_2.jpg	 golfclub	{"x":[["88","22"],[]],"y":[["88","23"],[]]}	{"answers":["wrong","skip"]}	0
70	images/8_6.jpg	 carrot	{"x":[["192","24"],[],[],[]],"y":[["191","24"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
219	images/14_7.jpg	 shorts	{"x":[["77","149"],[],[],[],[],[],[]],"y":[["77","148"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","skip"]}	0
36	images/7_5.jpg	 t-shirt	{"x":[["175","95"],[],[],[],[]],"y":[["176","95"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
230	images/9_0.jpg	 pizza slice	\N	{"answers":["skip","skip"]}	0
335	images/4_3.jpg	 cat head	{"x":[["135","101"],[]],"y":[["132","101"],[]]}	{"answers":["wrong","skip"]}	0
97	images/10_9.jpg	 snorkel	{"x":[["216","34"],[],[],[],[],[],[]],"y":[["216","35"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","skip"]}	0
16	images/1_3.jpg	 golfclub	{"x":[["126","216"],[]],"y":[["127","216"],[]]}	{"answers":["wrong","skip"]}	0
124	images/11_6.jpg	 megaphone	{"x":[["119","76"],[],[]],"y":[["120","76"],[],[]]}	{"answers":["correct","correct","skip"]}	0
74	images/17_0.jpg	 pear	{"x":[["159","25"],[],[],[],[],[]],"y":[["158","25"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
240	images/12_2.jpg	 boomerang	{"x":[["31","125"],[],[]],"y":[["31","126"],[],[]]}	{"answers":["correct","correct","skip"]}	0
247	images/13_8.jpg	 cactus	{"x":[["160","122"],[],[],[],[],[]],"y":[["160","119"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
238	images/12_4.jpg	 boomerang	{"x":[["75","169"],[],[]],"y":[["73","169"],[],[]]}	{"answers":["correct","correct","skip"]}	0
226	images/9_1.jpg	 pizza slice	{"x":[["70","77"],[],[]],"y":[["70","78"],[],[]]}	{"answers":["correct","correct","skip"]}	0
243	images/13_1.jpg	 cactus	{"x":[["93","157"],[],[],[]],"y":[["90","157"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
209	images/18_9.jpg	 skateboard	{"x":[["62","114"],[],[],[]],"y":[["62","118"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
235	images/12_7.jpg	 boomerang	\N	{"answers":["skip","skip"]}	0
233	images/12_0.jpg	 boomerang	{"x":[["55","113"],[],[],[]],"y":[["54","113"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
6	images/22_2.jpg	 door	{"x":[["100","71"],[],[],[]],"y":[["99","71"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
237	images/12_6.jpg	 boomerang	\N	{"answers":["skip","skip"]}	0
242	images/13_4.jpg	 cactus	{"x":[["25","79"],[]],"y":[["25","78"],[]]}	{"answers":["correct","skip"]}	0
179	images/19_5.jpg	 saw	\N	{"answers":["skip"]}	0
71	images/17_9.jpg	 pear	{"x":[["159","24"],[],[]],"y":[["157","24"],[],[]]}	{"answers":["correct","correct","skip"]}	0
140	images/3_1.jpg	 tooth	{"x":[["92","147"],[],[]],"y":[["93","147"],[],[]]}	{"answers":["correct","correct","skip"]}	0
32	images/7_4.jpg	 t-shirt	{"x":[["85","39"],[],[]],"y":[["84","39"],[],[]]}	{"answers":["correct","correct","skip"]}	0
231	images/12_8.jpg	 boomerang	{"x":[["61","175"],[]],"y":[["61","173"],[]]}	{"answers":["correct","skip"]}	0
77	images/17_2.jpg	 pear	{"x":[["104","94"],[],[]],"y":[["104","95"],[],[]]}	{"answers":["correct","correct","skip"]}	0
244	images/13_0.jpg	 cactus	{"x":[["102","224"],[],[],[]],"y":[["102","223"],[],[],[]]}	{"answers":["correct","correct","skip","skip"]}	0
241	images/13_5.jpg	 cactus	{"x":[["63","66"],[],[],[]],"y":[["62","65"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
51	images/24_3.jpg	 flashlight	{"x":[["210","41"],[],[],[],[]],"y":[["210","40"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
154	images/20_5.jpg	 dolphin	{"x":[["100","83"],[],[]],"y":[["99","83"],[],[]]}	{"answers":["correct","correct","skip"]}	0
170	images/5_4.jpg	 truck	{"x":[["170","162"],[],[],[],[]],"y":[["168","162"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
479	images/3_3.jpg	 tooth	\N	{"answers":["skip"]}	0
172	images/19_1.jpg	 saw	{"x":[["31","160.203125"],[],[],[]],"y":[["33","160.203125"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
2	images/22_3.jpg	 door	{"x":[["76","97"],[],[],[],[],[]],"y":[["75","97"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
406	images/24_0.jpg	 flashlight	\N	{"answers":["skip","skip"]}	0
157	images/20_2.jpg	 dolphin	{"x":[["72","139"],[],[]],"y":[["71","139"],[],[]]}	{"answers":["correct","correct","skip"]}	0
3	images/22_9.jpg	 door	{"x":[["100","78"],[],[]],"y":[["99","78"],[],[]]}	{"answers":["correct","correct","skip"]}	0
239	images/12_9.jpg	 boomerang	{"x":[["179","88"],[],[]],"y":[["180","88"],[],[]]}	{"answers":["correct","correct","skip"]}	0
138	images/3_0.jpg	 tooth	{"x":[["65","138"],[],[],[],[]],"y":[["65","139"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
4	images/22_7.jpg	 door	{"x":[["65","66"],[],[],[]],"y":[["65","70"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
405	images/24_6.jpg	 flashlight	\N	{"answers":["skip","skip"]}	0
312	images/17_3.jpg	 pear	{"x":[["72","157"],["139","139","139","139","138","137","137","136","135","134","134","133","133","132","131","131","130","129","129","128","127","126","125","124","123","121","120","119","117","116","115","113","112","111","110","108","107","106","105","104","103","102","101","100","99","98","97","95","94","93","91","90","89","89","88","86","85","84","83","82","81","80","79","79","77","77","76","76","75","75","74","74","74","74","73","73"],[],[],[],[],[],[]],"y":[["73","156"],["27.1953125","28.1953125","29.1953125","31.1953125","32.1953125","34.1953125","36.1953125","39.1953125","41.1953125","44.1953125","45.1953125","47.1953125","49.1953125","51.1953125","52.1953125","54.1953125","56.1953125","58.1953125","59.1953125","61.1953125","63.1953125","65.1953125","67.1953125","68.1953125","71.1953125","73.1953125","74.1953125","76.1953125","79.1953125","80.1953125","82.1953125","84.1953125","86.1953125","88.1953125","89.1953125","91.1953125","93.1953125","94.1953125","96.1953125","98.1953125","99.1953125","101.1953125","103.1953125","105.1953125","107.1953125","110.1953125","112.1953125","115.1953125","117.1953125","120.1953125","123.1953125","125.1953125","128.1953125","131.1953125","134.1953125","137.1953125","140.1953125","142.1953125","146.1953125","149.1953125","151.1953125","154.1953125","157.1953125","159.1953125","162.1953125","164.1953125","166.1953125","168.1953125","171.1953125","172.1953125","173.1953125","175.1953125","176.1953125","178.1953125","180.1953125","182.1953125"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct"]}	0
293	images/20_9.jpg	 dolphin	{"x":[["108","93"],[],[],[],[],[]],"y":[["105","93"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip","skip"]}	0
261	images/9_2.jpg	 pizza slice	{"x":[["84","29"],[],[],[],[]],"y":[["85","29"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
429	images/12_5.jpg	 boomerang	{"x":[["113","76"],[],[],[],[]],"y":[["112","76"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
45	images/23_0.jpg	 knife	{"x":[["26","19"],[],[]],"y":[["25","18"],[],[]]}	{"answers":["correct","correct","skip"]}	0
126	images/11_7.jpg	 megaphone	{"x":[["21","105"],[],[]],"y":[["21","106"],[],[]]}	{"answers":["correct","correct","skip"]}	0
81	images/0_6.jpg	 microwave	{"x":[["104","64"],[],[]],"y":[["103","64"],[],[]]}	{"answers":["correct","correct","skip"]}	0
38	images/7_7.jpg	 t-shirt	{"x":[["171","185"],[]],"y":[["171","184"],[]]}	{"answers":["correct","skip"]}	0
292	images/20_6.jpg	 dolphin	{"x":[["94","72"],[],[]],"y":[["93","72"],[],[]]}	{"answers":["correct","correct","skip"]}	0
42	images/23_5.jpg	 knife	{"x":[["44","92"],[]],"y":[["44","93"],[]]}	{"answers":["correct","skip"]}	0
19	images/1_1.jpg	 golfclub	{"x":[["97","19"],[]],"y":[["97","21"],[]]}	{"answers":["wrong","skip"]}	0
159	images/20_7.jpg	 dolphin	{"x":[["124","81"],[],[],[],[],[]],"y":[["123","81"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
245	images/13_7.jpg	 cactus	{"x":[["176","45"],[],[],[],[]],"y":[["176","46"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
137	images/3_3.jpg	 tooth	\N	{"answers":["skip"]}	0
24	images/6_9.jpg	 fireplace	{"x":[["142","162"],[],[],[]],"y":[["142","161"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
234	images/12_1.jpg	 boomerang	{"x":[["55","196"],[],[],[]],"y":[["54","196"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
228	images/9_3.jpg	 pizza slice	{"x":[["51","31"],[],[],[]],"y":[["50","31"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
222	images/9_4.jpg	 pizza slice	{"x":[["198","29"],[],[]],"y":[["198","32"],[],[]]}	{"answers":["correct","correct","skip"]}	0
164	images/5_3.jpg	 truck	{"x":[["175","158"],[],[],[],[]],"y":[["174","157"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
88	images/0_2.jpg	 microwave	{"x":[["54","40"],[],[],[],[],[]],"y":[["54","47"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
377	images/13_8.jpg	 cactus	{"x":[["160","122"],[],[],[],[],[]],"y":[["160","119"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
198	images/16_5.jpg	 suitcase	{"x":[["38","64"],[],[],[],[],[]],"y":[["39","64"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
212	images/14_0.jpg	 shorts	{"x":[["47","40"],[],[],[]],"y":[["49","40"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
83	images/0_8.jpg	 microwave	{"x":[["227","54"],[],[],[]],"y":[["228","55"],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
63	images/8_0.jpg	 carrot	{"x":[["137","71"],[],[],[]],"y":[["137","70"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
62	images/8_9.jpg	 carrot	{"x":[["161","100"],[],[],[],[],[]],"y":[["161","101"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
232	images/12_5.jpg	 boomerang	{"x":[["113","76"],[],[],[],[]],"y":[["112","76"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
39	images/7_0.jpg	 t-shirt	{"x":[["72","42"],[],[],[]],"y":[["71","42"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
26	images/6_8.jpg	 fireplace	{"x":[["40","231"],[],[]],"y":[["40","228"],[],[]]}	{"answers":["correct","correct","skip"]}	0
236	images/12_3.jpg	 boomerang	{"x":[["124","101"],[],[],[],[]],"y":[["123","101"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
95	images/10_8.jpg	 snorkel	{"x":[["60","198"],[],[]],"y":[["66","198"],[],[]]}	{"answers":["correct","correct","skip"]}	0
75	images/17_5.jpg	 pear	{"x":[["130","80"],[],[],[],[]],"y":[["132","80"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
149	images/21_8.jpg	 map	{"x":[["65","77"],[],[],[]],"y":[["67","77"],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
246	images/13_6.jpg	 cactus	{"x":[["175","132"],[],[],[],[],[]],"y":[["175","130"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
218	images/14_4.jpg	 shorts	{"x":[["27","100"],[],[],[]],"y":[["27","101"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
215	images/14_5.jpg	 shorts	{"x":[["37","58"],[],[],[],[]],"y":[["35","59"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
183	images/15_6.jpg	 triangle	{"x":[["118","30"],[],[]],"y":[["118","32"],[],[]]}	{"answers":["correct","correct","skip"]}	0
37	images/7_8.jpg	 t-shirt	{"x":[["75","61"],[],[],[],[],[]],"y":[["75","63"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
96	images/10_1.jpg	 snorkel	{"x":[["204","71"],[],[],[]],"y":[["206","71"],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
67	images/8_8.jpg	 carrot	{"x":[["130","93"],[],[],[],[],[]],"y":[["129","93"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
99	images/10_6.jpg	 snorkel	{"x":[["206","87"],[],[],[],[]],"y":[["206","88"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
248	images/13_2.jpg	 cactus	{"x":[["163","130"],[],[],[],[]],"y":[["162","130"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
130	images/11_1.jpg	 megaphone	{"x":[["27","193"],[],[],[]],"y":[["27","192"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
58	images/24_9.jpg	 flashlight	{"x":[["44","200"],[],[],[]],"y":[["44","199"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
41	images/23_4.jpg	 knife	{"x":[["113","147"],[],[],[]],"y":[["114","147"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
171	images/19_8.jpg	 saw	{"x":[["21","88"],[],[],[]],"y":[["21","89"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
1	images/22_8.jpg	 door	{"x":[["104","104"],[],[]],"y":[["103","104"],[],[]]}	{"answers":["correct","correct","skip"]}	0
206	images/18_3.jpg	 skateboard	{"x":[["23","114"],[],[],[]],"y":[["25","114"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
66	images/8_4.jpg	 carrot	{"x":[["122","106"],[],[],[]],"y":[["122","104"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
82	images/0_0.jpg	 microwave	{"x":[["23","61"],[],[],[],[]],"y":[["23","63"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
175	images/19_7.jpg	 saw	{"x":[["223","172"],[],[]],"y":[["221","172"],[],[]]}	{"answers":["correct","correct","skip"]}	0
422	images/12_0.jpg	 boomerang	{"x":[["55","113"],[],[],[]],"y":[["54","113"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
115	images/2_1.jpg	 houseplant	{"x":[["160","164"],[]],"y":[["160","162"],[]]}	{"answers":["wrong","skip"]}	0
48	images/23_1.jpg	 knife	{"x":[["217","202"],[],[]],"y":[["216","202"],[],[]]}	{"answers":["correct","correct","skip"]}	0
306	images/8_5.jpg	 carrot	{"x":[["83","231"],[],[]],"y":[["83","230"],[],[]]}	{"answers":["correct","correct","skip"]}	0
200	images/16_7.jpg	 suitcase	{"x":[["35","68"],[],[],[],[],[],[],[],[],[],[]],"y":[["35","67"],[],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
165	images/5_0.jpg	 truck	\N	{"answers":["skip","skip"]}	0
167	images/5_5.jpg	 truck	\N	{"answers":["skip","skip"]}	0
22	images/6_5.jpg	 fireplace	\N	{"answers":["skip","skip"]}	0
344	images/23_1.jpg	 knife	{"x":[["217","202"],[],[]],"y":[["216","202"],[],[]]}	{"answers":["correct","correct","skip"]}	0
5	images/22_6.jpg	 door	\N	{"answers":["skip","skip"]}	0
191	images/16_8.jpg	 suitcase	{"x":[["26","81"],[],[],[],[],[],[],[],[],[],[]],"y":[["26","84"],[],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
29	images/6_6.jpg	 fireplace	{"x":[["46","155"],[]],"y":[["46","157"],[]]}	{"answers":["correct","skip"]}	0
193	images/16_6.jpg	 suitcase	{"x":[["24","102"],[],[],[]],"y":[["24","105"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
21	images/6_7.jpg	 fireplace	{"x":[["236","219"],[],[]],"y":[["236","217"],[],[]]}	{"answers":["correct","correct","skip"]}	0
260	images/6_3.jpg	 fireplace	{"x":[["128","188"],[]],"y":[["126","188"],[]]}	{"answers":["correct","skip"]}	0
69	images/8_5.jpg	 carrot	{"x":[["83","231"],[],[]],"y":[["83","230"],[],[]]}	{"answers":["correct","correct","skip"]}	0
27	images/6_2.jpg	 fireplace	{"x":[["104","165"],[],[],[],[],[],[],[],[]],"y":[["104","164"],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
211	images/14_8.jpg	 shorts	{"x":[["20","91"],[]],"y":[["20","94"],[]]}	{"answers":["skip","correct","correct"]}	0
180	images/19_6.jpg	 saw	{"x":[["146","29"],[],[]],"y":[["146","30"],[],[]]}	{"answers":["correct","correct","skip"]}	0
197	images/16_0.jpg	 suitcase	{"x":[["32","73"],[],[],[],[],[]],"y":[["33","73"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
176	images/19_0.jpg	 saw	{"x":[["31","174"],[],[],[]],"y":[["34","174"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
221	images/9_7.jpg	 pizza slice	{"x":[["65","48"],[],[]],"y":[["65","47"],[],[]]}	{"answers":["correct","correct","skip"]}	0
34	images/7_1.jpg	 t-shirt	{"x":[["80","53"],[],[],[],[],[]],"y":[["73.07035354437184","53.989949493661165"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
189	images/15_8.jpg	 triangle	{"x":[["146","46"],[],[],[]],"y":[["146","47"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
125	images/11_2.jpg	 megaphone	{"x":[["43","207"],[],[],[]],"y":[["43","206"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
33	images/7_6.jpg	 t-shirt	{"x":[["79","59"],[],[],[]],"y":[["79","60"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
168	images/5_1.jpg	 truck	{"x":[["94","69"],[],[],[],[]],"y":[["93","69"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
162	images/5_2.jpg	 truck	{"x":[["216","162"],[],[]],"y":[["215","162"],[],[]]}	{"answers":["correct","correct","skip"]}	0
89	images/0_5.jpg	 microwave	{"x":[["38","200"],[],[],[],[]],"y":[["42","200"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
127	images/11_4.jpg	 megaphone	{"x":[["230","41"],[],[],[],[]],"y":[["230","45"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
101	images/4_5.jpg	 cathead	{"x":[["150","99"],[]],"y":[["150","98"],[]]}	{"answers":["wrong","skip"]}	0
173	images/19_9.jpg	 saw	{"x":[["31","158"],[],[]],"y":[["30","158"],[],[]]}	{"answers":["correct","correct","skip"]}	0
250	images/13_3.jpg	 cactus	{"x":[["128","219"],[],[],[]],"y":[["128","216"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
94	images/10_2.jpg	 snorkel	{"x":[["33","104"],[],[],[],[]],"y":[["34","104"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
229	images/9_2.jpg	 pizza slice	{"x":[["84","29"],[],[],[],[]],"y":[["85","29"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
364	images/10_2.jpg	 snorkel	{"x":[["33","104"],[],[],[],[]],"y":[["34","104"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
259	images/6_1.jpg	 fireplace	{"x":[["158","152"],[],[],[]],"y":[["158","151"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
31	images/7_2.jpg	 t-shirt	{"x":[["76","82"],[],[],[],[]],"y":[["76","84"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
411	images/7_2.jpg	 t-shirt	{"x":[["76","82"],[],[],[],[]],"y":[["76","84"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
347	images/23_2.jpg	 knife	{"x":[["51","98"],[],[]],"y":[["50","98"],[],[]]}	{"answers":["correct","correct","skip"]}	0
327	images/11_4.jpg	 megaphone	{"x":[["230","41"],[],[],[],[]],"y":[["230","45"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
305	images/8_9.jpg	 carrot	{"x":[["161","100"],[],[],[],[],[]],"y":[["161","101"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
408	images/24_5.jpg	 flashlight	{"x":[["168","77"],[],[]],"y":[["167","77"],[],[]]}	{"answers":["correct","correct","skip"]}	0
381	images/18_0.jpg	 skateboard	{"x":[["27","114"],[],[],[]],"y":[["28","114"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
349	images/23_7.jpg	 knife	{"x":[["150","122"],[],[]],"y":[["151","122"],[],[]]}	{"answers":["correct","correct","skip"]}	0
351	images/0_6.jpg	 microwave	{"x":[["104","64"],[],[]],"y":[["103","64"],[],[]]}	{"answers":["correct","correct","skip"]}	0
298	images/20_4.jpg	 dolphin	{"x":[["111","73"],[],[]],"y":[["109","73"],[],[]]}	{"answers":["correct","correct","skip"]}	0
322	images/11_0.jpg	 megaphone	\N	{"answers":["skip","skip"]}	0
316	images/17_8.jpg	 pear	{"x":[["141","20"],[],[],[]],"y":[["141","21"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
326	images/11_9.jpg	 megaphone	\N	{"answers":["skip","skip"]}	0
358	images/0_0.jpg	 microwave	{"x":[["23","61"],[],[],[],[]],"y":[["23","63"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
295	images/20_3.jpg	 dolphin	\N	{"answers":["skip","skip"]}	0
283	images/5_3.jpg	 truck	{"x":[["175","158"],[],[],[],[]],"y":[["174","157"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
348	images/23_8.jpg	 knife	\N	{"answers":["skip","skip"]}	0
426	images/12_8.jpg	 boomerang	{"x":[["61","175"],[]],"y":[["61","173"],[]]}	{"answers":["correct","skip"]}	0
255	images/6_5.jpg	 fireplace	\N	{"answers":["skip","skip"]}	0
319	images/17_7.jpg	 pear	\N	{"answers":["skip","skip"]}	0
360	images/0_1.jpg	 microwave	\N	{"answers":["skip","skip","skip"]}	0
336	images/4_5.jpg	 cat head	{"x":[["150","99"],[]],"y":[["150","98"],[]]}	{"answers":["wrong","skip"]}	0
361	images/10_7.jpg	 snorkel	\N	{"answers":["skip","skip"]}	0
334	images/4_6.jpg	 cat head	{"x":[["95","69"],[]],"y":[["94","69"],[]]}	{"answers":["wrong","skip"]}	0
282	images/5_9.jpg	 truck	\N	{"answers":["skip","skip"]}	0
297	images/20_2.jpg	 dolphin	{"x":[["72","139"],[],[]],"y":[["71","139"],[],[]]}	{"answers":["correct","correct","skip"]}	0
288	images/5_6.jpg	 truck	{"x":[["28","73"],[]],"y":[["28","76"],[]]}	{"answers":["wrong","skip"]}	0
329	images/11_3.jpg	 megaphone	\N	{"answers":["skip","skip"]}	0
277	images/14_4.jpg	 shorts	{"x":[["27","100"],[],[],[]],"y":[["27","101"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
354	images/0_3.jpg	 microwave	\N	{"answers":["skip","correct","correct","correct"]}	0
365	images/10_0.jpg	 snorkel	{"x":[["210","171"],[],[],[]],"y":[["210","168"],[],[],[]]}	{"answers":["wrong","correct","skip","skip"]}	0
304	images/8_8.jpg	 carrot	{"x":[["130","93"],[],[],[],[],[]],"y":[["129","93"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
315	images/17_4.jpg	 pear	{"x":[["126","68"],[],[]],"y":[["126","67"],[],[]]}	{"answers":["correct","correct","skip"]}	0
309	images/8_0.jpg	 carrot	{"x":[["137","71"],[],[],[]],"y":[["137","70"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
345	images/23_0.jpg	 knife	{"x":[["26","19"],[],[]],"y":[["25","18"],[],[]]}	{"answers":["correct","correct","skip"]}	0
294	images/20_0.jpg	 dolphin	\N	{"answers":["skip","skip"]}	0
254	images/6_9.jpg	 fireplace	{"x":[["142","162"],[],[],[]],"y":[["142","161"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
281	images/5_0.jpg	 truck	\N	{"answers":["skip","skip"]}	0
325	images/11_5.jpg	 megaphone	\N	{"answers":["skip","skip"]}	0
359	images/0_8.jpg	 microwave	{"x":[["227","54"],[],[],[]],"y":[["228","55"],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
350	images/23_5.jpg	 knife	{"x":[["44","92"],[]],"y":[["44","93"],[]]}	{"answers":["correct","skip"]}	0
346	images/23_6.jpg	 knife	\N	{"answers":["skip"]}	0
324	images/11_1.jpg	 megaphone	{"x":[["27","193"],[],[],[]],"y":[["27","192"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
313	images/17_1.jpg	 pear	{"x":[["125","58"],[],[]],"y":[["123","60"],[],[]]}	{"answers":["correct","correct","skip"]}	0
314	images/17_2.jpg	 pear	{"x":[["104","94"],[],[]],"y":[["104","95"],[],[]]}	{"answers":["correct","correct","skip"]}	0
330	images/11_7.jpg	 megaphone	{"x":[["21","105"],[],[]],"y":[["21","106"],[],[]]}	{"answers":["correct","correct","skip"]}	0
274	images/14_5.jpg	 shorts	{"x":[["37","58"],[],[],[],[]],"y":[["35","59"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
323	images/11_2.jpg	 megaphone	{"x":[["43","207"],[],[],[]],"y":[["43","206"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
267	images/9_0.jpg	 pizza slice	\N	{"answers":["skip","skip"]}	0
338	images/4_9.jpg	 cat head	{"x":[["183","188"],[]],"y":[["183","190"],[]]}	{"answers":["wrong","skip"]}	0
342	images/23_3.jpg	 knife	\N	{"answers":["skip","skip"]}	0
265	images/9_5.jpg	 pizza slice	{"x":[["173","62"],[],[]],"y":[["173","63"],[],[]]}	{"answers":["correct","correct","skip"]}	0
285	images/5_5.jpg	 truck	\N	{"answers":["skip","skip"]}	0
287	images/5_1.jpg	 truck	{"x":[["94","69"],[],[],[],[]],"y":[["93","69"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
271	images/14_3.jpg	 shorts	\N	{"answers":["skip","skip"]}	0
275	images/14_2.jpg	 shorts	{"x":[["21","153"],[],[]],"y":[["21","154"],[],[]]}	{"answers":["correct","correct","skip"]}	0
333	images/4_1.jpg	 cat head	{"x":[["80","102"],[]],"y":[["80","97"],[]]}	{"answers":["wrong","skip"]}	0
276	images/14_6.jpg	 shorts	\N	{"answers":["skip","skip"]}	0
269	images/9_8.jpg	 pizza slice	{"x":[["192","67"],[],[]],"y":[["192","68"],[],[]]}	{"answers":["correct","correct","skip"]}	0
270	images/9_6.jpg	 pizza slice	\N	{"answers":["skip"]}	0
395	images/1_1.jpg	 golf club	{"x":[["97","19"],[]],"y":[["97","21"],[]]}	{"answers":["wrong","skip"]}	0
394	images/1_8.jpg	 golf club	\N	{"answers":["skip","skip"]}	0
471	images/3_9.jpg	 tooth	\N	{"answers":["skip"]}	0
393	images/1_2.jpg	 golf club	{"x":[["88","22"],[]],"y":[["88","23"],[]]}	{"answers":["wrong","skip"]}	0
438	images/22_0.jpg	 door	{"x":[["53","88"],[],[]],"y":[["53","89"],[],[]]}	{"answers":["correct","correct","skip"]}	0
424	images/12_6.jpg	 boomerang	\N	{"answers":["skip","skip"]}	0
437	images/22_4.jpg	 door	{"x":[["59","49"],[],[],[],[]],"y":[["59","50"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
404	images/24_2.jpg	 flashlight	\N	{"answers":["skip","skip"]}	0
473	images/3_1.jpg	 tooth	{"x":[["92","147"],[],[]],"y":[["93","147"],[],[]]}	{"answers":["correct","correct","skip"]}	0
257	images/6_6.jpg	 fireplace	{"x":[["46","155"],[]],"y":[["46","157"],[]]}	{"answers":["correct","skip"]}	0
458	images/15_9.jpg	 triangle	{"x":[["164","87"],[],[],[]],"y":[["164","90"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
386	images/18_7.jpg	 skateboard	\N	{"answers":["skip","skip"]}	0
388	images/18_9.jpg	 skateboard	{"x":[["62","114"],[],[],[]],"y":[["62","118"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
392	images/1_9.jpg	 golf club	{"x":[["96","32"],[]],"y":[["96","34"],[]]}	{"answers":["wrong","skip"]}	0
468	images/16_1.jpg	 suitcase	{"x":[["216","207"],[],[]],"y":[["216","201"],[],[]]}	{"answers":["correct","correct","skip"]}	0
452	images/15_3.jpg	 triangle	{"x":[["113","23"],[],[]],"y":[["112","23"],[],[]]}	{"answers":["correct","correct","skip"]}	0
402	images/24_1.jpg	 flashlight	\N	{"answers":["skip","skip"]}	0
446	images/21_8.jpg	 map	{"x":[["65","77"],[],[],[]],"y":[["67","77"],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
428	images/12_9.jpg	 boomerang	{"x":[["179","88"],[],[]],"y":[["180","88"],[],[]]}	{"answers":["correct","correct","skip"]}	0
391	images/1_3.jpg	 golf club	{"x":[["126","216"],[]],"y":[["127","216"],[]]}	{"answers":["wrong","skip"]}	0
414	images/7_0.jpg	 t-shirt	{"x":[["72","42"],[],[],[]],"y":[["71","42"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
366	images/10_8.jpg	 snorkel	{"x":[["60","198"],[],[]],"y":[["66","198"],[],[]]}	{"answers":["correct","correct","skip"]}	0
474	images/3_4.jpg	 tooth	{"x":[["90","102"],[],[],[]],"y":[["90","104"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
477	images/3_6.jpg	 tooth	\N	{"answers":["skip","skip"]}	0
378	images/13_3.jpg	 cactus	{"x":[["128","219"],[],[],[]],"y":[["128","216"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
375	images/13_9.jpg	 cactus	{"x":[["123","232"],[],[]],"y":[["123","229"],[],[]]}	{"answers":["correct","correct","skip"]}	0
410	images/24_7.jpg	 flashlight	{"x":[["195","132"],[],[]],"y":[["194","132"],[],[]]}	{"answers":["correct","correct","skip"]}	0
367	images/10_6.jpg	 snorkel	{"x":[["206","87"],[],[],[],[]],"y":[["206","88"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
412	images/7_3.jpg	 t-shirt	{"x":[["164","85"],[],[],[]],"y":[["164","87"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
407	images/24_3.jpg	 flashlight	{"x":[["210","41"],[],[],[],[]],"y":[["210","40"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
450	images/21_1.jpg	 map	\N	{"answers":["skip","skip"]}	0
421	images/12_4.jpg	 boomerang	{"x":[["75","169"],[],[]],"y":[["73","169"],[],[]]}	{"answers":["correct","correct","skip"]}	0
444	images/21_3.jpg	 map	{"x":[["50","35"],[],[],[],[]],"y":[["50","36"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
373	images/13_4.jpg	 cactus	{"x":[["25","79"],[]],"y":[["25","78"],[]]}	{"answers":["correct","skip"]}	0
453	images/15_2.jpg	 triangle	{"x":[["45","215"],[],[]],"y":[["45","214"],[],[]]}	{"answers":["correct","correct","skip"]}	0
433	images/22_5.jpg	 door	{"x":[["84","123"],[],[],[]],"y":[["84","122"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
390	images/18_8.jpg	 skateboard	{"x":[["134","118"],[],[],[]],"y":[["135","118"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
440	images/22_8.jpg	 door	{"x":[["104","104"],[],[]],"y":[["103","104"],[],[]]}	{"answers":["correct","correct","skip"]}	0
464	images/16_8.jpg	 suitcase	{"x":[["26","81"],[],[],[],[],[],[],[],[],[],[]],"y":[["26","84"],[],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
400	images/1_7.jpg	 golf club	{"x":[["89","24"],[]],"y":[["89","27"],[]]}	{"answers":["wrong","skip"]}	0
376	images/13_1.jpg	 cactus	{"x":[["93","157"],[],[],[]],"y":[["90","157"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
475	images/3_5.jpg	 tooth	{"x":[["60","76"],[],[]],"y":[["60","79"],[],[]]}	{"answers":["correct","correct","skip"]}	0
403	images/24_8.jpg	 flashlight	\N	{"answers":["skip"]}	0
387	images/18_6.jpg	 skateboard	\N	{"answers":["skip","skip"]}	0
383	images/18_4.jpg	 skateboard	\N	{"answers":["skip","skip"]}	0
425	images/12_7.jpg	 boomerang	\N	{"answers":["skip","skip"]}	0
397	images/1_0.jpg	 golf club	{"x":[["89","37"],[]],"y":[["89","40"],[]]}	{"answers":["wrong","skip"]}	0
448	images/21_2.jpg	 map	\N	{"answers":["skip","skip"]}	0
419	images/7_7.jpg	 t-shirt	{"x":[["171","185"],[]],"y":[["171","184"],[]]}	{"answers":["correct","skip"]}	0
398	images/1_4.jpg	 golf club	{"x":[["117","19"],[]],"y":[["117","20"],[]]}	{"answers":["wrong","skip"]}	0
493	images/2_3.jpg	 house plant	{"x":[["84","49"],[]],"y":[["84","56"],[]]}	{"answers":["wrong","skip"]}	0
491	images/2_1.jpg	 house plant	{"x":[["160","164"],[]],"y":[["160","162"],[]]}	{"answers":["wrong","skip"]}	0
496	images/2_5.jpg	 house plant	{"x":[["171","67"],["89","90","91","94","96","98","100","105","107","109","114","117","120","121","126","129","132","136","138","140","143","145","146","149","150","151","152","155","157","158","161","162","164","167","168","170","171","173","174","175","176","177","178","179"]],"y":[["171","68"],["171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","170","170","170","170","169","169","168","168","168","168","167","167","166","166","166","164","164","164","163","162","162","162"]]}	{"answers":["wrong","correct"]}	0
461	images/16_6.jpg	 suitcase	{"x":[["24","102"],[],[],[]],"y":[["24","105"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
466	images/16_9.jpg	 suitcase	{"x":[["22","137"],[],[],[],[]],"y":[["22","135"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
61	images/8_1.jpg	 carrot	{"x":[["173","19"],[],[],[],[],[],[],[],[]],"y":[["172","19"],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip","skip","skip","skip","skip"]}	0
302	images/8_1.jpg	 carrot	{"x":[["173","19"],[],[],[],[],[],[],[],[]],"y":[["172","19"],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip","skip","skip","skip","skip"]}	0
445	images/21_7.jpg	 map	{"x":[["28","35"],[],[],[],[],[],[],[],[],[],["31","32","38","42","46","53","60","67","74","81","88","95","102","108","111","114","120","122","126","128","130","131","135","138","143","146","149","155","158","160","166","168","170","174","177","179","183","185","188","190","194","197","199","201","204","207","208","211","211","213","215","216","218","220","222","223","225","227","228","229","230","230","230","230","229","228","228","226","226","225","224","223","223","222.13175685787553","222","222","222","222","222","222","222","222","222.77302068252393","223","224","224.98994949366116","226","226","227","228","228","228","228","228","228","228","228","228","228","227","227","227","227","227","227","227","227","227","227","228","228","228","228","228","228","228","227","227","225","225","224","223","222","222","221","220","218","218","216","213","211","209","205","202","199","195","192","190","186","184","182","179","178","175","172","168","166","163","156","154","151","147","140.05405486300432","135","130","123","120","117","111","109","106","104","100","98","96","92","90","89","84","82","81","79","74","73","71","67","65","64","60","59","57","54","53","52","49","48","46","44","43","41","40","37","36","33","32","31","29","29"],[],[]],"y":[["28","36"],[],[],[],[],[],[],[],[],[],["27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","29","29","30","31","31","32","33","34","35","36","36","36","36","36","36","36","36","36","36","36","36","35","35","35","34","34","33","33","32","32","32","32","32","32","33","34","37","38","40","42","45","48","51","56","59","62","68.94594513699568","73","78","84","87","90","97","101","105","111.95718614271533","116","120","126.92964645562816","130","133","135","140","144","146","151","153","156","158","163","165","167","173","175","177","179","184","189","191","193","198","199","203","204","205","207","209","210","211","212","213","215","216","217","219","220","221","221","222","222","223","223","224","224","225","226","227","227","228","228","229","229","229","229","229","229","229","229","229","229","229","229","229","230","230","230.86824314212447","231","231","231","231","231","231","231","231","231","231","231","231","232","233","233","234","235","235","236","237","237","237","237","237","237","237","237","237","237","237","237","236","236","236","235","235","235","235","234","234","233","233","233","232","231"],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
482	images/19_4.jpg	 saw	{"x":[["36","157"],[],[]],"y":[["43","157"],[],[]]}	{"answers":["correct","correct","skip"]}	0
487	images/19_2.jpg	 saw	\N	{"answers":["skip","skip"]}	0
485	images/19_6.jpg	 saw	{"x":[["146","29"],[],[]],"y":[["146","30"],[],[]]}	{"answers":["correct","correct","skip"]}	0
483	images/19_0.jpg	 saw	{"x":[["31","174"],[],[],[]],"y":[["34","174"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
495	images/2_2.jpg	 house plant	{"x":[["173","232"],[]],"y":[["173","231"],[]]}	{"answers":["wrong","skip"]}	0
498	images/2_4.jpg	 house plant	{"x":[["162","22"],[]],"y":[["159","22"],[]]}	{"answers":["wrong","skip"]}	0
499	images/2_9.jpg	 house plant	{"x":[["72","65"],[]],"y":[["72","68"],[]]}	{"answers":["wrong","skip"]}	0
488	images/19_8.jpg	 saw	{"x":[["21","88"],[],[],[]],"y":[["21","89"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
497	images/2_6.jpg	 house plant	{"x":[["179","151"],[]],"y":[["179","153"],[]]}	{"answers":["wrong","skip"]}	0
489	images/19_3.jpg	 saw	\N	{"answers":["correct","skip","skip"]}	0
272	images/14_9.jpg	 shorts	{"x":[["92","110"],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],"y":[["92","112"],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
417	images/7_9.jpg	 t-shirt	{"x":[["175","81"],[],[]],"y":[["177","84"],[],[]]}	{"answers":["correct","correct","skip"]}	0
203	images/18_5.jpg	 skateboard	{"x":[["53","112.796875"],[],[],[],[],[],[],[],[]],"y":[["55","113.796875"],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
382	images/18_5.jpg	 skateboard	{"x":[["53","112.796875"],[],[],[],[],[],[],[],[]],"y":[["55","113.796875"],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
85	images/0_9.jpg	 microwave	{"x":[["66","65"],[],[],["223","222","220","218","217","215","214","212","210","209","207","205","204","202","202","200","199","199","199","198","198","198","198","198","198","198","198","198","198","198","198","198","199","199","200","200","201","201","201","201","202","202","202","203","204","205","206","207","207","208","209","209","209","209","209","210","210","211","211","212","213","213","213","213","213","213","213","213","213","213","213","213","213","213","213","211","210","210","208","207","205","203","201","200","198","197","197","196","195","195","194","194","193","193","193","193","193","193","193","193","193","193","193","193","192","192","191","191","189","189","188","186","185","184","182","181","179","177","176","174","173","171","169","168","166","164","162","159","156","153","151","149","147","145","143","141","139","137","133","130","126","121","117","114","111","108","105","102","99","96","93","90","87","84","81","78","77","76","75","73","71","70","69","68","67","66","65","65","65","65","65","65","65","64","62","60","59","57","57","56","56","55","55","55","55","55","55","54","54","54","54","54","54","54","54","54","54","54","54","54","54","55","55","56","56","57","58","59","61","64","66","69","74","81","88","89","95","100","104","108","112","116","120","124","128","132","136","139","142","144","146","147","149","153","157","160","163","167","169","172","174","176","177","179","181","182","184","186","187","188","189","190","190","190","190","190","189","189","188","187","186","185","185","183","183","182","180","180","179","179","179","179","179","179","178","177","176","175","174","173","173","172","172","172","172","172","172","172","172"],[],[],[],[],[],[]],"y":[["67","65"],[],[],["167.6015625","167.6015625","167.6015625","167.6015625","167.6015625","167.6015625","167.6015625","167.6015625","166.6015625","165.6015625","164.6015625","164.6015625","163.6015625","163.6015625","162.6015625","162.6015625","162.6015625","161.6015625","160.6015625","159.6015625","158.6015625","156.6015625","154.6015625","151.6015625","148.6015625","144.6015625","139.6015625","135.6015625","129.6015625","125.6015625","121.6015625","116.6015625","112.6015625","109.6015625","106.6015625","104.6015625","103.6015625","102.6015625","101.6015625","100.6015625","99.6015625","98.6015625","97.6015625","96.6015625","96.6015625","96.6015625","96.6015625","96.6015625","97.6015625","98.6015625","99.6015625","101.6015625","102.6015625","104.6015625","107.6015625","110.6015625","114.6015625","118.6015625","122.6015625","128.6015625","132.6015625","136.6015625","139.6015625","142.6015625","146.6015625","149.6015625","153.6015625","156.6015625","160.6015625","163.6015625","165.6015625","167.6015625","168.6015625","170.6015625","171.6015625","173.6015625","173.6015625","174.6015625","174.6015625","174.6015625","174.6015625","174.6015625","174.6015625","174.6015625","174.6015625","172.6015625","171.6015625","170.6015625","169.6015625","168.6015625","166.6015625","164.6015625","162.6015625","159.6015625","156.6015625","152.6015625","147.6015625","143.6015625","138.6015625","132.6015625","128.6015625","123.6015625","118.6015625","114.6015625","110.6015625","106.6015625","102.6015625","100.6015625","97.6015625","96.6015625","96.6015625","95.6015625","95.6015625","95.6015625","95.6015625","94.6015625","94.6015625","94.6015625","94.6015625","93.6015625","93.6015625","93.6015625","92.6015625","92.6015625","92.6015625","91.6015625","90.6015625","89.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","87.6015625","87.6015625","86.6015625","86.6015625","84.6015625","84.6015625","83.6015625","83.6015625","82.6015625","82.6015625","82.6015625","82.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","82.6015625","83.6015625","83.6015625","83.6015625","84.6015625","85.6015625","86.6015625","87.6015625","89.6015625","92.6015625","95.6015625","99.6015625","103.6015625","108.6015625","112.6015625","116.6015625","119.6015625","121.6015625","123.6015625","124.6015625","125.6015625","126.6015625","127.6015625","128.6015625","129.6015625","130.6015625","131.6015625","132.6015625","133.6015625","134.6015625","136.6015625","137.6015625","139.6015625","141.6015625","144.6015625","145.6015625","147.6015625","149.6015625","150.6015625","152.6015625","153.6015625","155.6015625","156.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","156.6015625","154.6015625","153.6015625","152.6015625","150.6015625","149.6015625","147.6015625","145.6015625","141.6015625","138.6015625","134.6015625","130.6015625","125.6015625","119.6015625","114.6015625","110.6015625","107.6015625","105.6015625","104.6015625","103.6015625","102.6015625","101.6015625","105.6015625","109.6015625","114.6015625","118.6015625","121.6015625","124.6015625","127.6015625","128.6015625","129.6015625","131.6015625","132.6015625","133.6015625","134.6015625","135.6015625","136.6015625"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
500	images/2_0.jpg	 house plant	{"x":[["154","19"],[]],"y":[["153","19"],[]]}	{"answers":["wrong","skip"]}	0
492	images/2_7.jpg	 house plant	{"x":[["123","126"],[]],"y":[["123","125"],[]]}	{"answers":["wrong","skip"]}	0
494	images/2_8.jpg	 house plant	{"x":[["100","67"],["89","91","94","97","100","107","111","117","122","125","128","133","136","140","143","145","147","148","150","152","153","155","157","160","161","164","168","170","172","177","179","181","184","185","187","188","189","190","190","188","182","178","176","169","162","157","150","143.20900249898267","137","133","127","123","122","120","119","119","119","120.69774937525433","122.52541240606628","125.0051670523915","127.8230885002949","130.63336453087268","133.42951705480215","136.21553665449227","138.72784286699067","141.2106574945742","143.7144036544544","146.09859694523433","148.3684036333068","150.4140796236905","152.96200001547004","155","155","154.303473966853","152.9875470605552","151.71496534716238","150.19926509540366","148.72609269918692","147.06353818584478","145.5253752460686","144.08218209258774","142.49471164005897","140.98168656138606","139.46866148271315","138","141","143.75743509005417","145.74669893711112","148.77761064849395","150.75550541979644","153","154","154","150.4729028213314","146.97495022273756","143.29203392406157","139.49457628448368","135.67726925015452","132.09017434432585","128.22607690232576","127","127","127.98994949366117","130.44197083729404","133.30928115511617","135.91660796799502","138.41217728098323","140.83971621354615","143.3184544120685","145.64675519419276","147.93915930959335","150.1654124750035","152.4572641386701","154.71147021659746","156.96567629452483","159.2198823724522","161.47408845037955","163.72829452830692","165.69884993572649","167.66940534314608","169","162.00792303592894","155.17456229946367","148.53650993214745","141.89845756483123","135.260405197515","128.6223528301988","121.98430046288257","115.34624809556635","108.70819572825013","102.07014336093391","95.43209099361769","89"],[]],"y":[["99","67"],["165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","165","164","164","164","164","164","164","164","163","163","163","162","162","161","161","160","160","160","159","159","158","157","157","157","157","157","157","158.69774937525432","161","162","165","166","167","168","168","167","164","157.20900249898267","150.45181019405283","143.90575665821703","137.49800208165544","131.08689074024514","124.66960696415086","118.24791756103096","111.7142878275182","105.16939428177912","98.63247947685124","92.05101897387776","85.42923842792325","78.73482211711858","72.2149983712529","66","73","79.96526033146992","86.84045751971706","93.7238095943053","100.5577435087369","107.40097104338933","114.2006704845533","121.02958363165797","127.87919628652729","134.69681592701386","141.53134261957325","148.36586931213265","155","149","142.5659847898736","135.8545893055654","129.5447894515445","122.83003463296367","119","116","115","121.04645230628904","127.10981173963874","133.06263691235688","138.9430548801217","144.81060692553734","150.82165925741552","156.65850352111903","158","157","150.07035354437184","143.5138612405276","137.12805420137346","130.63175934269879","124.09171853211728","117.5261222354439","110.97968374240159","104.37824333382716","97.7642518482192","91.12770177732385","84.51351883823389","77.88641125209683","71.25930366595978","64.63219607982272","58.00508849368566","51.377980907548604","44.66106856732193","37.94415622709525","32","31.667043954091852","30.148761686088","27.926991948071148","25.705222210054295","23.483452472037442","21.26168273402059","19.039912996003736","16.818143257986883","14.59637351997003","12.374603781953176","10.152834043936327","8"],[]]}	{"answers":["wrong","wrong","skip"]}	0
490	images/19_1.jpg	 saw	{"x":[["31","160.203125"],[],[],[]],"y":[["33","160.203125"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
486	images/19_9.jpg	 saw	{"x":[["31","158"],[],[]],"y":[["30","158"],[],[]]}	{"answers":["correct","correct","skip"]}	0
484	images/19_7.jpg	 saw	{"x":[["223","172"],[],[]],"y":[["221","172"],[],[]]}	{"answers":["correct","correct","skip"]}	0
460	images/15_0.jpg	 triangle	{"x":[["64","146"],[],[],[],["136","135","134","131","130","128","126","126","123","123","121","119","119","118","115","114","114","110","110","108","107","104","103","101","100","98","97","96","95","94","94","92","92","91","90","88","87","86","84","84"],[],[]],"y":[["64","150"],[],[],[],["29","29","29","29","29","30","32","33","35","37","38","42","43","44","46","48","49","52","53","55","57","61","63","65","67","71","73","75","78","80","81","84","85","87","89","92","94","96","99","101"],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct"]}	0
353	images/0_9.jpg	 microwave	{"x":[["66","65"],[],[],["223","222","220","218","217","215","214","212","210","209","207","205","204","202","202","200","199","199","199","198","198","198","198","198","198","198","198","198","198","198","198","198","199","199","200","200","201","201","201","201","202","202","202","203","204","205","206","207","207","208","209","209","209","209","209","210","210","211","211","212","213","213","213","213","213","213","213","213","213","213","213","213","213","213","213","211","210","210","208","207","205","203","201","200","198","197","197","196","195","195","194","194","193","193","193","193","193","193","193","193","193","193","193","193","192","192","191","191","189","189","188","186","185","184","182","181","179","177","176","174","173","171","169","168","166","164","162","159","156","153","151","149","147","145","143","141","139","137","133","130","126","121","117","114","111","108","105","102","99","96","93","90","87","84","81","78","77","76","75","73","71","70","69","68","67","66","65","65","65","65","65","65","65","64","62","60","59","57","57","56","56","55","55","55","55","55","55","54","54","54","54","54","54","54","54","54","54","54","54","54","54","55","55","56","56","57","58","59","61","64","66","69","74","81","88","89","95","100","104","108","112","116","120","124","128","132","136","139","142","144","146","147","149","153","157","160","163","167","169","172","174","176","177","179","181","182","184","186","187","188","189","190","190","190","190","190","189","189","188","187","186","185","185","183","183","182","180","180","179","179","179","179","179","179","178","177","176","175","174","173","173","172","172","172","172","172","172","172","172"],[],[],[],[],[],[]],"y":[["67","65"],[],[],["167.6015625","167.6015625","167.6015625","167.6015625","167.6015625","167.6015625","167.6015625","167.6015625","166.6015625","165.6015625","164.6015625","164.6015625","163.6015625","163.6015625","162.6015625","162.6015625","162.6015625","161.6015625","160.6015625","159.6015625","158.6015625","156.6015625","154.6015625","151.6015625","148.6015625","144.6015625","139.6015625","135.6015625","129.6015625","125.6015625","121.6015625","116.6015625","112.6015625","109.6015625","106.6015625","104.6015625","103.6015625","102.6015625","101.6015625","100.6015625","99.6015625","98.6015625","97.6015625","96.6015625","96.6015625","96.6015625","96.6015625","96.6015625","97.6015625","98.6015625","99.6015625","101.6015625","102.6015625","104.6015625","107.6015625","110.6015625","114.6015625","118.6015625","122.6015625","128.6015625","132.6015625","136.6015625","139.6015625","142.6015625","146.6015625","149.6015625","153.6015625","156.6015625","160.6015625","163.6015625","165.6015625","167.6015625","168.6015625","170.6015625","171.6015625","173.6015625","173.6015625","174.6015625","174.6015625","174.6015625","174.6015625","174.6015625","174.6015625","174.6015625","174.6015625","172.6015625","171.6015625","170.6015625","169.6015625","168.6015625","166.6015625","164.6015625","162.6015625","159.6015625","156.6015625","152.6015625","147.6015625","143.6015625","138.6015625","132.6015625","128.6015625","123.6015625","118.6015625","114.6015625","110.6015625","106.6015625","102.6015625","100.6015625","97.6015625","96.6015625","96.6015625","95.6015625","95.6015625","95.6015625","95.6015625","94.6015625","94.6015625","94.6015625","94.6015625","93.6015625","93.6015625","93.6015625","92.6015625","92.6015625","92.6015625","91.6015625","90.6015625","89.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","88.6015625","87.6015625","87.6015625","86.6015625","86.6015625","84.6015625","84.6015625","83.6015625","83.6015625","82.6015625","82.6015625","82.6015625","82.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","81.6015625","82.6015625","83.6015625","83.6015625","83.6015625","84.6015625","85.6015625","86.6015625","87.6015625","89.6015625","92.6015625","95.6015625","99.6015625","103.6015625","108.6015625","112.6015625","116.6015625","119.6015625","121.6015625","123.6015625","124.6015625","125.6015625","126.6015625","127.6015625","128.6015625","129.6015625","130.6015625","131.6015625","132.6015625","133.6015625","134.6015625","136.6015625","137.6015625","139.6015625","141.6015625","144.6015625","145.6015625","147.6015625","149.6015625","150.6015625","152.6015625","153.6015625","155.6015625","156.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","158.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","157.6015625","156.6015625","154.6015625","153.6015625","152.6015625","150.6015625","149.6015625","147.6015625","145.6015625","141.6015625","138.6015625","134.6015625","130.6015625","125.6015625","119.6015625","114.6015625","110.6015625","107.6015625","105.6015625","104.6015625","103.6015625","102.6015625","101.6015625","105.6015625","109.6015625","114.6015625","118.6015625","121.6015625","124.6015625","127.6015625","128.6015625","129.6015625","131.6015625","132.6015625","133.6015625","134.6015625","135.6015625","136.6015625"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
108	images/4_8.jpg	 cathead	{"x":[["170","100"],["103","103","103","103","103","103","103","103","102","101","99","98","97","96","96","95","94","93","93","92","91","90","89","89","88","87","86","85","84","82","81","80","80","79","78","77","76","75","74","73","71","69","67","66","65","64","61","61","59","57","56","55","55","53","52","51","50","49","48","47","46","45","44","43","43","42","41","41","41","41","41","41","41","41","40","40","39","39","38","38","37","37","37","36","36","36","35","35","35","34","34","34","34","34","34","34","34","34","34","34","35","35","35","35","35","35","35","35","35","35","35","35","35","35","34","34","33","32","31","31","30","29","28","28","28","27","27","27","27","27","27","27","27","27","27","29","30","31","33","36","39","41","46","48","50","54","56","58","59","63","64","68","70","72","75","77","79","80","84","85","86","89","91","92","95","97","99","103","106","108","110","115","118","120","121","125","128","129","130","132","134","135","137","139","140","141","142","143","145","146","148","149","152","154","155","159"],[],[],[]],"y":[["170","99"],["91","90","89","88","87","86","85","84","83","82","80","79","78","76","75","75","74","74","73","73","72","71","71","70","70","69","68","67","66","64","63","62","61","61","60","59","59","58","57","57","55","54","53","52","51","50","49","48","47","45","44","44","43","41","40","39","38","37","35","34","33","31","30","29","28","27","26","27","28","30","32","34","38","41","45","51","54","58","61","67","70","72","76","78","79","81","85","86","90","91","93","96","97","98","100","101","103","104","106","107","109","111","113","114","115","116","117","118","119","120","121","123","124","126","128","130","131","132","135","136","137","140","141","144","145","149","151","153","158","160","163","165","168","169","170","172","173","175","176","178","180","181","184","186","186","188","188","189","189","190","191","192","192","193","194","194","195","195","196","196","197","198","199","200","202","202","203","204","205","206","207","209","210","211","211","213","215","216","217","218","219","220","221","221","222","223","223","223","223","223","223","223","223","223","223","222"],[],[],[]]}	{"answers":["wrong","correct","correct","correct","correct"]}	0
374	images/13_0.jpg	 cactus	{"x":[["102","224"],[],[],[]],"y":[["102","223"],[],[],[]]}	{"answers":["correct","correct","skip","skip"]}	0
278	images/14_7.jpg	 shorts	{"x":[["77","149"],[],[],[],[],[],[]],"y":[["77","148"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","skip"]}	0
317	images/17_9.jpg	 pear	{"x":[["159","24"],[],[]],"y":[["157","24"],[],[]]}	{"answers":["correct","correct","skip"]}	0
299	images/20_5.jpg	 dolphin	{"x":[["100","83"],[],[]],"y":[["99","83"],[],[]]}	{"answers":["correct","correct","skip"]}	0
449	images/21_0.jpg	 map	{"x":[["70","159"],[],[]],"y":[["68","159"],[],[]]}	{"answers":["correct","correct","skip"]}	0
273	images/14_0.jpg	 shorts	{"x":[["47","40"],[],[],[]],"y":[["49","40"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
472	images/3_7.jpg	 tooth	{"x":[["75","123"],[],[]],"y":[["75","122"],[],[]]}	{"answers":["correct","correct","skip"]}	0
420	images/7_5.jpg	 t-shirt	{"x":[["175","95"],[],[],[],[]],"y":[["176","95"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
434	images/22_7.jpg	 door	{"x":[["65","66"],[],[],[]],"y":[["65","70"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
431	images/22_3.jpg	 door	{"x":[["76","97"],[],[],[],[],[]],"y":[["75","97"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
291	images/20_8.jpg	 dolphin	{"x":[["101","55"],[],[]],"y":[["100","56"],[],[]]}	{"answers":["correct","correct","skip"]}	0
439	images/22_9.jpg	 door	{"x":[["100","78"],[],[]],"y":[["99","78"],[],[]]}	{"answers":["correct","correct","skip"]}	0
185	images/15_4.jpg	 triangle	{"x":[["103","67"],[],[]],"y":[["103","65"],[],[]]}	{"answers":["correct","correct","skip"]}	0
457	images/15_4.jpg	 triangle	{"x":[["103","67"],[],[]],"y":[["103","65"],[],[]]}	{"answers":["correct","correct","skip"]}	0
106	images/4_2.jpg	 cathead	{"x":[["39","105"],["238","237","236","235","233","232","231","230","227","225","223","222","219","218","216","216","216","216","217","218","218.696526033147","219.97185502437742","221","221","221","221","221","221","220","218","216.4814867952694","213.99612005515286","211.31146522159713","208.57654544375265","207"],[]],"y":[["41","105"],["143","143","143","143","143","144","144","145","146","147","148","148","149","149","149","152","158","161","163","168","174.96526033146992","181.84810392726135","185","192","196","199","202","209","215","219","225.83330942128768","232.37723425025098","238.84195608685508","245.28557415504898","249"],[]]}	{"answers":["wrong","skip","skip"]}	0
340	images/4_2.jpg	 cat head	{"x":[["39","105"],["238","237","236","235","233","232","231","230","227","225","223","222","219","218","216","216","216","216","217","218","218.696526033147","219.97185502437742","221","221","221","221","221","221","220","218","216.4814867952694","213.99612005515286","211.31146522159713","208.57654544375265","207"],[]],"y":[["41","105"],["143","143","143","143","143","144","144","145","146","147","148","148","149","149","149","152","158","161","163","168","174.96526033146992","181.84810392726135","185","192","196","199","202","209","215","219","225.83330942128768","232.37723425025098","238.84195608685508","245.28557415504898","249"],[]]}	{"answers":["wrong","skip","skip"]}	0
332	images/4_8.jpg	 cat head	{"x":[["170","100"],["103","103","103","103","103","103","103","103","102","101","99","98","97","96","96","95","94","93","93","92","91","90","89","89","88","87","86","85","84","82","81","80","80","79","78","77","76","75","74","73","71","69","67","66","65","64","61","61","59","57","56","55","55","53","52","51","50","49","48","47","46","45","44","43","43","42","41","41","41","41","41","41","41","41","40","40","39","39","38","38","37","37","37","36","36","36","35","35","35","34","34","34","34","34","34","34","34","34","34","34","35","35","35","35","35","35","35","35","35","35","35","35","35","35","34","34","33","32","31","31","30","29","28","28","28","27","27","27","27","27","27","27","27","27","27","29","30","31","33","36","39","41","46","48","50","54","56","58","59","63","64","68","70","72","75","77","79","80","84","85","86","89","91","92","95","97","99","103","106","108","110","115","118","120","121","125","128","129","130","132","134","135","137","139","140","141","142","143","145","146","148","149","152","154","155","159"],[],[],[]],"y":[["170","99"],["91","90","89","88","87","86","85","84","83","82","80","79","78","76","75","75","74","74","73","73","72","71","71","70","70","69","68","67","66","64","63","62","61","61","60","59","59","58","57","57","55","54","53","52","51","50","49","48","47","45","44","44","43","41","40","39","38","37","35","34","33","31","30","29","28","27","26","27","28","30","32","34","38","41","45","51","54","58","61","67","70","72","76","78","79","81","85","86","90","91","93","96","97","98","100","101","103","104","106","107","109","111","113","114","115","116","117","118","119","120","121","123","124","126","128","130","131","132","135","136","137","140","141","144","145","149","151","153","158","160","163","165","168","169","170","172","173","175","176","178","180","181","184","186","186","188","188","189","189","190","191","192","192","193","194","194","195","195","196","196","197","198","199","200","202","202","203","204","205","206","207","209","210","211","211","213","215","216","217","218","219","220","221","221","222","223","223","223","223","223","223","223","223","223","223","222"],[],[],[]]}	{"answers":["wrong","correct","correct","correct","correct"]}	0
430	images/12_3.jpg	 boomerang	{"x":[["124","101"],[],[],[],[]],"y":[["123","101"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
84	images/0_4.jpg	 microwave	{"x":[["66","54"],[],[],[]],"y":[["69","54"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
356	images/0_4.jpg	 microwave	{"x":[["66","54"],[],[],[]],"y":[["69","54"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
470	images/16_4.jpg	 suitcase	{"x":[["65","79"],[],[],[]],"y":[["67","77"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
380	images/13_7.jpg	 cactus	{"x":[["176","45"],[],[],[],[]],"y":[["176","46"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
427	images/12_2.jpg	 boomerang	{"x":[["31","125"],[],[]],"y":[["31","126"],[],[]]}	{"answers":["correct","correct","skip"]}	0
423	images/12_1.jpg	 boomerang	{"x":[["55","196"],[],[],[]],"y":[["54","196"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
141	images/21_4.jpg	 map	{"x":[["46","34"],[],[],[],[],[],[],[]],"y":[["51","34"],[],[],[],[],[],[],[]]}	{"answers":["wrong","correct","correct","correct","correct","correct","correct","skip"]}	0
441	images/21_4.jpg	 map	{"x":[["46","34"],[],[],[],[],[],[],[]],"y":[["51","34"],[],[],[],[],[],[],[]]}	{"answers":["wrong","correct","correct","correct","correct","correct","correct","skip"]}	0
476	images/3_0.jpg	 tooth	{"x":[["65","138"],[],[],[],[]],"y":[["65","139"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
321	images/11_8.jpg	 megaphone	{"x":[["107","156"],[],[],[],[]],"y":[["110","156"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
80	images/17_3.jpg	 pear	{"x":[["72","157"],["139","139","139","139","138","137","137","136","135","134","134","133","133","132","131","131","130","129","129","128","127","126","125","124","123","121","120","119","117","116","115","113","112","111","110","108","107","106","105","104","103","102","101","100","99","98","97","95","94","93","91","90","89","89","88","86","85","84","83","82","81","80","79","79","77","77","76","76","75","75","74","74","74","74","73","73"],[],[],[],[],[],[]],"y":[["73","156"],["27.1953125","28.1953125","29.1953125","31.1953125","32.1953125","34.1953125","36.1953125","39.1953125","41.1953125","44.1953125","45.1953125","47.1953125","49.1953125","51.1953125","52.1953125","54.1953125","56.1953125","58.1953125","59.1953125","61.1953125","63.1953125","65.1953125","67.1953125","68.1953125","71.1953125","73.1953125","74.1953125","76.1953125","79.1953125","80.1953125","82.1953125","84.1953125","86.1953125","88.1953125","89.1953125","91.1953125","93.1953125","94.1953125","96.1953125","98.1953125","99.1953125","101.1953125","103.1953125","105.1953125","107.1953125","110.1953125","112.1953125","115.1953125","117.1953125","120.1953125","123.1953125","125.1953125","128.1953125","131.1953125","134.1953125","137.1953125","140.1953125","142.1953125","146.1953125","149.1953125","151.1953125","154.1953125","157.1953125","159.1953125","162.1953125","164.1953125","166.1953125","168.1953125","171.1953125","172.1953125","173.1953125","175.1953125","176.1953125","178.1953125","180.1953125","182.1953125"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct"]}	0
252	images/6_4.jpg	 fireplace	{"x":[["202","219"],[],[]],"y":[["200","219"],[],[]]}	{"answers":["correct","correct","skip"]}	0
357	images/0_7.jpg	 microwave	{"x":[["53","89"],[],["53","55","58","59","66","72","76","83","89","96","101","108","111","114","118","119","122","124","125","126","127","128","130","131","132","134","135","136","138","139","140","142","143","145","148","149","151","156","157","159","163","164","165","166","168","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","168","164","163","160"],[],[]],"y":[["52","89"],[],["90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","89","89","87","87","86","85","85","84","84","84","84","84","84","84","84","84","84","85","85","85","86","87","88","92","94","97","103","107","111","117","120","124","128","134","140","143","147","149","151","152","155","156","157","158","159","160","161","162","163","164","165","166","167","167","168","169","169"],[],[]]}	{"answers":["correct","correct","correct","correct","correct"]}	0
79	images/17_4.jpg	 pear	{"x":[["126","68"],[],[]],"y":[["126","67"],[],[]]}	{"answers":["correct","correct","skip"]}	0
320	images/17_6.jpg	 pear	{"x":[["172","22"],[],[],[],[]],"y":[["172","23"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
328	images/11_6.jpg	 megaphone	{"x":[["119","76"],[],[]],"y":[["120","76"],[],[]]}	{"answers":["correct","correct","skip"]}	0
268	images/9_4.jpg	 pizza slice	{"x":[["198","29"],[],[]],"y":[["198","32"],[],[]]}	{"answers":["correct","correct","skip"]}	0
262	images/9_1.jpg	 pizza slice	{"x":[["70","77"],[],[]],"y":[["70","78"],[],[]]}	{"answers":["correct","correct","skip"]}	0
104	images/4_0.jpg	 cathead	{"x":[["127","100"],[],[],[],[]],"y":[["126","100"],[],[],[],[]]}	{"answers":["skip","correct","correct","correct","correct","correct"]}	0
331	images/4_0.jpg	 cat head	{"x":[["127","100"],[],[],[],[]],"y":[["126","100"],[],[],[],[]]}	{"answers":["skip","correct","correct","correct","correct","correct"]}	0
256	images/6_2.jpg	 fireplace	{"x":[["104","165"],[],[],[],[],[],[],[],[]],"y":[["104","164"],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
114	images/2_5.jpg	 houseplant	{"x":[["171","67"],["89","90","91","94","96","98","100","105","107","109","114","117","120","121","126","129","132","136","138","140","143","145","146","149","150","151","152","155","157","158","161","162","164","167","168","170","171","173","174","175","176","177","178","179"]],"y":[["171","68"],["171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","171","170","170","170","170","169","169","168","168","168","168","167","167","166","166","166","164","164","164","163","162","162","162"]]}	{"answers":["wrong","correct"]}	0
456	images/15_6.jpg	 triangle	{"x":[["118","30"],[],[]],"y":[["118","32"],[],[]]}	{"answers":["correct","correct","skip"]}	0
467	images/16_0.jpg	 suitcase	{"x":[["32","73"],[],[],[],[],[]],"y":[["33","73"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
296	images/20_1.jpg	 dolphin	\N	{"answers":["skip","skip"]}	0
301	images/8_6.jpg	 carrot	{"x":[["192","24"],[],[],[]],"y":[["191","24"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
253	images/6_8.jpg	 fireplace	{"x":[["40","231"],[],[]],"y":[["40","228"],[],[]]}	{"answers":["correct","correct","skip"]}	0
311	images/17_0.jpg	 pear	{"x":[["159","25"],[],[],[],[],[]],"y":[["158","25"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
258	images/6_7.jpg	 fireplace	{"x":[["236","219"],[],[]],"y":[["236","217"],[],[]]}	{"answers":["correct","correct","skip"]}	0
372	images/13_2.jpg	 cactus	{"x":[["163","130"],[],[],[],[]],"y":[["162","130"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
418	images/7_4.jpg	 t-shirt	{"x":[["85","39"],[],[]],"y":[["84","39"],[],[]]}	{"answers":["correct","correct","skip"]}	0
401	images/24_4.jpg	 flashlight	{"x":[["89","225"],[],[]],"y":[["91","225"],[],[]]}	{"answers":["correct","correct","skip"]}	0
339	images/4_7.jpg	 cat head	{"x":[["99","91"],[]],"y":[["98","91"],[]]}	{"answers":["wrong","skip"]}	0
264	images/9_7.jpg	 pizza slice	{"x":[["65","48"],[],[]],"y":[["65","47"],[],[]]}	{"answers":["correct","correct","skip"]}	0
415	images/7_1.jpg	 t-shirt	{"x":[["80","53"],[],[],[],[],[]],"y":[["73.07035354437184","53.989949493661165"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
355	images/0_2.jpg	 microwave	{"x":[["54","40"],[],[],[],[],[]],"y":[["54","47"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
459	images/15_8.jpg	 triangle	{"x":[["146","46"],[],[],[]],"y":[["146","47"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
310	images/8_7.jpg	 carrot	{"x":[["154","129"],[],[],[]],"y":[["154","130"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
145	images/21_5.jpg	 map	{"x":[["31","211"],[],[],[],[],[],[],[],[],[]],"y":[["34","211"],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
447	images/21_5.jpg	 map	{"x":[["31","211"],[],[],[],[],[],[],[],[],[]],"y":[["34","211"],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
409	images/24_9.jpg	 flashlight	{"x":[["44","200"],[],[],[]],"y":[["44","199"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
451	images/15_1.jpg	 triangle	{"x":[["52","189"],[],[],[]],"y":[["52","187"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
341	images/23_4.jpg	 knife	{"x":[["113","147"],[],[],[]],"y":[["114","147"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
435	images/22_6.jpg	 door	\N	{"answers":["skip","skip"]}	0
416	images/7_8.jpg	 t-shirt	{"x":[["75","61"],[],[],[],[],[]],"y":[["75","63"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
263	images/9_3.jpg	 pizza slice	{"x":[["51","31"],[],[],[]],"y":[["50","31"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
337	images/4_4.jpg	 cat head	{"x":[["58","178"],[]],"y":[["58","177"],[]]}	{"answers":["wrong","skip"]}	0
190	images/15_7.jpg	 triangle	{"x":[["124","34"],[],[],["95","96","97","98","100","102","104","104","104","106","106","107","107","107","108","108","108","109","109","110","111","112","113","113","114","115","115","116","117","117","118","118","119","120","121","121","122","123","124","125","126","127","128","129","130","131","132","133","135","136","137","137","140","140","141","142","143","143","144","144","145","145","145","146","146","146","147","147","148","148","149","150","151","152","153","155","156","158","159","163","165","167","169","172","174","176","178","179","181","181","182","183","184","184","185","186","187","188","188","189","189","190","191","191","192","192","193","193","194","196","197","199","202","203","204","206","209","210","211","213","214","215","215","216","216","217","217","217","217","218","218","218","219","219","219","219","219","219","218","217","216","215","214","213","213","212","211","209","207","206","204","200","199","197","194","191","189","188","186","183","182","180","177","175","173","169","167","165","163","160","158","156","153","151","149","147","141","139","134","128","125","122","115","110","107","100","97","90","86","82","80","76","74","72","71","69","67","66","64","63","62","61","60","59","58","57","56","55","53","52","51","49","47","46","45","44","44","44","44","44","44","44","44","44","44","44","46.75743509005417","48","50","52","53","54","57","58","59","61","62","63","65","67","67","71","72","74","77","78","80","81","83","84","84","86","87","88","89","90","91","92","94","94","95","96","98","99","100","101","102","103","104","105","105","105","106","106","107","107","107","107","108","108","108","109","109","110","110","111","111","112","113","114","115","117","118","118","119","121","123","124","126","127","128","130","131","132","136","137","139","143","145","146","148","152","155","157","160.8829013735766","163","164","167","169","169","171","171","173","174","175","176","178","179","180","181","182","183","184","184","185","185","186","186","186","186","186","186","187","188","189","189","191.01143519896442","193.66502765971296","195","198.1304951684997","201","203","206","209","210","211","212","212","214","215","216","217","220","222","223","224","224","224","223","222","220","219","218"],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],"y":[["123","35"],[],[],["89","88","86","85","82","77","73","71","68","63","60","58","56","54","53","51","50","50","48","46","46","44","42","41","39","37","35","34","32","30","30","29","27","26","25","24","24","24","24","24","24","24","24","24","25","27","29","30","33","35","36","39","44","46","48","53","55","57","60","62","63","65","69","70","75","76","77","80","82","84","85","89","90","92","93","96","98","100","103","108","110","113","115","120","121","124","126","129","132","133","135","138","139","140","143","144","146","149","151","152","154","158","159","161","164","166","167","169","173","178","180","183","189","192","194","197","201","204","205","209","210","212","213","213","214","215","216","217","218","218","219","220","221","222","223","224","225","226","227","228","229","229","230","230","231","231","232","232","233","233","233","234","234","235","235","236","236","236","237","237","237","237","238","238","238","238","238","238","239","239","240","240","240","241","241","241","242","242","242","242","242","243","243","243","243","243","243","243","243","243","242","240","239","239","238","237","237","236","235","235","235","235","234","234","234","234","234","234","234","234","234","234","234","234","234","234","233","231","229","227","221","219","215","208","204","200","193.5659847898736","190","187","181","178","176","171","169","168","164","162","160","158","155","154","150","147","145","140","138","136","134","131","128","127","124","123","122","120","118","114","113","109","108","106","104","99","97","94","90","87","85","83","80","79","78","75","73","71","70","68","67","64","63","62","59","57","55","52","51","50","48","45","43","43","40","39","38","38","36","36","36","36","36","37","40","42","44","48","50","53","58","60","63","66","71","73","76","81.8243520603649","85","87","93","95","96","100","101","104","106","108","110","113","116","118","122","123","126","129","131","134","137","139","141","143","147","149","152","157","160","165","167","173.70478399654806","180.18231802210582","183","189.2609903369994","195","197","201","205","207","207","208","209","214","217","218","220","226","229","231","232","233","234","234","234","234","234","233"],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
454	images/15_7.jpg	 triangle	{"x":[["124","34"],[],[],["95","96","97","98","100","102","104","104","104","106","106","107","107","107","108","108","108","109","109","110","111","112","113","113","114","115","115","116","117","117","118","118","119","120","121","121","122","123","124","125","126","127","128","129","130","131","132","133","135","136","137","137","140","140","141","142","143","143","144","144","145","145","145","146","146","146","147","147","148","148","149","150","151","152","153","155","156","158","159","163","165","167","169","172","174","176","178","179","181","181","182","183","184","184","185","186","187","188","188","189","189","190","191","191","192","192","193","193","194","196","197","199","202","203","204","206","209","210","211","213","214","215","215","216","216","217","217","217","217","218","218","218","219","219","219","219","219","219","218","217","216","215","214","213","213","212","211","209","207","206","204","200","199","197","194","191","189","188","186","183","182","180","177","175","173","169","167","165","163","160","158","156","153","151","149","147","141","139","134","128","125","122","115","110","107","100","97","90","86","82","80","76","74","72","71","69","67","66","64","63","62","61","60","59","58","57","56","55","53","52","51","49","47","46","45","44","44","44","44","44","44","44","44","44","44","44","46.75743509005417","48","50","52","53","54","57","58","59","61","62","63","65","67","67","71","72","74","77","78","80","81","83","84","84","86","87","88","89","90","91","92","94","94","95","96","98","99","100","101","102","103","104","105","105","105","106","106","107","107","107","107","108","108","108","109","109","110","110","111","111","112","113","114","115","117","118","118","119","121","123","124","126","127","128","130","131","132","136","137","139","143","145","146","148","152","155","157","160.8829013735766","163","164","167","169","169","171","171","173","174","175","176","178","179","180","181","182","183","184","184","185","185","186","186","186","186","186","186","187","188","189","189","191.01143519896442","193.66502765971296","195","198.1304951684997","201","203","206","209","210","211","212","212","214","215","216","217","220","222","223","224","224","224","223","222","220","219","218"],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],"y":[["123","35"],[],[],["89","88","86","85","82","77","73","71","68","63","60","58","56","54","53","51","50","50","48","46","46","44","42","41","39","37","35","34","32","30","30","29","27","26","25","24","24","24","24","24","24","24","24","24","25","27","29","30","33","35","36","39","44","46","48","53","55","57","60","62","63","65","69","70","75","76","77","80","82","84","85","89","90","92","93","96","98","100","103","108","110","113","115","120","121","124","126","129","132","133","135","138","139","140","143","144","146","149","151","152","154","158","159","161","164","166","167","169","173","178","180","183","189","192","194","197","201","204","205","209","210","212","213","213","214","215","216","217","218","218","219","220","221","222","223","224","225","226","227","228","229","229","230","230","231","231","232","232","233","233","233","234","234","235","235","236","236","236","237","237","237","237","238","238","238","238","238","238","239","239","240","240","240","241","241","241","242","242","242","242","242","243","243","243","243","243","243","243","243","243","242","240","239","239","238","237","237","236","235","235","235","235","234","234","234","234","234","234","234","234","234","234","234","234","234","234","233","231","229","227","221","219","215","208","204","200","193.5659847898736","190","187","181","178","176","171","169","168","164","162","160","158","155","154","150","147","145","140","138","136","134","131","128","127","124","123","122","120","118","114","113","109","108","106","104","99","97","94","90","87","85","83","80","79","78","75","73","71","70","68","67","64","63","62","59","57","55","52","51","50","48","45","43","43","40","39","38","38","36","36","36","36","36","37","40","42","44","48","50","53","58","60","63","66","71","73","76","81.8243520603649","85","87","93","95","96","100","101","104","106","108","110","113","116","118","122","123","126","129","131","134","137","139","141","143","147","149","152","157","160","165","167","173.70478399654806","180.18231802210582","183","189.2609903369994","195","197","201","205","207","207","208","209","214","217","218","220","226","229","231","232","233","234","234","234","234","234","233"],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
280	images/14_8.jpg	 shorts	{"x":[["20","91"],[]],"y":[["20","94"],[]]}	{"answers":["skip","correct","correct"]}	0
64	images/8_3.jpg	 carrot	{"x":[["152","18"],[]],"y":[["152","19"],[]]}	{"answers":["skip","correct","correct"]}	0
303	images/8_3.jpg	 carrot	{"x":[["152","18"],[]],"y":[["152","19"],[]]}	{"answers":["skip","correct","correct"]}	0
147	images/21_7.jpg	 map	{"x":[["28","35"],[],[],[],[],[],[],[],[],[],["31","32","38","42","46","53","60","67","74","81","88","95","102","108","111","114","120","122","126","128","130","131","135","138","143","146","149","155","158","160","166","168","170","174","177","179","183","185","188","190","194","197","199","201","204","207","208","211","211","213","215","216","218","220","222","223","225","227","228","229","230","230","230","230","229","228","228","226","226","225","224","223","223","222.13175685787553","222","222","222","222","222","222","222","222","222.77302068252393","223","224","224.98994949366116","226","226","227","228","228","228","228","228","228","228","228","228","228","227","227","227","227","227","227","227","227","227","227","228","228","228","228","228","228","228","227","227","225","225","224","223","222","222","221","220","218","218","216","213","211","209","205","202","199","195","192","190","186","184","182","179","178","175","172","168","166","163","156","154","151","147","140.05405486300432","135","130","123","120","117","111","109","106","104","100","98","96","92","90","89","84","82","81","79","74","73","71","67","65","64","60","59","57","54","53","52","49","48","46","44","43","41","40","37","36","33","32","31","29","29"],[],[]],"y":[["28","36"],[],[],[],[],[],[],[],[],[],["27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","27","29","29","30","31","31","32","33","34","35","36","36","36","36","36","36","36","36","36","36","36","36","35","35","35","34","34","33","33","32","32","32","32","32","32","33","34","37","38","40","42","45","48","51","56","59","62","68.94594513699568","73","78","84","87","90","97","101","105","111.95718614271533","116","120","126.92964645562816","130","133","135","140","144","146","151","153","156","158","163","165","167","173","175","177","179","184","189","191","193","198","199","203","204","205","207","209","210","211","212","213","215","216","217","219","220","221","221","222","222","223","223","224","224","225","226","227","227","228","228","229","229","229","229","229","229","229","229","229","229","229","229","229","230","230","230.86824314212447","231","231","231","231","231","231","231","231","231","231","231","231","232","233","233","234","235","235","236","237","237","237","237","237","237","237","237","237","237","237","237","236","236","236","235","235","235","235","234","234","233","233","233","232","231"],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
442	images/21_9.jpg	 map	{"x":[["66","40"],[]],"y":[["61","40"],[]]}	{"answers":["wrong","skip"]}	0
7	images/22_5.jpg	 door	{"x":[["84","123"],[],[],[]],"y":[["84","122"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
413	images/7_6.jpg	 t-shirt	{"x":[["79","59"],[],[],[]],"y":[["79","60"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
307	images/8_2.jpg	 carrot	{"x":[["148","141"],[],[],[]],"y":[["148","140"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
284	images/5_7.jpg	 truck	{"x":[["59","161"],[],[]],"y":[["58","161"],[],[]]}	{"answers":["correct","correct","skip"]}	0
462	images/16_7.jpg	 suitcase	{"x":[["35","68"],[],[],[],[],[],[],[],[],[],[]],"y":[["35","67"],[],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
15	images/1_6.jpg	 golfclub	{"x":[["82","25"],["87","87","87","87","87","87","87","87","86","86","85","85","84","84","84","83","83","83","82","82","82","82","82","82","82","82","82","82"],[],[]],"y":[["82","24"],["27","28","31","32","35","36","37","40","42","44","45","46","48","49","50","50","52","53","54","55","56","57","58","59","60","61","63","64"],[],[]]}	{"answers":["wrong","correct","correct","correct"]}	0
396	images/1_6.jpg	 golf club	{"x":[["82","25"],["87","87","87","87","87","87","87","87","86","86","85","85","84","84","84","83","83","83","82","82","82","82","82","82","82","82","82","82"],[],[]],"y":[["82","24"],["27","28","31","32","35","36","37","40","42","44","45","46","48","49","50","50","52","53","54","55","56","57","58","59","60","61","63","64"],[],[]]}	{"answers":["wrong","correct","correct","correct"]}	0
181	images/15_5.jpg	 triangle	{"x":[["176","97"],[],[],[],["145","143","141","138","133","131","128","126","122","121","117.52702743150216","116","115","111","110","110","109","107","107","106","104","103","101","100","98","96","95","94","94","92","91","91","90","89","88","87","86","85","83","82","80","77","75","74","72","70","66","64","61","56","54","52","48","46","45","43","41","39","39","37","36","35","34","33","32","31","30","29","27","27","26","25","24","23","23","25","26","28","33","35","37","43","45","47","50","56.554304242983314","60","63","69.95718614271533","76","80","86.73066763348577","92","96","99","105","107","110","117","121","124","128","134.92964645562816","138","141","147","151","155","160","164","168","174.92964645562816","179","183","189","192","195","197","203","205","208","212","215","218","220","224","226","229","231","234","237","238","239","240","241"],[],[],[],[]],"y":[["176","95"],[],[],[],["44","47","48","50","54","56","59","60","65","66","72.07770199487122","76","77","81","82","83","84","85","87","88","91","92","96","97","100","103","105","107","109","112","113","114","117","117","119","122","124","125","129","132","134","139","141","144","146","149","153","156","157","161","163","165","168","170","172","172","175","177","178","181","182","183","184","186","187","188","189","190","191","192","192","193","194","194","195","195","196","197","199","200","201","203","204","205","205","207.45786409111875","208","209","209.77302068252393","211","211","212.92304789528166","214","214","215","215","215","215","215","215","215","214","213.01005050633884","212","212","211","210","210","209","209","209","208.01005050633884","208","208","207","206","206","206","205","204","203","203","202","202","202","202","202","202","201","201","201","201","201","201","201"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
432	images/22_1.jpg	 door	{"x":[["85","96.6015625"],[],[],[],[]],"y":[["86","95.6015625"],[],[],[],[]]}	{"answers":["skip","correct","correct","correct","correct","correct"]}	0
363	images/10_1.jpg	 snorkel	{"x":[["204","71"],[],[],[]],"y":[["206","71"],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
362	images/10_9.jpg	 snorkel	{"x":[["216","34"],[],[],[],[],[],[]],"y":[["216","35"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","skip"]}	0
184	images/15_0.jpg	 triangle	{"x":[["64","146"],[],[],[],["136","135","134","131","130","128","126","126","123","123","121","119","119","118","115","114","114","110","110","108","107","104","103","101","100","98","97","96","95","94","94","92","92","91","90","88","87","86","84","84"],[],[]],"y":[["64","150"],[],[],[],["29","29","29","29","29","30","32","33","35","37","38","42","43","44","46","48","49","52","53","55","57","61","63","65","67","71","73","75","78","80","81","84","85","87","89","92","94","96","99","101"],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct"]}	0
455	images/15_5.jpg	 triangle	{"x":[["176","97"],[],[],[],["145","143","141","138","133","131","128","126","122","121","117.52702743150216","116","115","111","110","110","109","107","107","106","104","103","101","100","98","96","95","94","94","92","91","91","90","89","88","87","86","85","83","82","80","77","75","74","72","70","66","64","61","56","54","52","48","46","45","43","41","39","39","37","36","35","34","33","32","31","30","29","27","27","26","25","24","23","23","25","26","28","33","35","37","43","45","47","50","56.554304242983314","60","63","69.95718614271533","76","80","86.73066763348577","92","96","99","105","107","110","117","121","124","128","134.92964645562816","138","141","147","151","155","160","164","168","174.92964645562816","179","183","189","192","195","197","203","205","208","212","215","218","220","224","226","229","231","234","237","238","239","240","241"],[],[],[],[]],"y":[["176","95"],[],[],[],["44","47","48","50","54","56","59","60","65","66","72.07770199487122","76","77","81","82","83","84","85","87","88","91","92","96","97","100","103","105","107","109","112","113","114","117","117","119","122","124","125","129","132","134","139","141","144","146","149","153","156","157","161","163","165","168","170","172","172","175","177","178","181","182","183","184","186","187","188","189","190","191","192","192","193","194","194","195","195","196","197","199","200","201","203","204","205","205","207.45786409111875","208","209","209.77302068252393","211","211","212.92304789528166","214","214","215","215","215","215","215","215","215","214","213.01005050633884","212","212","211","210","210","209","209","209","208.01005050633884","208","208","207","206","206","206","205","204","203","203","202","202","202","202","202","202","201","201","201","201","201","201","201"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
220	images/14_1.jpg	 shorts	{"x":[["36","56"],[],["32","32","32","32","32","32","32","32","32","32","32","32","32","32","32","32","31","31","30","29","29","28","28","28","28","27","27","27","27","26","26","26","25","25","24","24","23","23","23","22","22","22","22","21","21","21","20","20","19","18","18","18","17","17","17","17","17","17"],[]],"y":[["36","57"],[],["58","59","60","62","68","70","73","75","78","80","82","85","86","88","92","93","95","97","101","103","105","108","110","111","114","115","116","119","121","122","123","127","129","130","135","137","141","145","147","150","152","155","156","159","161","162","165","167","169","173","174","177","179","181","183","184","185","186"],[]]}	{"answers":["correct","correct","correct","correct"]}	0
279	images/14_1.jpg	 shorts	{"x":[["36","56"],[],["32","32","32","32","32","32","32","32","32","32","32","32","32","32","32","32","31","31","30","29","29","28","28","28","28","27","27","27","27","26","26","26","25","25","24","24","23","23","23","22","22","22","22","21","21","21","20","20","19","18","18","18","17","17","17","17","17","17"],[]],"y":[["36","57"],[],["58","59","60","62","68","70","73","75","78","80","82","85","86","88","92","93","95","97","101","103","105","108","110","111","114","115","116","119","121","122","123","127","129","130","135","137","141","145","147","150","152","155","156","159","161","162","165","167","169","173","174","177","179","181","183","184","185","186"],[]]}	{"answers":["correct","correct","correct","correct"]}	0
87	images/0_7.jpg	 microwave	{"x":[["53","89"],[],["53","55","58","59","66","72","76","83","89","96","101","108","111","114","118","119","122","124","125","126","127","128","130","131","132","134","135","136","138","139","140","142","143","145","148","149","151","156","157","159","163","164","165","166","168","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","169","168","164","163","160"],[],[]],"y":[["52","89"],[],["90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","90","89","89","87","87","86","85","85","84","84","84","84","84","84","84","84","84","84","85","85","85","86","87","88","92","94","97","103","107","111","117","120","124","128","134","140","143","147","149","151","152","155","156","157","158","159","160","161","162","163","164","165","166","167","167","168","169","169"],[],[]]}	{"answers":["correct","correct","correct","correct","correct"]}	0
436	images/22_2.jpg	 door	{"x":[["100","71"],[],[],[]],"y":[["99","71"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
463	images/16_5.jpg	 suitcase	{"x":[["38","64"],[],[],[],[],[]],"y":[["39","64"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
204	images/18_1.jpg	 skateboard	{"x":[["197","121"],[],["73","72","71","70","69","68","68","68","69","71","72","74","78.94974746830583","80","82","84","85","86","88","89","90","91","92","92","93","94","94","95","95","95","95","95"],[],[]],"y":[["196","121"],[],["118","118","118","118","118","118","119","121","123","126","127","128","132.94974746830584","134","135","137","138","138","139","139","140","140","140","141","141","141","140","139","136","132","130","126"],[],[]]}	{"answers":["correct","correct","correct","correct","correct"]}	0
385	images/18_1.jpg	 skateboard	{"x":[["197","121"],[],["73","72","71","70","69","68","68","68","69","71","72","74","78.94974746830583","80","82","84","85","86","88","89","90","91","92","92","93","94","94","95","95","95","95","95"],[],[]],"y":[["196","121"],[],["118","118","118","118","118","118","119","121","123","126","127","128","132.94974746830584","134","135","137","138","138","139","139","140","140","140","141","141","141","140","139","136","132","130","126"],[],[]]}	{"answers":["correct","correct","correct","correct","correct"]}	0
300	images/20_7.jpg	 dolphin	{"x":[["124","81"],[],[],[],[],[]],"y":[["123","81"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
399	images/1_5.jpg	 golf club	{"x":[["86","34"],[]],"y":[["86","35"],[]]}	{"answers":["wrong","skip"]}	0
214	images/14_9.jpg	 shorts	{"x":[["92","110"],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],"y":[["92","112"],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","correct","skip"]}	0
196	images/16_3.jpg	 suitcase	{"x":[["213","74"],[],[],[],["156","155","160","161","163","170","174","177","181","184","190","194","197","204","206","208","211","212","213","214","215","216","217","218","219","220","221","221","222","223","223","224","226","227","228","229","230","231","232","232","232","232","232","232","231","231","231","230","230","229","229","229","228","228","228","228","228","227","227","227","227","226","226","225","224","223","222","222","220","219","218","217","216","215","215","214","214","213","213","212","211","211","211","211","210","210","210","209","209","209","208","208","208","207","207","207","207","207","207","207","207","207","207","208","208","208","208","209","209","209","210","211","211","212","213","213","214","214","215","215","215","215","215","215","215","215","215","215","214","213","212","209","208","207","202","200","197","190","186","182","177","170.9222980051288","167","164","160","154","151"],[],[],[]],"y":[["211","74"],[],[],[],["67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","68","68","68","68","69","69","69","70","70","71","71","72","72","73","74","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","92","94","95","98","99","101","103","105","107","108","112","114","116","118","121","122","124","127","129","130","133","134","136","137","138","141","143","145","149","151","153","158","160","162","167","170","172","174","178","182","184","189","191","193","198","199","201","204","205","206","208","209","211","212","213","214","214","216","217","218","219","220","221","222","223","224","225","227","228","230","232","233","234","235","237","238","238","240","240","241","241","241","241","241","239","238","237","233.52702743150218","232","231","230","228","227"],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct"]}	0
465	images/16_3.jpg	 suitcase	{"x":[["213","74"],[],[],[],["156","155","160","161","163","170","174","177","181","184","190","194","197","204","206","208","211","212","213","214","215","216","217","218","219","220","221","221","222","223","223","224","226","227","228","229","230","231","232","232","232","232","232","232","231","231","231","230","230","229","229","229","228","228","228","228","228","227","227","227","227","226","226","225","224","223","222","222","220","219","218","217","216","215","215","214","214","213","213","212","211","211","211","211","210","210","210","209","209","209","208","208","208","207","207","207","207","207","207","207","207","207","207","208","208","208","208","209","209","209","210","211","211","212","213","213","214","214","215","215","215","215","215","215","215","215","215","215","214","213","212","209","208","207","202","200","197","190","186","182","177","170.9222980051288","167","164","160","154","151"],[],[],[]],"y":[["211","74"],[],[],[],["67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","67","68","68","68","68","69","69","69","70","70","71","71","72","72","73","74","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","92","94","95","98","99","101","103","105","107","108","112","114","116","118","121","122","124","127","129","130","133","134","136","137","138","141","143","145","149","151","153","158","160","162","167","170","172","174","178","182","184","189","191","193","198","199","201","204","205","206","208","209","211","212","213","214","214","216","217","218","219","220","221","222","223","224","225","227","228","230","232","233","234","235","237","238","238","240","240","241","241","241","241","241","239","238","237","233.52702743150218","232","231","230","228","227"],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct"]}	0
208	images/18_2.jpg	 skateboard	{"x":[["88","119"],[],[],[],["83","83","83","83","83","83","83","83","83","83","84","86","87","89","91","95.48129079765135","96","97.92304789528164","99","100","100","100","98","97","93","89","86","84","78","76","74"],[],[],[],[],[]],"y":[["88","120"],[],[],[],["121","123","124","126","128","129","132","133","135","136","136","136","136","134","129","123.62245104281837","122","115.26933236651423","113","110","104","103","101","100","99","99","99","99","99","101","104"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
389	images/18_2.jpg	 skateboard	{"x":[["88","119"],[],[],[],["83","83","83","83","83","83","83","83","83","83","84","86","87","89","91","95.48129079765135","96","97.92304789528164","99","100","100","100","98","97","93","89","86","84","78","76","74"],[],[],[],[],[]],"y":[["88","120"],[],[],[],["121","123","124","126","128","129","132","133","135","136","136","136","136","134","129","123.62245104281837","122","115.26933236651423","113","110","104","103","101","100","99","99","99","99","99","101","104"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","correct","correct","correct","correct"]}	0
384	images/18_3.jpg	 skateboard	{"x":[["23","114"],[],[],[]],"y":[["25","114"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
289	images/5_4.jpg	 truck	{"x":[["170","162"],[],[],[],[]],"y":[["168","162"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
379	images/13_5.jpg	 cactus	{"x":[["63","66"],[],[],[]],"y":[["62","65"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
308	images/8_4.jpg	 carrot	{"x":[["122","106"],[],[],[]],"y":[["122","104"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
469	images/16_2.jpg	 suitcase	{"x":[["76","67"],[],[]],"y":[["77","66"],[],[]]}	{"answers":["correct","correct","skip"]}	0
343	images/23_9.jpg	 knife	{"x":[["153","163"],[],[],[]],"y":[["155","163"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
371	images/13_6.jpg	 cactus	{"x":[["175","132"],[],[],[],[],[]],"y":[["175","130"],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","skip"]}	0
318	images/17_5.jpg	 pear	{"x":[["130","80"],[],[],[],[]],"y":[["132","80"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
91	images/10_4.jpg	 snorkel	{"x":[["207","102"],[],[],[],[],[],[]],"y":[["207","101"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","skip"]}	0
370	images/10_4.jpg	 snorkel	{"x":[["207","102"],[],[],[],[],[],[]],"y":[["207","101"],[],[],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","correct","correct","skip"]}	0
290	images/5_2.jpg	 truck	{"x":[["216","162"],[],[]],"y":[["215","162"],[],[]]}	{"answers":["correct","correct","skip"]}	0
369	images/10_3.jpg	 snorkel	{"x":[["16","106"],[]],"y":[["16","107"],[]]}	{"answers":["correct","skip"]}	0
266	images/9_9.jpg	 pizza slice	{"x":[["71","67"],[],[],[]],"y":[["71","71"],[],[],[]]}	{"answers":["correct","correct","correct","skip"]}	0
352	images/0_5.jpg	 microwave	{"x":[["38","200"],[],[],[],[]],"y":[["42","200"],[],[],[],[]]}	{"answers":["correct","correct","correct","correct","skip"]}	0
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: mircs
--

COPY public.session (sid, sess, expire) FROM stdin;
ab_Vututcy9Dbbmj9z26eNLeDMLcYasM	{"cookie":{"originalMaxAge":31536000000,"expires":"2024-01-04T19:46:18.563Z","httpOnly":true,"path":"/"},"user_data":{"click_count":105,"score":2014.7588,"name":"quaint shirt","userid":"hw_c0qHY2","app_version":2,"email":"","expiration":1675209600000}}	2024-01-04 19:46:19
pkUf0S_Wpeb6N-oq7-HOuIcjG8HRF-Rt	{"cookie":{"originalMaxAge":31535999997,"expires":"2024-01-04T12:52:32.954Z","httpOnly":true,"path":"/"},"user_data":{"click_count":797,"score":56655.20099999997,"name":"testy class","userid":"_wqHCNMo_","app_version":2,"email":"","expiration":1675209600000}}	2024-01-04 12:52:33
3tngeUpkaeShWf7Q2cRZGF_SLaYMIGvV	{"cookie":{"originalMaxAge":31536000000,"expires":"2024-01-04T19:44:21.972Z","httpOnly":true,"path":"/"},"user_data":{"click_count":92,"score":1022.9199,"name":"thoughtless buyer","userid":"4zGDYTI12","app_version":2,"email":"","expiration":1675209600000}}	2024-01-04 19:44:22
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mircs
--

COPY public.users (_id, cookie, name, score, email, last_click_time) FROM stdin;
1	4zGDYTI12	thoughtless buyer	1022.9199	\N	\N
2	_wqHCNMo_	testy class	56655.20099999997	\N	\N
3	hw_c0qHY2	quaint shirt	2014.7588	\N	\N
\.


--
-- Name: clicks__id_seq; Type: SEQUENCE SET; Schema: public; Owner: mircs
--

SELECT pg_catalog.setval('public.clicks__id_seq', 2, true);


--
-- Name: cnn__id_seq; Type: SEQUENCE SET; Schema: public; Owner: mircs
--

SELECT pg_catalog.setval('public.cnn__id_seq', 1, false);


--
-- Name: image_count__id_seq; Type: SEQUENCE SET; Schema: public; Owner: mircs
--

SELECT pg_catalog.setval('public.image_count__id_seq', 2, true);


--
-- Name: images__id_seq; Type: SEQUENCE SET; Schema: public; Owner: mircs
--

SELECT pg_catalog.setval('public.images__id_seq', 500, true);


--
-- Name: users__id_seq; Type: SEQUENCE SET; Schema: public; Owner: mircs
--

SELECT pg_catalog.setval('public.users__id_seq', 3, true);


--
-- Name: clicks clicks_pkey; Type: CONSTRAINT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.clicks
    ADD CONSTRAINT clicks_pkey PRIMARY KEY (_id);


--
-- Name: cnn cnn_pkey; Type: CONSTRAINT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.cnn
    ADD CONSTRAINT cnn_pkey PRIMARY KEY (_id);


--
-- Name: image_count image_count_pkey; Type: CONSTRAINT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.image_count
    ADD CONSTRAINT image_count_pkey PRIMARY KEY (_id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (_id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: users users_cookie_key; Type: CONSTRAINT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cookie_key UNIQUE (cookie);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mircs
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (_id);


--
-- PostgreSQL database dump complete
--

