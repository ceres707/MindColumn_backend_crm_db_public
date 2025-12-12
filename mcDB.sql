PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ACCOUNT_Accruals
CREATE TABLE ACCOUNT_Accruals (
    id                      INTEGER PRIMARY KEY,
    A_lerce                 BOOLEAN,
    source_PUB              TEXT    REFERENCES PUB_publisher (tag),
    source                  TEXT,
    [end]                   TEXT,
    amount                  DECIMAL,
    settled_considered      DECIMAL,
    currency                TEXT,
    raw_amount              DECIMAL,
    raw_currency            TEXT,
    raw_desc                TEXT,
    raw_1add                DECIMAL,
    raw_2mul                DECIMAL,
    raw_3add                DECIMAL,
    raw_4mul                DECIMAL,
    timeFrame_desc          TEXT,
    timeFrame_cashFlow_days DECIMAL,
    timeFrame_division      DECIMAL,
    months_agoOffset        INTEGER,
    day_of_monthOffset      INTEGER,
    appearing_dayOffset     INTEGER,
    qual                    INTEGER,
    on_Historik             DATE,
    last_on_Historik        DATE,
    currently_end           DATE,
    PAID                    BOOLEAN,
    STRAT_keep_pace_up      BOOLEAN,
    dir                     TEXT
);


-- Table: ACCOUNT_Card
CREATE TABLE ACCOUNT_Card (
    id             INTEGER PRIMARY KEY,
    name           TEXT,
    cardholder     TEXT,
    expiration     DATE,
    digits         TEXT,
    safe_code      TEXT,
    PIN            TEXT,
    first_account  INTEGER REFERENCES ACCOUNT_Funds (id),
    protection     TEXT,
    pufferFISHwith INTEGER REFERENCES ACCOUNT_Card (id),
    in_PayPal      BOOLEAN,
    notes          TEXT
);


-- Table: ACCOUNT_Change
CREATE TABLE ACCOUNT_Change (
    source_currency TEXT,
    end_currency    TEXT,
    amount          REAL
);

INSERT INTO ACCOUNT_Change (
                               source_currency,
                               end_currency,
                               amount
                           )
                           VALUES (
                               'USD',
                               'EUR',
                               1.16
                           );

INSERT INTO ACCOUNT_Change (
                               source_currency,
                               end_currency,
                               amount
                           )
                           VALUES (
                               'JPY',
                               'EUR',
                               182.23
                           );


-- Table: ACCOUNT_Funds
CREATE TABLE ACCOUNT_Funds (
    id             INTEGER PRIMARY KEY,
    A_lerce        BOOLEAN,
    entity         TEXT,
    amount         DECIMAL,
    currency       TEXT,
    qual           INTEGER,
    reviewed       DATE,
    name           TEXT,
    IBAN           TEXT,
    bank_name      TEXT,
    BIC            TEXT,
    ach_wire       TEXT,
    branch_code    TEXT,
    code           TEXT,
    account_number TEXT,
    address        TEXT,
    main_card      INTEGER REFERENCES ACCOUNT_Card (id) 
);


-- Table: ACCOUNT_Funds_Prepaid
CREATE TABLE ACCOUNT_Funds_Prepaid (
    id            INTEGER PRIMARY KEY,
    A_lerce       BOOLEAN,
    end_entity    TEXT,
    amount        DECIMAL,
    currency      TEXT,
    date_reviewed DATE
);


-- Table: ACCOUNT_Journal
CREATE TABLE ACCOUNT_Journal (
    id         INTEGER PRIMARY KEY,
    A_lerce    BOOLEAN,
    source_PUB TEXT    REFERENCES PUB_publisher (tag),
    source     INTEGER REFERENCES ACCOUNT_Accruals (id),
    [end]      TEXT,
    amount     DECIMAL,
    currency   TEXT,
    date       DATE,
    file       TEXT,
    note       TEXT
);


-- Table: banter
CREATE TABLE banter (
    tag          TEXT    PRIMARY KEY,
    is_barreleye BOOLEAN,
    profile1     TEXT    REFERENCES profile (tag) MATCH [FULL],
    profile2     TEXT    REFERENCES profile (tag) MATCH [FULL],
    is_pipe      BOOLEAN
)
WITHOUT ROWID;


-- Table: bundle
CREATE TABLE bundle (
    tag          TEXT    PRIMARY KEY,
    is_barreleye BOOLEAN,
    profile1     TEXT    REFERENCES profile (tag) MATCH [FULL],
    profile2     TEXT    REFERENCES profile (tag) MATCH [FULL],
    origin       DATE,
    seq          INTEGER,
    withdrawed   BOOLEAN,
    is_pipe      BOOLEAN
)
WITHOUT ROWID;


-- Table: cNiche
CREATE TABLE cNiche (
    tag    TEXT,
    [desc] TEXT,
    PRIMARY KEY (
        tag
    )
);


-- Table: cPlace
CREATE TABLE cPlace (
    code        TEXT PRIMARY KEY,
    name        TEXT,
    ginkgolpage TEXT,
    wlinkuse    TEXT REFERENCES wlinkuse (tag) MATCH [FULL],
    number      TEXT,
    address     TEXT,
    mail        TEXT,
    inlink      TEXT,
    ginkgolink2 TEXT,
    tlink       TEXT,
    link        TEXT
)
WITHOUT ROWID;


-- Table: cPOI
CREATE TABLE cPOI (
    code             TEXT    PRIMARY KEY,
    src              TEXT    REFERENCES cPOI (code) MATCH [FULL],
    [src-Compliance] INTEGER,
    clownfish        BOOLEAN,
    name             TEXT,
    ginkgolink       TEXT,
    wlinkuse         TEXT    REFERENCES wlinkuse (tag) MATCH [FULL],
    number           TEXT,
    mail             TEXT,
    Piranha          BOOLEAN,
    Cod              BOOLEAN,
    burrowing_owl    TEXT    REFERENCES profile (tag) MATCH [FULL],
    inlink           TEXT,
    ginkgolink2      TEXT,
    ginkgolpage      TEXT,
    tlink            TEXT,
    link             TEXT,
    place1           TEXT    REFERENCES cPlace (code) MATCH [FULL],
    place2           TEXT    REFERENCES cPlace (code) MATCH [FULL],
    qual             INTEGER
)
WITHOUT ROWID;


-- Table: cPOIlinks
CREATE TABLE cPOIlinks (
    id            INTEGER PRIMARY KEY,
    code          TEXT    REFERENCES cPOI (code),
    platform      TEXT,
    link          TEXT,
    S2_sea_horse  TEXT    REFERENCES profile (tag),
    S2_sea_horse2 TEXT    REFERENCES profile (tag),
    nick          TEXT
);


-- Table: cPOIsnippets
CREATE TABLE cPOIsnippets (
    id      INTEGER PRIMARY KEY,
    code    TEXT    REFERENCES cPOI (code),
    snippet TEXT
);


-- Table: cSET
CREATE TABLE cSET (
    id    INTEGER PRIMARY KEY,
    niche TEXT    REFERENCES cNiche (tag),
    POI   TEXT    REFERENCES cPOI (code) 
);


-- Table: ESwivl_profile_deploy
CREATE TABLE ESwivl_profile_deploy (
    tag                   TEXT    PRIMARY KEY,
    victoriaCROWNEDpigeon TEXT,
    reach                 TEXT,
    z1                    TEXT    REFERENCES profile_accounts_z1 (tag),
    z1bis                 TEXT    REFERENCES profile_accounts_z1 (tag),
    z2                    TEXT    REFERENCES profile_accounts_z2 (tag),
    z4                    TEXT    REFERENCES profile_accounts_z4 (tag),
    bis1                  INTEGER REFERENCES SM_strat (id),
    elm                   TEXT
);


-- Table: ESwivl_reach
CREATE TABLE ESwivl_reach (
    id          INTEGER PRIMARY KEY,
    reach_vMark TEXT,
    type        TEXT,
    subSET_desc TEXT,
    device      TEXT    REFERENCES zsys_device (taghname) 
);


-- Table: etype
CREATE TABLE etype (
    tag     TEXT    PRIMARY KEY,
    is_pipe BOOLEAN
);


-- Table: media
CREATE TABLE media (
    id                 INTEGER PRIMARY KEY,
    file               TEXT,
    array              INTEGER,
    muse               TEXT    REFERENCES muse (tag) MATCH [FULL],
    etype              TEXT    REFERENCES etype (tag) MATCH [FULL],
    bundle             TEXT    REFERENCES bundle (tag) MATCH [FULL],
    POI                TEXT    REFERENCES cPOI (code) MATCH [FULL],
    wlink              INTEGER REFERENCES wlink (id) MATCH [FULL],
    link               TEXT,
    profile1           TEXT    REFERENCES profile (tag) MATCH [FULL],
    profile2           TEXT    REFERENCES profile (tag) MATCH [FULL],
    privacy_reviewed   BOOLEAN,
    altered_has_source BOOLEAN,
    author             TEXT,
    title              TEXT,
    date               DATE,
    title_LANG         TEXT,
    description        TEXT,
    description_LANG   TEXT,
    location           TEXT,
    location_LANG      TEXT,
    terms              INTEGER REFERENCES terms (id) 
);


-- Table: media_quickinfo
CREATE TABLE media_quickinfo (
    id        INTEGER PRIMARY KEY,
    file      TEXT,
    quickinfo TEXT
);


-- Table: mopSET
CREATE TABLE mopSET (
    id    INTEGER PRIMARY KEY,
    [set] INTEGER,
    wlink INTEGER REFERENCES wlink (id) 
);


-- Table: mtheme
CREATE TABLE mtheme (
    tag TEXT PRIMARY KEY
)
WITHOUT ROWID;


-- Table: muse
CREATE TABLE muse (
    tag     TEXT    PRIMARY KEY,
    dir     TEXT,
    is_pipe BOOLEAN
)
WITHOUT ROWID;


-- Table: page
CREATE TABLE page (
    id            INTEGER PRIMARY KEY,
    src           INTEGER REFERENCES page (id) MATCH [FULL],
    link          INTEGER,
    name          TEXT,
    disclose_code TEXT
);


-- Table: page_links
CREATE TABLE page_links (
    id     INTEGER PRIMARY KEY,
    type   STRING,
    url    STRING,
    link   INTEGER,
    [desc] TEXT
);


-- Table: pcritic_landing
CREATE TABLE pcritic_landing (
    tag                 TEXT    PRIMARY KEY,
    or_PUB_landing_page INTEGER REFERENCES PUB_landing_page (id),
    or_page             INTEGER REFERENCES page (id),
    or_wlinklog         DATE    REFERENCES wlinklog (sent),
    or_cPOIlink         INTEGER REFERENCES cPOIlinks (id),
    or_wlink            INTEGER REFERENCES wlink (id),
    or_wrolelog         DATE    REFERENCES wrolelog (sent),
    or_wbuffer          INTEGER REFERENCES wbuffer (id),
    [desc]              TEXT
);


-- Table: pdist
CREATE TABLE pdist (
    id      INTEGER PRIMARY KEY,
    src     INTEGER REFERENCES pdist (id),
    posting INTEGER REFERENCES posting (id),
    wlink   INTEGER REFERENCES wlink (id),
    page    INTEGER REFERENCES page (id),
    profile TEXT    REFERENCES profile (tag),
    heading TEXT,
    sent    DATE,
    n       INTEGER
);


-- Table: posting
CREATE TABLE posting (
    id             INTEGER PRIMARY KEY,
    src            INTEGER REFERENCES posting (id) MATCH [FULL],
    purview        INTEGER REFERENCES SM_purview (id),
    page           INTEGER REFERENCES page (id) MATCH [FULL],
    profile        TEXT    REFERENCES profile (tag) MATCH [FULL],
    content        TEXT,
    content_LANG   TEXT,
    whtagset       INTEGER REFERENCES whtagset (id),
    banter         TEXT    REFERENCES banter (tag) MATCH [FULL],
    media          INTEGER REFERENCES media (id) MATCH [FULL],
    wlink          INTEGER REFERENCES wlink (id) MATCH [FULL],
    sent           DATE,
    n              INTEGER,
    removed        BOOLEAN,
    param_pv       TEXT,
    param_xurl     TEXT,
    param_xurln    TEXT,
    sellable       BOOLEAN,
    add_impressum  BOOLEAN,
    up_branded     INTEGER REFERENCES posting_BRANDING (id),
    enough_boost   BOOLEAN,
    enough_kanon   BOOLEAN,
    fixedORreimage BOOLEAN
);


-- Table: posting_BRANDING
CREATE TABLE posting_BRANDING (
    id      INTEGER PRIMARY KEY,
    bitpart TEXT,
    [desc]  TEXT
);


-- Table: posting_RESOURCES
CREATE TABLE posting_RESOURCES (
    ID               INTEGER PRIMARY KEY,
    stream           TEXT,
    post             INTEGER REFERENCES posting (id),
    mopC             INTEGER REFERENCES resources_CAPTURE (id),
    mopC2            INTEGER REFERENCES resources_CAPTURE (id),
    ingest_reason    TEXT,
    sauceCredits     TEXT,
    obsidian         TEXT,
    markedGUID       TEXT,
    processes        TEXT,
    audioMax         TEXT,
    audioLevel       TEXT,
    defects          TEXT,
    workingSET       BOOLEAN,
    audioInfoProcess TEXT,
    videoInfoProcess TEXT,
    projectSTD       TEXT,
    processOUT       TEXT,
    outInfoProcess   TEXT,
    ReleasedFolder   TEXT
);


-- Table: posting_skipped
CREATE TABLE posting_skipped (
    id          INTEGER PRIMARY KEY,
    posting_src INTEGER REFERENCES posting (id),
    purview     INTEGER REFERENCES SM_purview (id),
    reason      TEXT
);


-- Table: profile
CREATE TABLE profile (
    tag             TEXT    PRIMARY KEY
                            COLLATE NOCASE,
    next            TEXT    REFERENCES profile (tag) MATCH [FULL],
    [set]           TEXT,
    zone            INTEGER,
    s3A_horse       TEXT,
    mopset          INTEGER REFERENCES mopSET (id),
    reviewD         DATE,
    oYysterToadfish TEXT    REFERENCES profile (tag),
    deleteD         DATE,
    dConfirmd       BOOLEAN,
    HISTORIK        TEXT
);


-- Table: profile_accounts_KAnon_Restricted_sitelist
CREATE TABLE profile_accounts_KAnon_Restricted_sitelist (
    id                INTEGER PRIMARY KEY
                              REFERENCES profile_accounts_sitelist (id),
    REQ_EXPOSURE      TEXT    REFERENCES profile_sites_REQ_EXPOSURE (tag),
    desc_action_route TEXT,
    achieveD          DATE,
    secured_findings  TEXT,
    deadline_outD     DATE,
    revised_md5       STRING
);


-- Table: profile_accounts_sitelist
CREATE TABLE profile_accounts_sitelist (
    id                   INTEGER PRIMARY KEY,
    profile              TEXT    REFERENCES profile (tag),
    login                TEXT,
    fairy_flycatcher     BOOLEAN,
    number               TEXT    REFERENCES SIM_w (tag),
    password             TEXT,
    site                 TEXT,
    name                 TEXT,
    info_location        TEXT,
    qual                 INTEGER,
    blacklisted          BOOLEAN,
    black_site           TEXT,
    paid_accountableID   INTEGER REFERENCES ACCOUNT_Funds (id),
    paid_accountableCard INTEGER REFERENCES ACCOUNT_Card (id),
    accountable_defects  TEXT,
    paid_PayPal          BOOLEAN,
    paid_BTC             BOOLEAN
);


-- Table: profile_accounts_sitelist_loginURL
CREATE TABLE profile_accounts_sitelist_loginURL (
    id  INTEGER PRIMARY KEY
                REFERENCES profile_accounts_sitelist (id),
    url TEXT
);


-- Table: profile_accounts_z1
CREATE TABLE profile_accounts_z1 (
    tag                   TEXT    PRIMARY KEY
                                  REFERENCES profile (tag),
    strat_strict_elm      BOOLEAN,
    ct_flycatcher         DATE,
    ct_angelfish          TEXT    REFERENCES SIM_w (tag),
    ct_grouper            TEXT,
    ct_hemlock            TEXT,
    hemlock_cherry_slateD DATE,
    ct_hemlock_backed_by  TEXT,
    ct_oak                TEXT,
    ct_ginko              TEXT,
    strat_unlock_set1     TEXT    REFERENCES profile (tag),
    strat_unlock_set2     TEXT    REFERENCES profile (tag),
    strat_unlock_set3     TEXT    REFERENCES profile (tag),
    ct_password           TEXT,
    [two-factor]          TEXT,
    [ct_securityq&a]      TEXT,
    ct_fir                TEXT
);


-- Table: profile_accounts_z2
CREATE TABLE profile_accounts_z2 (
    tag                   TEXT    PRIMARY KEY
                                  REFERENCES profile (tag),
    strat_strict_elm      BOOLEAN,
    ct_flycatcher         DATE,
    ct_angelfish          TEXT    REFERENCES SIM_w (tag),
    ct_hemlock            TEXT,
    hemlock_cherry_slateD DATE,
    ct_hemlock_backed_by  TEXT,
    ct_oak                TEXT,
    ct_maple              TEXT,
    ct_password           TEXT,
    [ct_securityq&a]      TEXT
);


-- Table: profile_accounts_z4
CREATE TABLE profile_accounts_z4 (
    tag                  TEXT    PRIMARY KEY
                                 REFERENCES profile (tag),
    strat_strict_elm     BOOLEAN,
    ct_flycatcher        DATE,
    ct_angelfish         TEXT    REFERENCES SIM_w (tag),
    ct_baobab            TEXT,
    baobab_cherry_slateD DATE,
    ct_pine              TEXT,
    ct_xine_backed_by    TEXT,
    ct_juniper           TEXT,
    ct_fir               TEXT,
    ct_password          TEXT,
    [ct_securityq&a]     TEXT
);


-- Table: profile_disclose_pool
CREATE TABLE profile_disclose_pool (
    tag         TEXT REFERENCES profile (tag) 
                     PRIMARY KEY,
    name        TEXT,
    info_spruce TEXT
);


-- Table: profile_SEMANTIC_Goals_z1
CREATE TABLE profile_SEMANTIC_Goals_z1 (
    tag                   TEXT    PRIMARY KEY
                                  REFERENCES profile_accounts_z1 (tag),
    magnolia_goal         TEXT,
    magnoliaCredentials   TEXT,
    magnolia_trace        DATE,
    willow_g_full         DATE,
    willow_no_rF_required DATE,
    clownfish             DATE,
    sunfish_p             DATE,
    sunfish_t             BOOLEAN,
    sunfish_s_f_c         BOOLEAN,
    tuna_l_d              DATE,
    tuna_f_r_d            BOOLEAN,
    description           TEXT
);


-- Table: profile_SEMANTIC_Goals_z4
CREATE TABLE profile_SEMANTIC_Goals_z4 (
    tag                 TEXT PRIMARY KEY
                             REFERENCES profile_accounts_z4 (tag),
    magnolia_goal       TEXT,
    magnoliaCredentials TEXT,
    magnolia_trace      DATE,
    description         TEXT
);


-- Table: profile_sites
CREATE TABLE profile_sites (
    id      INTEGER PRIMARY KEY,
    site    TEXT,
    holding TEXT,
    [order] INTEGER
);


-- Table: profile_sites_REQ_EXPOSURE
CREATE TABLE profile_sites_REQ_EXPOSURE (
    tag                  TEXT PRIMARY KEY,
    [desc]               TEXT,
    known_data_collected TEXT
);


-- Table: profile_TRACE_z1
CREATE TABLE profile_TRACE_z1 (
    id                         INTEGER PRIMARY KEY,
    tag                        TEXT    REFERENCES profile_accounts_z1 (tag),
    ip                         TEXT,
    spruce                     TEXT,
    system                     TEXT,
    safe_login                 BOOLEAN DEFAULT (1),
    barracuda_inactive_session BOOLEAN
);


-- Table: profileKeywords
CREATE TABLE profileKeywords (
    id                INTEGER PRIMARY KEY,
    src               INTEGER REFERENCES profileKeywords (id),
    src2_junction     INTEGER REFERENCES profileKeywords (id),
    keywords          TEXT,
    flycatcher_before BOOLEAN,
    dir               TEXT,
    [desc]            TEXT,
    fading            BOOLEAN
);


-- Table: PUB_landing_page
CREATE TABLE PUB_landing_page (
    id        INTEGER PRIMARY KEY,
    active    BOOLEAN,
    publisher TEXT    REFERENCES PUB_publisher (tag),
    affiliate INTEGER REFERENCES wlink (id),
    essay     TEXT,
    page      INTEGER REFERENCES page (id) 
);


-- Table: PUB_milestone
CREATE TABLE PUB_milestone (
    id          INTEGER PRIMARY KEY,
    essay       TEXT,
    tag         TEXT,
    achieved    DATE,
    version     TEXT,
    l_Citations TEXT,
    l_Images    TEXT,
    l_Brands    TEXT,
    l_Fonts     TEXT,
    full_DRM    TEXT,
    [desc]      TEXT
);


-- Table: PUB_publisher
CREATE TABLE PUB_publisher (
    tag              TEXT    PRIMARY KEY,
    ACCOUNT          BOOLEAN,
    proc             TEXT,
    DRM              BOOLEAN,
    gen_fork_version TEXT,
    runme            TEXT
);


-- Table: PUB_submission
CREATE TABLE PUB_submission (
    id             INTEGER PRIMARY KEY,
    entry          DATE,
    publisher      TEXT    REFERENCES PUB_publisher (tag),
    affiliate      INTEGER REFERENCES wlink (id),
    essay          TEXT,
    version        TEXT,
    cover          TEXT,
    copyw_pitch    TEXT,
    keywords       TEXT,
    categories     TEXT,
    price          DECIMAL,
    price_currency TEXT,
    paperb_pitch   TEXT,
    ISBN           TEXT,
    previewed      BOOLEAN,
    inspected      BOOLEAN,
    postviewed     BOOLEAN,
    removed        BOOLEAN,
    defects        TEXT
);


-- Table: PUB_title
CREATE TABLE PUB_title (
    id         INTEGER PRIMARY KEY,
    creation   DATE,
    essay      TEXT,
    wersion    BOOLEAN,
    type       TEXT,
    ASIN       TEXT,
    author     TEXT,
    withdrawed BOOLEAN,
    title_LANG TEXT,
    title_EN   TEXT
);


-- Table: resources_CAPTURE
CREATE TABLE resources_CAPTURE (
    id             INTEGER PRIMARY KEY,
    stream         TEXT,
    procedure      TEXT,
    procUpdatedTo  DATE,
    defects        TEXT,
    legacy         BOOLEAN,
    [cutting-edge] BOOLEAN
);


-- Table: scene_profile
CREATE TABLE scene_profile (
    tag       TEXT REFERENCES profile (tag),
    spruces   TEXT,
    interests TEXT
);


-- Table: scene_seek
CREATE TABLE scene_seek (
    id       INTEGER PRIMARY KEY,
    src      INTEGER REFERENCES scene_seek (id),
    keywords TEXT,
    link     TEXT
);


-- Table: SIM_w
CREATE TABLE SIM_w (
    tag                           TEXT    PRIMARY KEY
                                          REFERENCES profile (tag),
    greatTIT                      STRING,
    KAKapo                        STRING,
    name_apps                     TEXT,
    swordfish_2_min               DATE,
    Varanasi_V                    TEXT,
    device                        TEXT    REFERENCES zsys_device (taghname),
    device_dual                   BOOLEAN,
    hoatzin_valid                 BOOLEAN,
    pufferFISH_pending            BOOLEAN,
    hoatzin_closed                BOOLEAN,
    shoebill_clean                BOOLEAN,
    shoebill_clowning_1month      DATE,
    shoebill_auto_clowned_6months BOOLEAN,
    toadfish_and_clownfish        BOOLEAN,
    lost_unknown                  BOOLEAN,
    constraints                   TEXT,
    Lion_FISH                     BOOLEAN,
    Lion_FISH_indirect_grouper    BOOLEAN,
    Dolphinfish_Mahi2             BOOLEAN,
    real_info                     STRING,
    provider                      TEXT,
    net_Whole_dealer              TEXT,
    net_dealerAbuse_blocked       BOOLEAN,
    qual                          INTEGER
);


-- Table: SM_overbooking
CREATE TABLE SM_overbooking (
    id            INTEGER PRIMARY KEY,
    SM_channel    INTEGER REFERENCES SM_strat (id),
    output_effect TEXT,
    cond          TEXT,
    grip          INTEGER
);


-- Table: SM_purview
CREATE TABLE SM_purview (
    id               INTEGER PRIMARY KEY,
    src              INTEGER REFERENCES SM_purview (id),
    SM_channel       INTEGER REFERENCES SM_strat (id),
    page                     REFERENCES page (id),
    output_stream    TEXT,
    critic           BOOLEAN,
    inheritance_cond TEXT
);


-- Table: SM_strat
CREATE TABLE SM_strat (
    id           INTEGER PRIMARY KEY,
    level        INTEGER,
    [order]      DECIMAL,
    use_SIM      TEXT    REFERENCES SIM_w (tag),
    hash_SIM     TEXT    REFERENCES SIM_w (tag),
    use_profile  TEXT    REFERENCES profile (tag),
    branding     INTEGER REFERENCES profileKeywords (id),
    platform     TEXT,
    kms          INTEGER,
    constraints  TEXT,
    safe_deleted BOOLEAN
);


-- Table: SM_strat_level_info
CREATE TABLE SM_strat_level_info (
    level      INTEGER PRIMARY KEY,
    [desc]     TEXT,
    is_purview BOOLEAN
);


-- Table: terms
CREATE TABLE terms (
    id        INTEGER PRIMARY KEY,
    free      BOOLEAN,
    [order]   DECIMAL,
    [desc]    TEXT,
    impressum TEXT,
    safe_use  TEXT
);


-- Table: terms_objections
CREATE TABLE terms_objections (
    id        INTEGER PRIMARY KEY,
    media     INTEGER REFERENCES media (id),
    objection TEXT
);


-- Table: unknownIDsPhrases
CREATE TABLE unknownIDsPhrases (
    id                INTEGER PRIMARY KEY,
    src               INTEGER REFERENCES unknownIDsPhrases (id),
    keywords          TEXT,
    [stalker-unknown] BOOLEAN,
    [desc]            TEXT
);


-- Table: wbuffer
CREATE TABLE wbuffer (
    id                 INTEGER PRIMARY KEY,
    src                INTEGER REFERENCES wbuffer (id),
    [desc]             TEXT,
    all_SUBS           BOOLEAN,
    link               TEXT,
    wbufferuse         TEXT    REFERENCES wbufferuse (tag),
    profile            TEXT    REFERENCES profile (tag),
    interests          TEXT,
    safe_DHV_patrimony BOOLEAN
);


-- Table: wbuffer_app
CREATE TABLE wbuffer_app (
    id                 INTEGER PRIMARY KEY,
    src                INTEGER REFERENCES wbuffer_app (id),
    [desc]             TEXT,
    all_SUBS           BOOLEAN,
    site               TEXT,
    POI                TEXT    REFERENCES cPOI (code),
    quickname          TEXT,
    profile            TEXT    REFERENCES profile (tag),
    safe_DHV_patrimony BOOLEAN,
    safe_Withdraw      BOOLEAN
);


-- Table: wbuffer_biz
CREATE TABLE wbuffer_biz (
    id                 INTEGER PRIMARY KEY,
    src                INTEGER REFERENCES wbuffer_biz (id),
    [desc]             TEXT,
    all_SUBS           BOOLEAN,
    link               TEXT,
    safe_Withdraw      BOOLEAN,
    profile            TEXT    REFERENCES profile (tag),
    safe_DHV_patrimony BOOLEAN
);


-- Table: wbuffer_biz_lateral
CREATE TABLE wbuffer_biz_lateral (
    id              INTEGER PRIMARY KEY,
    wbuffer         INTEGER REFERENCES wbuffer_biz (id),
    reaction_bylink TEXT
);


-- Table: wbufferuse
CREATE TABLE wbufferuse (
    tag    TEXT PRIMARY KEY,
    [desc] TEXT
);


-- Table: wdist
CREATE TABLE wdist (
    id      INTEGER PRIMARY KEY,
    src     INTEGER REFERENCES wdist (id),
    wlink   INTEGER REFERENCES wlink (id),
    profile TEXT    REFERENCES profile (tag),
    bitpart TEXT,
    POI     TEXT    REFERENCES cPOI (code),
    niche   TEXT    REFERENCES cNiche (tag),
    sent    DATE
);


-- Table: whashtag
CREATE TABLE whashtag (
    tag    TEXT,
    [set]  INTEGER REFERENCES whtagset (id),
    [desc] TEXT,
    PRIMARY KEY (
        tag,
        [set]
    )
);


-- Table: whtagset
CREATE TABLE whtagset (
    id       INTEGER PRIMARY KEY,
    profile1 TEXT    REFERENCES profile (tag) 
)
WITHOUT ROWID;


-- Table: wlink
CREATE TABLE wlink (
    id         INTEGER PRIMARY KEY,
    src        INTEGER REFERENCES wlink (id) MATCH [FULL],
    name       TEXT,
    lang       TEXT,
    link       TEXT,
    compliance INTEGER,
    wlinkuse   TEXT    REFERENCES wlinkuse (tag) MATCH [FULL],
    etype      TEXT    REFERENCES etype (tag) MATCH [FULL],
    mtheme     TEXT    REFERENCES mtheme (tag) MATCH [FULL],
    bundle     TEXT    REFERENCES bundle (tag) MATCH [FULL],
    profile1   TEXT    REFERENCES profile (tag) MATCH [FULL],
    profile2   TEXT    REFERENCES profile (tag) MATCH [FULL],
    terms      INTEGER REFERENCES terms (id) MATCH [FULL],
    POI1       STRING  REFERENCES cPOI (code) MATCH [FULL],
    POI2       STRING  REFERENCES cPOI (code) MATCH [FULL]
);


-- Table: wlinklog
CREATE TABLE wlinklog (
    sent     DATE PRIMARY KEY,
    link     TEXT,
    wlinkuse TEXT REFERENCES wlinkuse (tag) 
);


-- Table: wlinkuse
CREATE TABLE wlinkuse (
    tag     TEXT    PRIMARY KEY,
    is_POI  BOOLEAN,
    [desc]  TEXT,
    is_pipe BOOLEAN
)
WITHOUT ROWID;


-- Table: wsnippet
CREATE TABLE wsnippet (
    id      INTEGER PRIMARY KEY,
    wlink   INTEGER REFERENCES wlink (id) MATCH [FULL],
    snippet TEXT
);


-- Table: zcloud_INDEX
CREATE TABLE zcloud_INDEX (
    id                 INTEGER PRIMARY KEY,
    task               TEXT    REFERENCES zcloud_task (tag),
    info               TEXT,
    storage            TEXT,
    file_itype         TEXT    REFERENCES zcloud_indextype (tag),
    milestone          DATE,
    search_line        TEXT,
    or_BIGline         INTEGER,
    or_little_Full2pos INTEGER,
    site               INTEGER REFERENCES profile_accounts_sitelist (id) 
);


-- Table: zcloud_indextype
CREATE TABLE zcloud_indextype (
    tag    TEXT PRIMARY KEY,
    [desc] TEXT
);


-- Table: zcloud_task
CREATE TABLE zcloud_task (
    tag    TEXT PRIMARY KEY,
    [desc] TEXT,
    method TEXT REFERENCES zsysDownloads (tag) 
);


-- Table: zcloud_task_of__SHADOWFULLLEGAL_RIPPING_OWN_SVC01_hypen
CREATE TABLE zcloud_task_of__SHADOWFULLLEGAL_RIPPING_OWN_SVC01_hypen (
    LIST                         TEXT    PRIMARY KEY,
    UMA                          BOOLEAN,
    URA                          BOOLEAN,
    hypen                        TEXT,
    hypenB                       TEXT,
    ingest_reason                TEXT,
    subjetive_rating             TEXT,
    self_critical_session_rating DECIMAL,
    Phoneshoot                   BOOLEAN,
    processes                    TEXT,
    audioMax                     TEXT,
    audioLevel                   TEXT
);


-- Table: zcloud_task_of__SHADOWFULLLEGAL_RIPPING_OWN_SVC01_PREsection
CREATE TABLE zcloud_task_of__SHADOWFULLLEGAL_RIPPING_OWN_SVC01_PREsection (
    id         INTEGER PRIMARY KEY,
    LIST       TEXT    REFERENCES zcloud_task_of__SHADOWFULLLEGAL_RIPPING_OWN_SVC01_hypen (LIST),
    track      INTEGER,
    processes  TEXT,
    audioMax   TEXT,
    audioLevel TEXT,
    reason     TEXT
);


-- Table: zmOOd
CREATE TABLE zmOOd (
    tag    TEXT PRIMARY KEY,
    [desc] TEXT
);


-- Table: zMUSIC
CREATE TABLE zMUSIC (
    id                   INTEGER PRIMARY KEY,
    INFO_sessionNotMusic BOOLEAN,
    title                TEXT,
    artist               TEXT,
    live                 BOOLEAN,
    album                TEXT,
    cover                BOOLEAN,
    original_artist      TEXT,
    profile_affinity     TEXT    REFERENCES profile (tag),
    sent                 BOOLEAN,
    date                 DATE,
    track                INTEGER,
    local_path           TEXT,
    start_millisecond    DATE,
    stop_millisecond     DATE,
    url                  TEXT,
    [desc]               TEXT
);


-- Table: zMUSIC_segment
CREATE TABLE zMUSIC_segment (
    id                INTEGER PRIMARY KEY,
    record            INTEGER REFERENCES zMUSIC (id),
    start_millisecond DATE,
    stop_millisecond  DATE,
    mOOd1             TEXT    REFERENCES zmOOd (tag),
    mOOd1_10level     DECIMAL,
    [desc]            TEXT
);


-- Table: zMUSIC_session
CREATE TABLE zMUSIC_session (
    id                         INTEGER PRIMARY KEY,
    name                       TEXT,
    condensed                  DATE,
    historikTrue1_orProjected0 BOOLEAN,
    based_onChennaI            BOOLEAN,
    based_onLIVE01CAP          TEXT    REFERENCES zcloud_task_of__SHADOWFULLLEGAL_RIPPING_OWN_SVC01_hypen (LIST),
    needs_ExpansionEdit        BOOLEAN
);


-- Table: zMUSIC_session_lists
CREATE TABLE zMUSIC_session_lists (
    id                   INTEGER PRIMARY KEY,
    session              INTEGER REFERENCES zMUSIC_session (id),
    [order]              INTEGER,
    included_inSVC01     TEXT    REFERENCES zcloud_task_of__SHADOWFULLLEGAL_RIPPING_OWN_SVC01_hypen (LIST),
    segment              INTEGER REFERENCES zMUSIC_segment (id),
    or_song              INTEGER REFERENCES zMUSIC (id),
    redundant_quicktitle TEXT
);


-- Table: zsys__devicePhysicalAttr
CREATE TABLE zsys__devicePhysicalAttr (
    taghname       TEXT    PRIMARY KEY
                           REFERENCES zsys_device (taghname),
    region         TEXT,
    country        TEXT,
    own_place_leaf TEXT    REFERENCES zsys__devicePhysicalAttr_own_place (taghname),
    labeled        BOOLEAN
);


-- Table: zsys__devicePhysicalAttr_own_place
CREATE TABLE zsys__devicePhysicalAttr_own_place (
    taghname          TEXT    PRIMARY KEY,
    master_department TEXT    REFERENCES zsys__devicePhysicalAttr_own_place (taghname),
    own_place_desc    TEXT    UNIQUE,
    physical_locked   BOOLEAN
);


-- Table: zsys_ailleurs_deviceGateway
CREATE TABLE zsys_ailleurs_deviceGateway (
    vpn          TEXT    PRIMARY KEY,
    gateway      TEXT    REFERENCES zsys_deviceGateway (tagname),
    magnolia     TEXT,
    alerce       INTEGER REFERENCES ACCOUNT_Accruals (id),
    site_account INTEGER REFERENCES profile_accounts_sitelist (id),
    info_url     TEXT,
    datafile     TEXT,
    [desc]       TEXT
);


-- Table: zsys_device
CREATE TABLE zsys_device (
    taghname      TEXT    PRIMARY KEY,
    platform      TEXT,
    system        TEXT    REFERENCES zsys_system (tag),
    grant_inet    BOOLEAN,
    grant_pdata   BOOLEAN,
    ip            TEXT,
    qual          INTEGER,
    role_reviewed BOOLEAN,
    steady        DATE,
    antivirus     DATE,
    backup        DATE,
    user          TEXT    REFERENCES zsys_user (username),
    userALT       TEXT    REFERENCES zsys_user (username),
    defects       TEXT,
    terminated    DATE,
    vintage       BOOLEAN
);


-- Table: zsys_device_authenticator
CREATE TABLE zsys_device_authenticator (
    taghname TEXT    REFERENCES zsys_device (taghname),
    holding  TEXT,
    site     INTEGER REFERENCES profile_accounts_sitelist (id) 
);


-- Table: zsys_device_backup
CREATE TABLE zsys_device_backup (
    id             INTEGER PRIMARY KEY,
    taghname       TEXT    REFERENCES zsys_device (taghname),
    schemaName     TEXT,
    included       TEXT,
    software       TEXT,
    encryption     TEXT,
    fs             TEXT,
    syncedToOrigin DATE,
    zeroed         DATE,
    postverified   DATE,
    drive          CHAR,
    driveBefore    CHAR,
    [desc]         TEXT
);


-- Table: zsys_device_backup_asset_extended
CREATE TABLE zsys_device_backup_asset_extended (
    id                             INTEGER PRIMARY KEY,
    asset                          TEXT,
    asset_antisurge_level          TEXT,
    current_dir                    TEXT,
    dir_cannonical                 TEXT,
    target_base                    TEXT,
    encrypted                      BOOLEAN,
    optical1                       TEXT    REFERENCES zsys__devicePhysicalAttr (taghname),
    optical2                       TEXT    REFERENCES zsys__devicePhysicalAttr (taghname),
    optical3                       TEXT    REFERENCES zsys__devicePhysicalAttr (taghname),
    other                          TEXT    REFERENCES zsys__devicePhysicalAttr (taghname),
    cloud1                         INTEGER REFERENCES profile_accounts_sitelist (id),
    cloud2                         INTEGER REFERENCES profile_accounts_sitelist (id),
    cloud3                         INTEGER REFERENCES profile_accounts_sitelist (id),
    safe_Exposed                   BOOLEAN,
    syncedToOrigin                 DATE,
    password_natural               TEXT    REFERENCES zsys_user_password (password_class),
    password_extra4cloud_zerotrust TEXT    REFERENCES zsys_user_password (password_class),
    url                            STRING,
    content                        TEXT
);


-- Table: zsys_device_module
CREATE TABLE zsys_device_module (
    taghname    TEXT REFERENCES zsys_device (taghname),
    module      TEXT,
    upgraded_at DATE
);


-- Table: zsys_device_package
CREATE TABLE zsys_device_package (
    taghname     TEXT    REFERENCES zsys_device (taghname),
    package      INTEGER REFERENCES zsys_package (id),
    install_type TEXT
);


-- Table: zsys_device_role
CREATE TABLE zsys_device_role (
    taghname    TEXT REFERENCES zsys_device (taghname),
    role        TEXT REFERENCES zsys_role (tag),
    limits      TEXT,
    reviewed_at DATE
);


-- Table: zsys_device_sata
CREATE TABLE zsys_device_sata (
    id             INTEGER PRIMARY KEY,
    sata_0N        INTEGER,
    device_nominal TEXT    REFERENCES zsys_device (taghname),
    device         TEXT    REFERENCES zsys_device (taghname),
    [desc]         TEXT
);


-- Table: zsys_device_software_deployment
CREATE TABLE zsys_device_software_deployment (
    taghname    TEXT REFERENCES zsys_device (taghname),
    deployment  TEXT,
    upgraded_at DATE
);


-- Table: zsys_deviceGateway
CREATE TABLE zsys_deviceGateway (
    tagname       TEXT    PRIMARY KEY
                          REFERENCES zsys_device (taghname),
    maintenance   BOOLEAN,
    localNet_only BOOLEAN,
    ailleurs_CFG  TEXT    REFERENCES zsys_ailleurs_deviceGateway (vpn),
    [desc]        TEXT
);


-- Table: zsys_dir
CREATE TABLE zsys_dir (
    id      INTEGER PRIMARY KEY,
    [order] DECIMAL,
    dir     TEXT,
    root    BOOLEAN,
    special BOOLEAN,
    tag     BOOLEAN
);

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         1,
                         1,
                         '[Internet]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         2,
                         2,
                         '[Network]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         3,
                         3,
                         '[Multimedia]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         4,
                         4,
                         '[Design]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         5,
                         5,
                         '[Music]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         6,
                         6,
                         '[Science]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         7,
                         7,
                         '[Office]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         8,
                         8,
                         '[Text editors]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         9,
                         9,
                         '[Programming]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         10,
                         10,
                         '[Data-Science]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         11,
                         11,
                         '[System]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         12,
                         12,
                         '[Shells]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         13,
                         13,
                         '[Window managers]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         14,
                         14,
                         'Vintage',
                         NULL,
                         1,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         15,
                         15,
                         'Juegos',
                         NULL,
                         1,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         16,
                         16,
                         '[PLATFORM]',
                         NULL,
                         1,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         17,
                         3.9,
                         '[Demoscene & Audiovisual]',
                         NULL,
                         1,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         18,
                         9.3,
                         'Web',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         19,
                         3.1,
                         'image',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         20,
                         4.3,
                         'layered-editor',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         21,
                         11.8,
                         'elastic-search',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         22,
                         7.1,
                         'text-processor',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         23,
                         9.2,
                         'IDE-selfhosted-lang',
                         NULL,
                         1,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         24,
                         9.1,
                         'IDE',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         25,
                         7.4,
                         '[Knowledge base]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         26,
                         7.3,
                         'writing-assistant',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         27,
                         9.7,
                         '[P-Libraries]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         28,
                         10.5,
                         'decision-course-aid',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         29,
                         11.61,
                         'diff-merge',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         30,
                         11.1,
                         '[Framework]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         31,
                         11.3,
                         '[Containers]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         32,
                         11.2,
                         '[Monitoring]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         33,
                         11.4,
                         '[Compressors]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         34,
                         11.5,
                         '[Encryption]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         35,
                         11.6,
                         '[Sync]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         36,
                         11.62,
                         'mirror-backup',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         37,
                         11.92,
                         '[Network-Security]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         38,
                         11.921,
                         'firewall',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         39,
                         11.922,
                         'vpn',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         40,
                         11.7,
                         'explorer',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         41,
                         11.31,
                         '[VMs]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         42,
                         12.1,
                         '[Scripting-tools]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         43,
                         10.1,
                         '[DBs]',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         44,
                         10.3,
                         '[DB-analysis]',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         45,
                         10.6,
                         '[Line-parsers]',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         46,
                         10.4,
                         '[Data-mining]',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         47,
                         10.2,
                         '[Data-browsers]',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         48,
                         4.4,
                         'diagram',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         49,
                         7.2,
                         'presentations',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         50,
                         3.3,
                         'streaming-cast',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         51,
                         4.5,
                         'node-editor',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         52,
                         11.923,
                         'pentesting',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         53,
                         11.924,
                         'forensics',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         54,
                         1.9,
                         'crawler',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         55,
                         7.5,
                         'spreadsheet',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         56,
                         5.1,
                         'MIDI',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         57,
                         5.2,
                         'DAW',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         58,
                         7.6,
                         'pub-reader',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         59,
                         11.63,
                         '[Deployment]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         60,
                         13.1,
                         'HIDplus',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         61,
                         17,
                         'neural-deep-learning',
                         NULL,
                         NULL,
                         1
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         62,
                         9.4,
                         '[RAD]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         63,
                         3.2,
                         'audio',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         64,
                         3.5,
                         'effect',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         65,
                         3.6,
                         'codec',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         66,
                         3.4,
                         'gen',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         67,
                         14.1,
                         'emulator',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         68,
                         5.3,
                         'mod-tracker',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         69,
                         3.7,
                         'video-cut-editor',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         70,
                         5.4,
                         'mod-player',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         71,
                         9.9,
                         'disassembler',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         72,
                         9.8,
                         'compiler',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         73,
                         9.81,
                         'transpiler',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         74,
                         18,
                         'Educational',
                         NULL,
                         NULL,
                         1
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         75,
                         1.8,
                         'ripper',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         76,
                         8.1,
                         'DOS-like',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         77,
                         8.2,
                         'WordStar-like',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         78,
                         19,
                         '[Further]',
                         NULL,
                         1,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         79,
                         2.5,
                         'IRC',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         80,
                         11.9,
                         '[Security]',
                         1,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         81,
                         11.91,
                         'anti-virus',
                         NULL,
                         NULL,
                         NULL
                     );

INSERT INTO zsys_dir (
                         id,
                         [order],
                         dir,
                         root,
                         special,
                         tag
                     )
                     VALUES (
                         82,
                         7.7,
                         'natural-language-processing',
                         NULL,
                         NULL,
                         NULL
                     );


-- Table: zsys_game
CREATE TABLE zsys_game (
    id                  INTEGER PRIMARY KEY,
    W                   BOOLEAN,
    W_spent             DATE,
    franchise           TEXT,
    title               TEXT,
    fact_textbrand      TEXT,
    male0_orFemale1     BOOLEAN,
    aqRoSea             BOOLEAN,
    url                 TEXT,
    qual                INTEGER,
    device1             TEXT    REFERENCES zsys_device (taghname),
    steam_cloud         BOOLEAN,
    account1            INTEGER REFERENCES profile_accounts_sitelist (id),
    account1_bis        INTEGER REFERENCES profile_accounts_sitelist (id),
    device2             TEXT    REFERENCES zsys_device (taghname),
    steady              BOOLEAN,
    account_race2       INTEGER REFERENCES profile_accounts_sitelist (id),
    notes               TEXT,
    account_old_unknown INTEGER REFERENCES profile_accounts_sitelist (id) 
);


-- Table: zsys_license
CREATE TABLE zsys_license (
    tag            TEXT,
    [key]          TEXT,
    linked_profile TEXT    REFERENCES profile (tag),
    Offline_PRSVd  BOOLEAN,
    name           TEXT,
    platform       TEXT,
    used_device1   TEXT    REFERENCES zsys_device (taghname),
    used_device2   TEXT    REFERENCES zsys_device (taghname),
    used_device3   TEXT    REFERENCES zsys_device (taghname),
    used_device4   TEXT    REFERENCES zsys_device (taghname),
    used_device5   TEXT    REFERENCES zsys_device (taghname),
    limits         TEXT
);


-- Table: zsys_package
CREATE TABLE zsys_package (
    id                  INTEGER PRIMARY KEY,
    src                 INTEGER REFERENCES zsys_package (id),
    libOnly             BOOLEAN,
    name                TEXT,
    module              BOOLEAN,
    terminal            BOOLEAN,
    server              BOOLEAN,
    framework           TEXT,
    [config-7cc]        BOOLEAN,
    [Xcross-desktop]    BOOLEAN,
    dir                 TEXT,
    Golang              TEXT,
    [Windows-bin]       TEXT,
    debian              TEXT,
    ubuntu              TEXT,
    link                TEXT,
    [cvs-link]          TEXT,
    Snap                TEXT,
    docker              TEXT,
    Flatpack            TEXT,
    arch                TEXT,
    AUR                 TEXT,
    rpm                 TEXT,
    rpmARM              TEXT,
    EPEL                TEXT,
    [Homebrew-formulae] TEXT,
    cargo               TEXT,
    OctoPkg             TEXT,
    [Homebrew-cask]     TEXT,
    npm                 TEXT,
    pip                 TEXT,
    gem                 TEXT,
    AppImage            TEXT,
    MELPA               TEXT
);


-- Table: zsys_pdist_arch
CREATE TABLE zsys_pdist_arch (
    id           INTEGER PRIMARY KEY,
    arch         TEXT,
    distribution TEXT,
    preferred    BOOLEAN,
    limited      TEXT
);


-- Table: zsys_Restricted_device_deploy
CREATE TABLE zsys_Restricted_device_deploy (
    taghname          TEXT    REFERENCES zsys_device (taghname),
    NEG_detected      BOOLEAN,
    allowed_host      TEXT    REFERENCES zsys_device (taghname),
    local_ip          TEXT,
    allowed_gateway   TEXT    REFERENCES zsys_deviceGateway (tagname),
    with_allowed_SIM  TEXT    REFERENCES SIM_w (tag),
    constraints       TEXT,
    maintenance_only  BOOLEAN,
    allowed_enclosure TEXT    REFERENCES zsys__devicePhysicalAttr (taghname) 
);


-- Table: zsys_role
CREATE TABLE zsys_role (
    tag     TEXT PRIMARY KEY,
    syspref TEXT REFERENCES zsys_system (tag),
    [desc]  TEXT
);


-- Table: zsys_ssh
CREATE TABLE zsys_ssh (
    tag        TEXT PRIMARY KEY,
    passphrase TEXT
);


-- Table: zsys_ssh_user
CREATE TABLE zsys_ssh_user (
    ssh  TEXT REFERENCES zsys_ssh (tag),
    user TEXT REFERENCES zsys_user (username) 
);


-- Table: zsys_system
CREATE TABLE zsys_system (
    tag      TEXT    PRIMARY KEY,
    qual     INTEGER,
    support  DATE,
    type     TEXT,
    archpref TEXT
);

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Android 11',
                            10,
                            NULL,
                            'Android 11 or newer',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Endeavour OS',
                            8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Android 6.0.1',
                            2,
                            NULL,
                            'Android',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Windows XP',
                            7,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Windows 10',
                            10,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Ubuntu LTS',
                            8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Android 7.1.2',
                            6,
                            NULL,
                            'Android Nougat',
                            'armeabi-v7a'
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux MX',
                            8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Parrot OS',
                            7.6,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Bodhi Legacy',
                            7,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Mac OS X Tiger',
                            6,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Lubuntu',
                            8.2,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Android 5.1.1',
                            2,
                            NULL,
                            'Android',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Debian',
                            7,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DOS Windows 95B',
                            4,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Raspbian OS',
                            7,
                            NULL,
                            'Unix',
                            'aarch64'
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Android 4.1.2',
                            6,
                            NULL,
                            'Android Jelly Bean',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'NomadBSD',
                            8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Windows 8.1 x64',
                            7,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'FreeBSD',
                            8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Alma Linux',
                            7.6,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Rocky',
                            7,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Manjaro',
                            6,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux ARM Oracle',
                            8,
                            NULL,
                            'Unix',
                            'aarch64'
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Windows 11',
                            8,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Macrium WinPe 11',
                            8,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux openSUSE',
                            7.8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Android 9',
                            9,
                            NULL,
                            'Android',
                            'arm64-v8a'
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DOS IBM 6.30',
                            6,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DOS MS 6.22',
                            6,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DOS Windows ME',
                            5,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DOS PTS 2000',
                            3,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux openSUSE Leap',
                            8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'OpenVPN',
                            7,
                            NULL,
                            'Net',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DOS MS 3.3 AMSTRAD',
                            6,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DOS MS 3.31 OEM',
                            6,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DOS DR 6.0',
                            4,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux MX 32bits',
                            6,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Pop_OS',
                            9,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux EasyOS',
                            6.8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'WireGuard',
                            9,
                            NULL,
                            'Net',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Vanilla OS',
                            6.2,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Android 12',
                            9,
                            NULL,
                            'specific, for Android 12 or newer',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Bodhi',
                            8.6,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'Linux Alpine',
                            8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'NetBSD',
                            7.8,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'OpenBSD',
                            7.6,
                            NULL,
                            'Unix',
                            'riscv64'
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'RISC OS',
                            7,
                            NULL,
                            NULL,
                            'ARMv6'
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'DragonFly BSD',
                            8.2,
                            NULL,
                            'Unix',
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'ArcaOS',
                            7,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO zsys_system (
                            tag,
                            qual,
                            support,
                            type,
                            archpref
                        )
                        VALUES (
                            'OpenIndiana',
                            7.4,
                            NULL,
                            'Unix',
                            NULL
                        );


-- Table: zsys_user
CREATE TABLE zsys_user (
    username                   TEXT    PRIMARY KEY,
    password_class             TEXT,
    password                   TEXT,
    [root-side_password_class] TEXT,
    [root-side_password]       TEXT,
    domain                     TEXT,
    cloud_login                TEXT,
    disclose                   TEXT,
    locale                     TEXT,
    qual                       INTEGER
);


-- Table: zsys_user_password
CREATE TABLE zsys_user_password (
    password_class  TEXT PRIMARY KEY,
    password_reveal TEXT,
    [desc]          TEXT
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
